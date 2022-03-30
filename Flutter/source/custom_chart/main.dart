import 'package:flutter/material.dart';
import 'package:flutter_test1/ui/chart_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: ChartPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
