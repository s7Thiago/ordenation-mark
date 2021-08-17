import 'package:flutter/material.dart';

class OrdenationView extends StatelessWidget {
  final List<int> items;
  final String methodName;
  final List<int> Function(List<int>) method;

  const OrdenationView({
    Key? key,
    required this.items,
    required this.methodName,
    required this.method,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      width: 350,
      decoration: const BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          Container(
            color: Colors.blue,
            width: double.maxFinite,
            height: 50,
            alignment: Alignment.center,
            child: Text(
              '${methodName.toUpperCase()} SORT',
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
          Text('input: ${items.toString()}'),
          const SizedBox(height: 30),
          Text('output: ${method(items)}'),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
