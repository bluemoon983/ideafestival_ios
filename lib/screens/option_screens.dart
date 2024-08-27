import 'package:flutter/material.dart';

class OptionScreens extends StatelessWidget {
  const OptionScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "Option",
          style: TextStyle(
            fontSize: 49,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
