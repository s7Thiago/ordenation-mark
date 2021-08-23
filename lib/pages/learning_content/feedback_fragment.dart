import 'package:flutter/material.dart';
import 'package:ordenation_mark/shared/providers/input_provider.dart';
import 'package:ordenation_mark/shared/providers/method_selection.dart';
import 'package:provider/provider.dart';

class FeedbackFragment extends StatelessWidget {
  const FeedbackFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final methodProvider = Provider.of<MethodSelection>(context);
    final inputProvider = Provider.of<InputProvider>(context, listen: true);

    return Padding(
      padding: EdgeInsets.only(right: size.width * .05, top: 50),
      child: Card(
        color: Colors.black12,
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: SizedBox(
          width: size.width * .5,
          height: size.height * .8,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40, bottom: 20),
                child: Text(
                  "TEMPOS DE ORDENAÇÃO DO ${methodProvider.title.toUpperCase()}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    ...List.generate(
                      inputProvider.timesMap[methodProvider.method]!.length,
                      (index) => Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: Text(
                            "Tempo ${index + 1} levou ${inputProvider.timesMap[methodProvider.method]![index]} ms"),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 50),
                      child: const Text('Média total das medições 500 ms'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
