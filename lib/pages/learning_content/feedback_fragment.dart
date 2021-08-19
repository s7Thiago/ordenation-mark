import 'package:flutter/material.dart';

class FeedbackFragment extends StatelessWidget {
  const FeedbackFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(right: size.width * .05, top: 50),
      child: Card(
        color: Colors.black12,
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Container(
          width: size.width * .5,
          height: size.height * .6,
        ),
      ),
    );
  }
}
