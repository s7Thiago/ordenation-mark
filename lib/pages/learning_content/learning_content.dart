import 'package:flutter/material.dart';
import 'package:ordenation_mark/pages/learning_content/feedback_fragment.dart';
import 'package:ordenation_mark/pages/learning_content/method_selection_radio_group.dart';
import 'package:ordenation_mark/shared/widgets/button.dart';
import 'package:ordenation_mark/shared/widgets/custom_Input.dart';

enum OrdenationMethodEnum { bubbleSort, mergeSort, heapSort, insertionSort }

class LearningPageContent extends StatelessWidget {
  const LearningPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 250,
                margin: const EdgeInsets.only(top: 80),
                child: const MethodSelectRadioGroup(),
              ),

              // * Learning Feedback
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const FeedbackFragment(),
                  Button(
                    label: "OK",
                    onTap: () {},
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
