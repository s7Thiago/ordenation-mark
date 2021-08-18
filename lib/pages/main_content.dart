import 'package:flutter/material.dart';
import 'package:ordenation_mark/shared/providers/method_selection.dart';
import 'package:ordenation_mark/shared/widgets/custom_Input.dart';
import 'package:provider/provider.dart';

enum OrdenationMehtodEnum { BubbleSort, MergeSort, HeapSort, InsertionSort }

class MainPageContent extends StatelessWidget {
  MainPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final methodprovider = Provider.of<MethodSelection>(context, listen: true);
    return Container(
      margin: EdgeInsets.only(left: 257, top: 29),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomInput(label: "TAMANHO DO VETOR"),
              SizedBox(width: 200),
              CustomInput(label: "VALORES PARA FAZER A MEDIA"),
            ],
          ),
          Container(
            width: 300,
            margin: EdgeInsets.only(top: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "SELECIONE O ALGORITMO",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                RadioListTile(
                  activeColor: Colors.white,
                  value: OrdenationMehtodEnum.BubbleSort,
                  groupValue: methodprovider.method,
                  onChanged: (OrdenationMehtodEnum? value) {
                    methodprovider.updatemethod(value);
                  },
                  title: const Text(
                    "Bubble Sort",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                RadioListTile(
                  value: OrdenationMehtodEnum.MergeSort,
                  groupValue: methodprovider.method,
                  onChanged: (OrdenationMehtodEnum? value) {
                    methodprovider.updatemethod(value);
                  },
                  title: const Text("Merge Sort"),
                ),
                RadioListTile(
                  value: OrdenationMehtodEnum.HeapSort,
                  groupValue: methodprovider.method,
                  onChanged: (OrdenationMehtodEnum? value) {
                    methodprovider.updatemethod(value);
                  },
                  title: const Text("Heap Sort"),
                ),
                RadioListTile(
                  value: OrdenationMehtodEnum.InsertionSort,
                  groupValue: methodprovider.method,
                  onChanged: (OrdenationMehtodEnum? value) {
                    methodprovider.updatemethod(value);
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
