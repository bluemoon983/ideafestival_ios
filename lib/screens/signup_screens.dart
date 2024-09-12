import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // 배경색을 명시적으로 흰색으로 설정
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8, // 반응형 너비 설정
          height: 50,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black, // 버튼의 텍스트 색상 명시
              side: const BorderSide(color: Colors.black),
              backgroundColor: Colors.white, // 버튼 배경색 흰색으로 설정
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
            onPressed: () => _navigateToMain(context),
            child: const Text(
              "Sign in",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black, // 텍스트 색상을 명시적으로 검정색 설정
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToMain(BuildContext context) {
    Navigator.popUntil(context, (route) => route.isFirst);
  }
}
