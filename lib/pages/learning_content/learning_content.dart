import 'package:flutter/material.dart';
import 'package:ordenation_mark/pages/learning_content/feedback_fragment.dart';
import 'package:ordenation_mark/pages/learning_content/method_selection_radio_group.dart';
import 'package:ordenation_mark/shared/providers/input_provider.dart';
import 'package:ordenation_mark/shared/widgets/button.dart';
import 'package:ordenation_mark/shared/widgets/custom_Input.dart';
import 'package:provider/provider.dart';

enum OrdenationMethodEnum { bubbleSort, mergeSort, heapSort, insertionSort }

class LearningPageContent extends StatelessWidget {
  const LearningPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<InputProvider>(context, listen: true);
    final qtdeItensInputController =
        TextEditingController(text: '${provider.tamanhoVetor}');
    final qtdeComparacoesInputController =
        TextEditingController(text: '${provider.qtdeComparacoes}');

    return Container(
      margin: const EdgeInsets.only(left: 257, top: 29),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomInput(
                label: "QUANTIDADE DE ITENS NO VETOR GERADO",
                controller: qtdeItensInputController,
                onChange: (String text) {
                  if (text.isEmpty) {
                    text = '0';
                  }

                  if (/* qtdeItensInputController. */ text.isEmpty) {
                    /* qtdeItensInputController. */ text = '0';
                  }

                  if (int.parse(text) < provider.tamanhoVetorMax) {
                    if (text.isNotEmpty) {
                      provider.updateTamanhoVetor(
                          int.parse(/* qtdeItensInputController. */ text));
                    } else {
                      /* qtdeItensInputController. */ text = '0';
                      provider.updateTamanhoVetor(
                          int.parse(/* qtdeItensInputController. */ text));
                    }
                  } else {
                    /* qtdeItensInputController. */ text =
                        '${provider.tamanhoVetorMax}';
                    provider.updateTamanhoVetor(
                        int.parse(/* qtdeItensInputController. */ text));
                  }
                },
              ),
              const SizedBox(width: 200),
              CustomInput(
                label: "QUANTAS COMPARAÇÕES FAZER (VALOR ATÉ 10)",
                controller: qtdeComparacoesInputController,
                onChange: (String text) {
                  if (text.isEmpty) {
                    /* qtdeComparacoesInputController. */ text = '0';
                  }

                  if (int.parse(text) < provider.qtdeComparacoesMax) {
                    if (text.isNotEmpty) {
                      provider.updateQtdeComparacoes(int.parse(text));
                    } else {
                      /* qtdeComparacoesInputController. */ text = '0';
                      provider.updateQtdeComparacoes(int.parse(text));
                    }
                  } else {
                    /* qtdeComparacoesInputController. */ text =
                        '${provider.qtdeComparacoesMax}';
                    provider.updateQtdeComparacoes(int.parse(text));
                  }
                },
              ),
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
