// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:ordenation_mark/shared/providers/comparing_table_provider.dart';
import 'package:ordenation_mark/shared/sorting/bubble.dart';
import 'package:ordenation_mark/shared/sorting/heap.dart';
import 'package:ordenation_mark/shared/sorting/insertion.dart';
import 'package:ordenation_mark/shared/sorting/merge.dart';
import 'package:provider/provider.dart';

class MultiSelectionMethodWidget extends StatelessWidget {
  const MultiSelectionMethodWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ComparingTableProvider>(context, listen: true);
    final List<String> buttons = [
      'Bubble Sort',
      'Merge Sort',
      'Heap Sort',
      'Insertion Sort',
    ];

    return Container(
      margin: const EdgeInsets.only(left: 200, right: 50),
      width: 500,
      height: 250,
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
              buttonHeight: 35,
              runSpacing: 15,
              buttons: buttons,
              onSelected: (index, isSelected) async {
                if (isSelected) {
                  // print('sizes: ${provider.sizes}');
                  switch (index) {
                    case 0:
                      print('$index - ${buttons[index]}');
                      provider.addColumn(buttons[index], BubbleSort.sort);
                      break;
                    case 1:
                      print('$index - ${buttons[index]}');
                      provider.addColumn(buttons[index], MergeSort.sort);
                      break;
                    case 2:
                      print('$index - ${buttons[index]}');
                      provider.addColumn(buttons[index], HeapSort.sort);
                      break;
                    case 3:
                      print('$index - ${buttons[index]}');
                      provider.addColumn(buttons[index], InsertionSort.sort);
                      break;
                    default:
                      print('$index - ${buttons[index]}');
                  }
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
