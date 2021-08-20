// ignore_for_file: unnecessary_const, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ordenation_mark/pages/compare_content/comparing_chart.dart';
import 'package:ordenation_mark/pages/compare_content/comparing_table.dart';
import 'package:ordenation_mark/pages/compare_content/multi_selection_method.dart';

class ComparePageContent extends StatelessWidget {
  const ComparePageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Row(
          children: [
            const MultiSelectionMethodWidget(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ComparingTable(),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: ComparingChart(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
