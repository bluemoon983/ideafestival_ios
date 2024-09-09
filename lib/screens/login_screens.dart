import 'package:flutter/material.dart';

class LoginScreens extends StatelessWidget {
  const LoginScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        // Center 위젯을 추가하여 버튼이 화면 중앙에 위치하도록 개선
        child: ElevatedButton(
          onPressed: () => _navigateToMain(context),
          child: const Text(
            "엄 준 식",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToMain(BuildContext context) {
    Navigator.popUntil(
        context, (route) => route.isFirst); // 첫 번째 화면인 MainScreens로 돌아감
  }
}
