import 'package:flutter/material.dart';
import 'package:ordenation_mark/shared/providers/method_selection.dart';
import 'package:ordenation_mark/shared/widgets/custom_Input.dart';
import 'package:provider/provider.dart';

enum OrdenationMethodEnum { bubbleSort, mergeSort, heapSort, insertionSort }

class MainPageContent extends StatelessWidget {
  const MainPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final methodProvider = Provider.of<MethodSelection>(context, listen: true);
    return Container(
      margin: const EdgeInsets.only(left: 257, top: 29),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomInput(label: "TAMANHO DO VETOR"),
              const SizedBox(width: 200),
              CustomInput(label: "VALORES PARA FAZER A MEDIA"),
            ],
          ),
          Container(
            width: 300,
            margin: const EdgeInsets.only(top: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "SELECIONE O ALGORITMO",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                RadioListTile(
                    value: OrdenationMethodEnum.bubbleSort,
                    groupValue: methodProvider.method,
                    onChanged: (OrdenationMethodEnum? value) {
                      methodProvider.updateMethod(value);
                    },
                    title: const Text("Bubble Sort")),
                RadioListTile(
                  value: OrdenationMethodEnum.mergeSort,
                  groupValue: methodProvider.method,
                  onChanged: (OrdenationMethodEnum? value) {
                    methodProvider.updateMethod(value);
                  },
                  title: const Text("Merge Sort"),
                ),
                RadioListTile(
                  value: OrdenationMethodEnum.heapSort,
                  groupValue: methodProvider.method,
                  onChanged: (OrdenationMethodEnum? value) {
                    methodProvider.updateMethod(value);
                  },
                  title: const Text("Heap Sort"),
                ),
                RadioListTile(
                  value: OrdenationMethodEnum.insertionSort,
                  groupValue: methodProvider.method,
                  onChanged: (OrdenationMethodEnum? value) {
                    methodProvider.updateMethod(value);
                  },
                  title: const Text("Insertion Sort"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
