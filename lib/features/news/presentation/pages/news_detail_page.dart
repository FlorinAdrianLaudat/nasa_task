import 'package:flutter/material.dart';

class NewsDetailPage extends StatelessWidget {
  final String date;
  final String explanation;

  const NewsDetailPage(
      {Key? key, required this.date, required this.explanation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade500,
        centerTitle: true,
        title: const Text('News In Details'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                date,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(explanation, textAlign: TextAlign.justify),
          ),
        ],
      )),
    );
  }
}
