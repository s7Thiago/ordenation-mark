// ignore_for_file: unnecessary_const, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ordenation_mark/pages/compare_content/comparing_chart.dart';
import 'package:ordenation_mark/pages/compare_content/comparing_table.dart';
import 'package:ordenation_mark/pages/compare_content/multi_selection_method.dart';

class ComparePageContent extends StatelessWidget {
  const ComparePageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const MultiSelectionMethodWidget(),
          Expanded(
            child: SizedBox(
              width: size.width * .7,
              child: ListView(
                children: [
                  const ComparingTable(),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: ComparingChart(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
