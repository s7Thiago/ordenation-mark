import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class MultiSelectionMethodWidget extends StatelessWidget {
  const MultiSelectionMethodWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      width: 600,
      height: 200,
      decoration: const BoxDecoration(
        color: Colors.black26,
      ),
      child: Column(
        children: [
          Text(
            'Escolha os algoritmos para comparar',
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: GroupButton(
              spacing: 15,
              isRadio: false,
              buttonWidth: 250,
              runSpacing: 15,
              buttons: [
                'Insertion Sort',
                'Bubble Sort',
                'Heap Sort',
                'Merge Sort',
              ],
              onSelected: (index, isSelected) {
                print(
                    '$index button is ${isSelected ? 'selected' : 'unselected'}');
              },
              unselectedTextStyle: TextStyle(),
              unselectedColor: Colors.black38,
            ),
          )
        ],
      ),
    );
  }
}
