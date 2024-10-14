import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  final String text;

  const CustomOutlineButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0), // Square corners
        ),
        backgroundColor: Colors.black,
        minimumSize: const Size(160, 160), // Set the minimum width and height
      ),
      onPressed: () {},
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 20,
        ),
      ),
    );
  }
}
