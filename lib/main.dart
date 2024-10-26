import 'dart:math';
import 'package:flutter/material.dart';
import 'api_service.dart';
import 'crypto_model.dart';

void main() {
  runApp(const CryptoTrackerApp());
}

class CryptoTrackerApp extends StatelessWidget {
  const CryptoTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crypto Fetcher',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(color: Colors.grey[900]),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
        ),
      ),
      home: const CryptoListScreen(),
    );
  }
}

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  CryptoListScreenState createState() => CryptoListScreenState();
}

class CryptoListScreenState extends State<CryptoListScreen> {
  late Future<List<Crypto>> _cryptoList;
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _cryptoList = _fetchCryptoData();
  }

  Future<List<Crypto>> _fetchCryptoData() async {
    final data = await _apiService.fetchCryptocurrencies();
    return data.map((json) => Crypto.fromJson(json)).toList();
  }

  Color _getRandomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crypto Tracker')),
      body: FutureBuilder<List<Crypto>>(
        future: _cryptoList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.white));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}', style: const TextStyle(color: Colors.redAccent)));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data found', style: TextStyle(color: Colors.grey)));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final crypto = snapshot.data![index];
                return ListTile(
                  leading: Image.network(crypto.imageUrl, width: 40, height: 40),
                  title: Text(
                    crypto.name,
                    style: TextStyle(color: _getRandomColor(), fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    crypto.symbol.toUpperCase(),
                    style: const TextStyle(color: Colors.white70),
                  ),
                  trailing: Text(
                    '\$${crypto.currentPrice.toStringAsFixed(2)}',
                    style: const TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
