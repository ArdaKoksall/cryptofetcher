class Crypto {
  final String name;
  final String symbol;
  final double currentPrice;
  final String imageUrl;

  Crypto({
    required this.name,
    required this.symbol,
    required this.currentPrice,
    required this.imageUrl,
  });

  factory Crypto.fromJson(Map<String, dynamic> json) {
    return Crypto(
      name: json['name'],
      symbol: json['symbol'],
      currentPrice: json['current_price'].toDouble(),
      imageUrl: json['image'],
    );
  }
}
