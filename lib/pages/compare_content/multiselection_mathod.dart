import 'package:flutter/material.dart';

class MultiSelectionMethodWidget extends StatelessWidget {
  const MultiSelectionMethodWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      width: 600,
      height: 200,
      decoration: const BoxDecoration(
        color: Colors.black26,
      ),
      child: Column(
        children: [
          const Text(
            'Escolha os algoritmos para comparar',
          )
        ],
      ),
    );
  }
}
