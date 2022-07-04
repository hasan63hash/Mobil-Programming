import 'package:flutter/material.dart';
import './quote.dart';
import './quote_card.dart';

void main() {
  runApp(MaterialApp(
    home: QuoteListe(),
    debugShowCheckedModeBanner: false,
  ));
}

class QuoteListe extends StatefulWidget {
  const QuoteListe({Key? key}) : super(key: key);

  @override
  _QuoteListeState createState() => _QuoteListeState();
}

class _QuoteListeState extends State<QuoteListe> {
  List<Quote> quotes = [
    Quote(text: "Hayat devam ediyor", auther: "Hasan Korkmaz"),
    Quote(text: "Hayat güzel  elbet bir gün", auther: "Orhan Korkmaz"),
    Quote(text: "Başarı iyi bir sey", auther: "Hasan Korkmaz")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Awasome quote"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: quotes.map((quote) => QuoteCard(
          quote : quote,
          delete:(){
            setState(() {
              quotes.remove(quote);
            });
          }
        )).toList(),
      ),
    );
  }
}


