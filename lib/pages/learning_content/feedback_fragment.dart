import 'package:flutter/material.dart';
import 'package:ordenation_mark/shared/providers/method_selection.dart';
import 'package:provider/provider.dart';

class FeedbackFragment extends StatelessWidget {
  const FeedbackFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final methodProvider = Provider.of<MethodSelection>(context);

    return Padding(
      padding: EdgeInsets.only(right: size.width * .05, top: 50),
      child: Card(
        color: Colors.black12,
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: SingleChildScrollView(
          child: Container(
            width: size.width * .5,
            height: size.height * .6,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 40, bottom: 20),
                  child: Text(
                    "TEMPO DE ORDENAÇÃO PELO ${methodProvider.title.toUpperCase()}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Text("Tempo 1 levou 503 ms"),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Text("Tempo 2 levou 200 ms"),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Text("Tempo 3 levou 350 ms"),
                    ),
                    Text("Media dos tempos 500ms"),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
