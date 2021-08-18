import 'package:flutter/material.dart';
import 'package:ordenation_mark/shared/widgets/Input.dart';

class MainPageContent extends StatelessWidget {
  const MainPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 257, top: 29),
      alignment: Alignment.center,
      child: Column(
        children: [
          Row(
            children: [
              Input(label: "TAMANHO DO VETOR"),
              SizedBox(width: 200),
              Input(label: "VALORES PARA FAZER A MEDIA"),
            ],
          )
        ],
      ),
    );
  }
}
