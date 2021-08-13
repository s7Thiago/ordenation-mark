import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: const Text(
          'Ordenation Mark App',
          style: TextStyle(
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
