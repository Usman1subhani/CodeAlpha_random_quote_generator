import 'dart:convert';
import 'package:http/http.dart' as http;

class Quote {
  final String content;
  final String author;

  Quote({required this.content, required this.author});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      content: json['q'] ?? '',
      author: json['a'] ?? 'Unknown',
    );
  }
}

class QuoteApi {
  static Future<Quote> fetchRandomQuote() async {
    final response = await http.get(Uri.parse('https://zenquotes.io/api/random'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return Quote.fromJson(data[0]);
    } else {
      throw Exception('Failed to load quote');
    }
  }
}
