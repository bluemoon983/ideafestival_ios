import 'package:flutter/material.dart';

class AlarmScreens extends StatelessWidget {
  const AlarmScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Material(
          color: Colors.transparent,
          child: Text(
            "GSMarket",
            style: TextStyle(
              color: Colors.black,
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
