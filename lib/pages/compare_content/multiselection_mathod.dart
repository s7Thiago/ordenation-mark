// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:ordenation_mark/shared/providers/comparing_table_provider.dart';
import 'package:ordenation_mark/shared/sorting/bubble.dart';
import 'package:ordenation_mark/shared/sorting/sorting_controller.dart';
import 'package:provider/provider.dart';

class MultiSelectionMethodWidget extends StatelessWidget {
  const MultiSelectionMethodWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ComparingTableProvider>(context, listen: true);
    final List<String> buttons = [
      'Insertion Sort',
      'Bubble Sort',
      'Heap Sort',
      'Merge Sort'
    ];

    void addMethodData(DataColumn column, List<DataRow> rows) {}

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      width: 600,
      height: 200,
      decoration: const BoxDecoration(
        color: Colors.black26,
      ),
      child: Column(
        children: [
          const Text(
            'Escolha os algoritmos para comparar',
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: GroupButton(
              spacing: 15,
              isRadio: false,
              buttonWidth: 250,
              runSpacing: 15,
              buttons: buttons,
              onSelected: (index, isSelected) async {
                if (isSelected) {
                  await provider.addColumn(buttons[index]);
                  // print(
                  //     'generated entry: ${SortingController.getExecutionTime(BubbleSort.sort, SortingController.generateRandomList(1000))} ms');
                } else {
                  provider.removeColumn(buttons[index]);
                }
              },
              unselectedTextStyle: const TextStyle(color: Colors.grey),
              selectedTextStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              unselectedColor: Colors.black38,
            ),
          )
        ],
      ),
    );
  }
}
