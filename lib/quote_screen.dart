import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'quote_api.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuoteScreenState createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  String quote = '';
  String author = '';
  bool isLoading = false;
  String error = '';

  @override
  void initState() {
    super.initState();
    fetchQuote();
  }

  Future<void> fetchQuote() async {
    setState(() {
      isLoading = true;
      error = '';
    });
    try {
      final q = await QuoteApi.fetchRandomQuote();
      setState(() {
        quote = q.content;
        author = q.author;
      });
    } catch (e) {
      setState(() {
        error = 'Failed to load quote.';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void shareQuote() {
    if (quote.isNotEmpty) {
      Share.share('"$quote"\n- $author');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF232526), Color(0xFF414345)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Row(
            children: [
              Icon(Icons.format_quote, color: Colors.amberAccent),
              SizedBox(width: 8),
              Text('Random Quote Generator'),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: isLoading
                ? SpinKitFadingCircle(
                    color: Colors.amberAccent,
                    size: 60.0,
                  )
                : error.isNotEmpty
                    ? Text(error, style: TextStyle(color: Colors.redAccent, fontSize: 18))
                    : Card(
                        // ignore: deprecated_member_use
                        color: Colors.black.withOpacity(0.7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        elevation: 12,
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.format_quote, size: 40, color: Colors.amberAccent),
                              SizedBox(height: 16),
                              Text(
                                '"$quote"',
                                style: GoogleFonts.montserrat(
                                  fontSize: 26,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 24),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '- $author',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amberAccent,
                                  ),
                                ),
                              ),
                              SizedBox(height: 32),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton.icon(
                                    onPressed: fetchQuote,
                                    icon: Icon(Icons.refresh),
                                    label: Text('New Quote'),
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: shareQuote,
                                    icon: Icon(Icons.share),
                                    label: Text('Share'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
          ),
        ),
      ),
    );
  }
}
