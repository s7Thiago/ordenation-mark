import 'package:flutter/material.dart';
import 'package:ordenation_mark/shared/providers/navigation.dart';
import 'package:ordenation_mark/shared/widgets/navigation_bar_widget/custom_navigation_item.dart';
import 'package:provider/provider.dart';

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
    final navigationProvider =
        Provider.of<NavigationProvider>(context, listen: true);

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
            index: 0,
            selectedIndex: navigationProvider.currentIndex,
            onTap: () {
              animateToPage(0);
            },
          ),
          CustomNavigationItem(
            index: 1,
            selectedIndex: navigationProvider.currentIndex,
            onTap: () {
              animateToPage(1);
            },
          ),
        ],
      ),
    );
  }
}
