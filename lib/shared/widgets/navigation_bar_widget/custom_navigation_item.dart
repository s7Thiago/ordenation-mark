import 'package:flutter/material.dart';

class CustomNavigationItem extends StatefulWidget {
  final Widget? child;
  final VoidCallback onTap;
  final int index;
  final int? selectedIndex;

  const CustomNavigationItem({
    Key? key,
    this.child,
    required this.onTap,
    required this.index,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  State<CustomNavigationItem> createState() => _CustomNavigationItemState();
}

class _CustomNavigationItemState extends State<CustomNavigationItem> {
  Color btnColor = Colors.purple;

  bool isSelected() {
    print('current: ${widget.index}, selected: ${widget.selectedIndex}');

    if (widget.index == widget.selectedIndex) {
      return true;
    }
    return false;
  }

  switchButtonColor() {
    if (isSelected()) {
      btnColor = Colors.purple;
    } else {
      btnColor = Colors.black45;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        color: btnColor,
        borderRadius: BorderRadius.circular(50),
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {
            switchButtonColor();
            widget.onTap();
            setState(() {});
          },
          child: Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            alignment: Alignment.center,
            child: widget.child ??
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
