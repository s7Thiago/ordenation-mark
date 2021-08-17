import 'package:flutter/material.dart';

class MainPageContent extends StatelessWidget {
  const MainPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text(
        'Main Page',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
