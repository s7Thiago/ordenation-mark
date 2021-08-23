import 'package:flutter/material.dart';
import 'package:ordenation_mark/pages/learning_content/feedback_fragment.dart';
import 'package:ordenation_mark/pages/learning_content/method_selection_radio_group.dart';
import 'package:ordenation_mark/shared/providers/input_provider.dart';
import 'package:ordenation_mark/shared/sorting/bubble.dart';
import 'package:ordenation_mark/shared/widgets/button.dart';
import 'package:ordenation_mark/shared/widgets/custom_Input.dart';
import 'package:provider/provider.dart';

enum OrdenationMethodEnum { bubbleSort, mergeSort, heapSort, insertionSort }

class LearningPageContent extends StatelessWidget {
  const LearningPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<InputProvider>(context, listen: true);

    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(left: 257, top: 29),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              children: [
                CustomInput(
                  label:
                      "QUANTIDADE DE ITENS NO VETOR GERADO(VALOR ATÉ ${provider.tamanhoVetorMax})",
                  onChange: (String text) {
                    if (text.isEmpty) {
                      text = '0';
                    }

                    if (int.parse(text) < provider.tamanhoVetorMax) {
                      if (text.isNotEmpty) {
                        provider.updateTamanhoVetor(int.parse(text));
                      } else {
                        text = '0';
                        provider.updateTamanhoVetor(int.parse(text));
                      }
                    } else {
                      text = '${provider.tamanhoVetorMax}';
                      provider.updateTamanhoVetor(int.parse(text));
                    }
                  },
                ),
                const SizedBox(width: 200),
                CustomInput(
                  label:
                      "QUANTAS COMPARAÇÕES FAZER (VALOR ATÉ ${provider.qtdeComparacoesMax})",
                  onChange: (String text) {
                    if (text.isEmpty) {
                      text = '0';
                    }

                    if (int.parse(text) < provider.qtdeComparacoesMax) {
                      if (text.isNotEmpty) {
                        provider.updateQtdeComparacoes(int.parse(text));
                      } else {
                        text = '0';
                        provider.updateQtdeComparacoes(int.parse(text));
                      }
                    } else {
                      text = '${provider.qtdeComparacoesMax}';
                      provider.updateQtdeComparacoes(int.parse(text));
                    }
                  },
                ),
              ],
            ),
            Wrap(
              spacing: 150,
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
                      onTap: () {
                        provider.executeSort(
                            provider.tamanhoVetor,
                            provider.qtdeComparacoes,
                            OrdenationMethodEnum.bubbleSort);
                      },
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
