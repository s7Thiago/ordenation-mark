import 'package:flutter/material.dart';
import 'package:ordenation_mark/shared/widgets/navigation_bar_widget/custom_navigation_item.dart';

class NavigationBar extends StatefulWidget {
  final PageController controller;
  final int selectedIndex;

  const NavigationBar({
    Key? key,
    required this.controller,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 500);

    void animateToPage(int page) {
      setState(() {
        widget.controller.animateToPage(
          page,
          duration: duration,
          curve: Curves.easeInOutQuint,
        );
      });
    }

    return Container(
      height: double.maxFinite,
      alignment: Alignment.center,
      width: 130,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(60),
          bottomRight: Radius.circular(60),
        ),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomNavigationItem(
            selected: (widget.selectedIndex == 0),
            onTap: () {
              animateToPage(0);
            },
          ),
          CustomNavigationItem(
            selected: (widget.selectedIndex == 1),
            onTap: () {
              animateToPage(1);
            },
          ),
        ],
      ),
    );
  }
}
