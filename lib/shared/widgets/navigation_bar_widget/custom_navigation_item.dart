import 'package:flutter/material.dart';
import 'package:ordenation_mark/shared/providers/navigation.dart';
import 'package:provider/provider.dart';

class CustomNavigationItem extends StatelessWidget {
  final Widget? child;
  final VoidCallback onTap;
  final int index;
  final int? selectedIndex;

  CustomNavigationItem({
    Key? key,
    this.child,
    required this.onTap,
    required this.index,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigation = Provider.of<NavigationProvider>(context, listen: true);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        color: navigation.currentIndex == index ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(50),
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {
            navigation.updateIndex(selectedIndex!);
            onTap();
          },
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
