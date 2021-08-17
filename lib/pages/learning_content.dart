import 'package:flutter/material.dart';

class LearningPageContent extends StatelessWidget {
  const LearningPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text(
        'Learning Page',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
