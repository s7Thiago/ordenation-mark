import 'package:flutter/material.dart';
import 'package:ordenation_mark/pages/learning_content/learning_content.dart';
import 'package:ordenation_mark/shared/providers/method_selection.dart';
import 'package:provider/provider.dart';

class MethodSelectRadioGroup extends StatelessWidget {
  const MethodSelectRadioGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final methodProvider = Provider.of<MethodSelection>(context, listen: true);
    final selectedTileColor = Colors.black12;

    return DefaultTextStyle(
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18,
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 25),
            child: Text("SELECIONE O ALGORITMO"),
          ),
          RadioListTile(
            activeColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            tileColor: methodProvider.method == OrdenationMethodEnum.bubbleSort
                ? selectedTileColor
                : Colors.transparent,
            value: OrdenationMethodEnum.bubbleSort,
            groupValue: methodProvider.method,
            onChanged: (OrdenationMethodEnum? value) {
              methodProvider.updateMethod(value);
            },
            title: const Text(
              "Bubble Sort",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
          RadioListTile(
            activeColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            tileColor: methodProvider.method == OrdenationMethodEnum.mergeSort
                ? selectedTileColor
                : Colors.transparent,
            value: OrdenationMethodEnum.mergeSort,
            groupValue: methodProvider.method,
            onChanged: (OrdenationMethodEnum? value) {
              methodProvider.updateMethod(value);
            },
            title: const Text(
              "Merge Sort",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
          RadioListTile(
            activeColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            tileColor: methodProvider.method == OrdenationMethodEnum.heapSort
                ? selectedTileColor
                : Colors.transparent,
            value: OrdenationMethodEnum.heapSort,
            groupValue: methodProvider.method,
            onChanged: (OrdenationMethodEnum? value) {
              methodProvider.updateMethod(value);
            },
            title: const Text(
              "Heap Sort",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
          RadioListTile(
            activeColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            tileColor:
                methodProvider.method == OrdenationMethodEnum.insertionSort
                    ? selectedTileColor
                    : Colors.transparent,
            value: OrdenationMethodEnum.insertionSort,
            groupValue: methodProvider.method,
            onChanged: (OrdenationMethodEnum? value) {
              methodProvider.updateMethod(value);
            },
            title: const Text(
              "Insertion Sort",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
