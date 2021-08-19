import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  final Function onTap;

  const Button({Key? key, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, right: 80),
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        child: SizedBox(
          height: 40,
          width: 60,
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
