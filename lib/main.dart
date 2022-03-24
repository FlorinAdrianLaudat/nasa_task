import 'package:flutter/material.dart';
import 'package:nasa_task/resources/injection_container.dart';

import 'features/news/presentation/pages/news_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nasa Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NewsPage(),
    );
  }
}
