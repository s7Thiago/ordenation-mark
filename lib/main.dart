import 'package:flutter/material.dart';
import 'package:ordenation_mark/pages/home_page.dart';

void main() {
  runApp(const OrdenationMarkApp());
}

class OrdenationMarkApp extends StatelessWidget {
  const OrdenationMarkApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
