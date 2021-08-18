import 'package:flutter/material.dart';
import 'package:ordenation_mark/shared/widgets/custom_Input.dart';

enum OrdenationMehtodEnum { BubbleSort, MergeSort, HeapSort, InsertionSort }

class MainPageContent extends StatelessWidget {
  MainPageContent({Key? key}) : super(key: key);

  OrdenationMehtodEnum? _character = OrdenationMehtodEnum.BubbleSort;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 257, top: 29),
      alignment: Alignment.center,
      child: Column(
        children: [
          Row(
            children: [
              CustomInput(label: "TAMANHO DO VETOR"),
              SizedBox(width: 200),
              CustomInput(label: "VALORES PARA FAZER A MEDIA"),
            ],
          ),
          Column(
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
                  value: OrdenationMehtodEnum.BubbleSort,
                  groupValue: _character,
                  onChanged: (_) {},
                  title: const Text("Bubble Sort")),
              RadioListTile(
                value: OrdenationMehtodEnum.MergeSort,
                groupValue: _character,
                onChanged: (_) {},
                title: const Text("Merge Sort"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
