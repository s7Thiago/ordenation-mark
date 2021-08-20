import 'package:flutter/material.dart';
import 'package:ordenation_mark/pages/compare_content/comparing_table.dart';
import 'package:ordenation_mark/pages/compare_content/multiselection_mathod.dart';

class ComparePageContent extends StatelessWidget {
  const ComparePageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          const MultiSelectionMethodWidget(),
          const ComparingTable(),
        ],
      ),
    );
  }
}
