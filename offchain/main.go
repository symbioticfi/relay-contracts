package main

import (
	"context"
	"fmt"
	"log"
	"os"
	"os/signal"
	"path"
	"syscall"

	"offchain-middleware/bls"
	"offchain-middleware/cmd/signer"
	"offchain-middleware/eth"
	"offchain-middleware/network"
	"offchain-middleware/signing"
	"offchain-middleware/valset"

	"github.com/multiformats/go-multiaddr"
	"github.com/spf13/cobra"
	"github.com/spf13/viper"
)

var cfgFile string

// Config holds all application configuration
type Config struct {
	ListenAddr    string
	EthEndpoint   string   `mapstructure:"eth"`
	ContractAddr  string   `mapstructure:"contract"`
	EthPrivateKey []byte   `mapstructure:"eth-private-key"`
	BlsPrivateKey []byte   `mapstructure:"bls-private-key"`
	Peers         []string `mapstructure:"peers"`
}

// App represents the application and its components
type App struct {
	config Config
	signer *signer.SignerClient
}

// NewApp creates a new application instance with the provided configuration
func NewApp(config Config) *App {
	return &App{
		config: config,
	}
}

// Initialize sets up all components of the application
func (a *App) Initialize(ctx context.Context) error {
	// Parse the listen address
	addr, err := multiaddr.NewMultiaddr(a.config.ListenAddr)
	if err != nil {
		return fmt.Errorf("invalid listen address: %w", err)
	}

	// Create storage
	// storage := storage.NewStorage()
	var ethClient eth.IEthClient

	// Create Ethereum client
	if !viper.GetBool("test") {
		ethClient, err = eth.NewEthClient(a.config.EthEndpoint, a.config.ContractAddr, a.config.EthPrivateKey)
		if err != nil {
			return fmt.Errorf("failed to create ETH service: %w", err)
		}
	} else {
		ethClient = eth.NewMockEthClient()
	}

	// Create the P2P service
	p2pService, err := network.NewP2PService(ctx, []multiaddr.Multiaddr{addr}, a.config.Peers)
	if err != nil {
		return fmt.Errorf("failed to create P2P service: %w", err)
	}

	signing, err := signing.NewSigning(bls.ComputeKeyPair(a.config.BlsPrivateKey))
	if err != nil {
		return fmt.Errorf("failed to create signing service: %w", err)
	}

	vd, err := valset.NewValsetDeriver(ethClient)
	if err != nil {
		return fmt.Errorf("failed to create valset deriver: %w", err)
	}

	vg, err := valset.NewValsetGenerator(vd, ethClient)
	if err != nil {
		return fmt.Errorf("failed to create valset generator: %w", err)
	}

	// Create network service
	a.signer = signer.NewSignerClient(signing, vg, p2pService)

	return nil
}

// Start begins all services
func (a *App) Start() error {
	// Start the signer service
	if err := a.signer.Start("localhost:8000"); err != nil {
		return fmt.Errorf("failed to start signer service: %w", err)
	}

	return nil
}

// Stop gracefully shuts down all services
func (a *App) Stop() {
	if a.signer != nil {
		a.signer.Stop()
	}
}

// rootCmd represents the base command when called without any subcommands
var rootCmd = &cobra.Command{
	Use:   "offchain-middleware",
	Short: "Offchain middleware for signature aggregation",
	Long:  `A P2P service for collecting and aggregating signatures for Ethereum contracts.`,
}

// startCmd represents the start command
var startCmd = &cobra.Command{
	Use:   "start",
	Short: "Start the offchain middleware service",
	Long:  `Start the offchain middleware service with the specified configuration.`,
	Run: func(cmd *cobra.Command, args []string) {
		// Create config from viper
		// Create an instance of AppConfig
		var config Config
		// Unmarshal the config file into the AppConfig struct
		err := viper.Unmarshal(&config)
		if err != nil {
			log.Fatalf("Unable to decode into struct, %v", err)
		}

		if len(config.BlsPrivateKey) == 0 {
			log.Fatalf("Config is missing BLS private key")
		}

		config.ListenAddr = viper.GetString("listen")

		// Create application
		app := NewApp(config)

		// Create context with cancellation
		ctx, cancel := context.WithCancel(context.Background())
		defer cancel()

		// Initialize application
		if err := app.Initialize(ctx); err != nil {
			log.Fatalf("Failed to initialize application: %s", err)
		}

		// Start application
		if err := app.Start(); err != nil {
			log.Fatalf("Failed to start application: %s", err)
		}
		defer app.Stop()

		// Set up signal handling for graceful shutdown
		sigCh := make(chan os.Signal, 1)
		signal.Notify(sigCh, syscall.SIGINT, syscall.SIGTERM)

		// Wait for termination signal
		<-sigCh
		fmt.Println("Shutting down...")
	},
}

// generateConfigCmd represents the generate config command
var generateConfigCmd = &cobra.Command{
	Use:   "generate-config",
	Short: "Generate a default configuration file",
	Long:  `Generate a default configuration file with all available options.`,
	Run: func(cmd *cobra.Command, args []string) {
		// Set default values
		viper.Set("eth", "http://localhost:8545")
		viper.Set("contract", "")
		ethPrivateKey, err := eth.GeneratePrivateKey()
		if err != nil {
			log.Fatalf("Failed to generate ETH private key: %s", err)
		}
		viper.Set("eth-private-key", ethPrivateKey)
		blsPrivateKey, err := bls.GenerateKey()
		if err != nil {
			log.Fatalf("Failed to generate BLS private key: %s", err)
		}
		viper.Set("bls-private-key", blsPrivateKey)
		viper.Set("peers", []string{})

		// Create config directory if it doesn't exist
		configDir := path.Dir(viper.ConfigFileUsed())
		if _, err := os.Stat(configDir); os.IsNotExist(err) {
			if err := os.MkdirAll(configDir, 0755); err != nil {
				log.Fatalf("Failed to create config directory: %s", err)
			}
			fmt.Printf("Created config directory: %s\n", configDir)
		}

		if err := viper.WriteConfig(); err != nil {
			log.Fatalf("Failed to write config: %s", err)
		}

		fmt.Printf("Configuration file generated at: %s\n", viper.ConfigFileUsed())
	},
}

// initConfig reads in config file and ENV variables if set
func initConfig() {
	viper.SetConfigType("yaml")

	if cfgFile != "" {
		// Use config file from the flag
		viper.SetConfigFile(cfgFile)
	} else {
		// Find home directory
		home, err := os.UserHomeDir()
		if err != nil {
			log.Fatalf("Failed to find home directory: %s", err)
		}

		// Search config in home directory with name ".offchain-middleware" (without extension)
		viper.AddConfigPath(home)
		viper.AddConfigPath(".")
		viper.SetConfigName("config")
	}

	viper.AutomaticEnv() // read in environment variables that match

	// If a config file is found, read it in
	if err := viper.ReadInConfig(); err == nil {
		fmt.Println("Using config file:", viper.ConfigFileUsed())
	}
}

func main() {
	cobra.OnInitialize(initConfig)

	// Global flags
	rootCmd.PersistentFlags().StringVar(&cfgFile, "config", "", "config file (default is $HOME/.offchain-middleware.yaml)")

	// Start command flags
	startCmd.Flags().String("listen", "/ip4/127.0.0.1/tcp/8000", "Address to listen on")
	startCmd.Flags().Bool("test", false, "Test mode, use mock eth client")

	// Bind flags to viper
	viper.BindPFlag("listen", startCmd.Flags().Lookup("listen"))
	viper.BindPFlag("test", startCmd.Flags().Lookup("test"))

	// Add commands
	rootCmd.AddCommand(startCmd)
	rootCmd.AddCommand(generateConfigCmd)

	// Execute the root command
	if err := rootCmd.Execute(); err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}
