# CryptoFetcher

**CryptoFetcher** is a Flutter application that tracks the current prices of various cryptocurrencies using the CoinGecko API.

## Features
- Fetches real-time cryptocurrency data from the CoinGecko API.
- Displays cryptocurrency name, symbol, current price, and image.
- Randomly colored cryptocurrency names for visual distinction.

## Getting Started

### Prerequisites
- [Flutter](https://flutter.dev/docs/get-started/install) (version 2.0 or higher)
- [Dart](https://dart.dev/get-dart) (version 2.12 or higher)

### Installation

1. **Clone the repository:**
   ```sh
   git clone https://github.com/ArdaKoksall/cryptofetcher.git
   cd cryptofetcher
   ```

2. **Install dependencies:**
   ```sh
   flutter pub get
   ```

3. **Run the application:**
   ```sh
   flutter run
   ```

## Project Structure

- `lib/crypto_model.dart`: Defines the `Crypto` model class.
- `lib/api_service.dart`: Contains the `ApiService` class for fetching cryptocurrency data.
- `lib/main.dart`: Entry point of the application, includes the main UI.

## Usage

1. Launch the application.
2. The app will fetch and display a list of cryptocurrencies with their current prices.

## Contributing

Contributions are welcome! Please fork the repository and create a pull request with your changes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [CoinGecko API](https://www.coingecko.com/en/api)
- [Dart Documentation](https://dart.dev/guides)