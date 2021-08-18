import 'package:flutter/material.dart';

class FeedbackFragment extends StatelessWidget {
  const FeedbackFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * .5,
      height: size.height * .6,
      margin: EdgeInsets.only(right: size.width * .05, top: 100),
      decoration: const BoxDecoration(
        color: Colors.black26,
      ),
    );
  }
}
