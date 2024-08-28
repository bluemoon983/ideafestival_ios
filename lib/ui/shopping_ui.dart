import 'package:flutter/material.dart';

class ShoppingWidget extends StatelessWidget {
  const ShoppingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 20.0, top: 20.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            "거래",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
