import 'package:flutter/material.dart';
import 'package:ordenation_mark/pages/compare_content/compare_content.dart';
import 'package:ordenation_mark/pages/learning_content/learning_content.dart';
import 'package:ordenation_mark/shared/providers/navigation.dart';
import 'package:ordenation_mark/shared/widgets/navigation_bar_widget/navigation_bar.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pages = [
      const LearningPageContent(),
      const ComparePageContent(),
    ];
    int currentPage = 0;
    final navigation = Provider.of<NavigationProvider>(context, listen: true);

    final controller = PageController();

    return Scaffold(
      backgroundColor: const Color(0xff383838),
      body: Stack(
        children: [
          PageView.builder(
            controller: controller,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              navigation.updateIndex(index);
            },
            itemCount: pages.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (_, index) {
              return pages[index];
            },
          ),
          NavigationBar(controller: controller, selectedIndex: currentPage),
        ],
      ),
    );
  }
}
