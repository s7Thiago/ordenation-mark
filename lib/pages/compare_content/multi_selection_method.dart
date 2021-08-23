// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:ordenation_mark/pages/learning_content/learning_content.dart';
import 'package:ordenation_mark/shared/providers/chart_provider.dart';
import 'package:ordenation_mark/shared/providers/comparing_table_provider.dart';
import 'package:ordenation_mark/shared/sorting/bubble.dart';
import 'package:ordenation_mark/shared/sorting/heap.dart';
import 'package:ordenation_mark/shared/sorting/insertion.dart';
import 'package:ordenation_mark/shared/sorting/merge.dart';
import 'package:ordenation_mark/shared/sorting/quick_sort.dart';
import 'package:provider/provider.dart';

class MultiSelectionMethodWidget extends StatelessWidget {
  const MultiSelectionMethodWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ComparingTableProvider>(context, listen: true);
    final chartProvider = Provider.of<ChartProvider>(context, listen: true);
    final size = MediaQuery.of(context).size;
    final List<String> buttons = [
      'Bubble Sort',
      'Quick Sort',
      'Heap Sort',
      'Insertion Sort',
    ];

    return Container(
      // margin: const EdgeInsets.only(left: 0, right: 0),
      width: size.width * .8,
      height: 150,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        children: [
          const SizedBox(height: 15),
          const Text(
            'Escolha os algoritmos para comparar',
            style: TextStyle(fontSize: 25),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 900),
              opacity: provider.isUiLocked ? 0 : 1,
              child: IgnorePointer(
                ignoring: provider.isUiLocked,
                child: GroupButton(
                  spacing: 120,
                  isRadio: false,
                  buttonWidth: 150,
                  buttonHeight: 35,
                  runSpacing: 15,
                  buttons: buttons,
                  borderRadius: BorderRadius.circular(35),
                  onSelected: (index, isSelected) async {
                    if (isSelected) {
                      // print('sizes: ${provider.sizes}');

                      final methodColor = provider.methodColor;

                      provider.switchUiLock();
                      chartProvider.newLineChart(buttons[index], methodColor);

                      switch (index) {
                        case 0:
                          print('$index - ${buttons[index]}');
                          provider.updateSelectedMethod(
                              OrdenationMethodEnum.bubbleSort);
                          provider.addColumn(
                              buttons[index], BubbleSort.sort, context);
                          break;
                        case 1:
                          print('$index - ${buttons[index]}');
                          provider.updateSelectedMethod(
                              OrdenationMethodEnum.quickSort);
                          provider.addColumn(
                              buttons[index], QuickSort.sort, context);
                          break;
                        case 2:
                          print('$index - ${buttons[index]}');
                          provider.updateSelectedMethod(
                              OrdenationMethodEnum.heapSort);
                          provider.addColumn(
                              buttons[index], HeapSort.sort, context);
                          break;
                        case 3:
                          print('$index - ${buttons[index]}');
                          provider.updateSelectedMethod(
                              OrdenationMethodEnum.insertionSort);
                          provider.addColumn(
                              buttons[index], InsertionSort.sort, context);
                          break;
                        default:
                          print('$index - ${buttons[index]}');
                      }
                    } else {
                      provider.removeColumn(buttons[index]);
                      chartProvider.removeLineChart(buttons[index]);
                    }
                  },
                  unselectedTextStyle: const TextStyle(color: Colors.grey),
                  selectedTextStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedColor: Colors.black38,
                  selectedColor: Colors.indigo,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
