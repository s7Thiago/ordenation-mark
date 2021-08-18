import 'package:flutter/material.dart';
import 'package:ordenation_mark/pages/learning_content.dart';
import 'package:ordenation_mark/pages/main_content.dart';
import 'package:ordenation_mark/shared/widgets/navigation_bar_widget/navigation_bar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pages = [
      MainPageContent(),
      const LearningPageContent(),
    ];

    int selectedIndex = 0;

    final controller = PageController();

    return Scaffold(
      backgroundColor: const Color(0xff383838),
      body: Stack(
        children: [
          PageView.builder(
            controller: controller,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (_, index) {
              selectedIndex = index;
              return pages[index];
            },
          ),
          NavigationBar(controller: controller, selectedIndex: selectedIndex),
        ],
      ),
    );
  }
}
