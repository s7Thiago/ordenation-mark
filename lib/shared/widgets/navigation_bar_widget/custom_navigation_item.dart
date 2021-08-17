import 'package:flutter/material.dart';

class CustomNavigationItem extends StatelessWidget {
  final Widget? child;
  final VoidCallback onTap;
  final bool selected;

  const CustomNavigationItem(
      {Key? key, this.child, required this.onTap, this.selected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        color: selected ? Colors.purple : Colors.deepPurple,
        borderRadius: BorderRadius.circular(50),
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: onTap,
          child: Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            alignment: Alignment.center,
            child: child ??
                const Text(
                  'A',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
