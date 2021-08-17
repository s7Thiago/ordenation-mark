import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff383838),
      body: Stack(
        children: [
          Container(
            height: double.maxFinite,
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
