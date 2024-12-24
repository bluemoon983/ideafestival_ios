import 'package:flutter/material.dart';
import 'package:iosgsmarket/src/screens/login_screens.dart';

class JoinScreens extends StatelessWidget {
  const JoinScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              "lib/assets/gsm.png",
              height: 100,
            ),
            const SizedBox(height: 32),
            const TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: '아이디',
                labelStyle: TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Color.fromRGBO(50, 50, 50, 1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              obscureText: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: '비밀번호',
                labelStyle: TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Color.fromRGBO(50, 50, 50, 1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              obscureText: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: '비밀번호 확인',
                labelStyle: TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Color.fromRGBO(50, 50, 50, 1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // 회원가입 버튼 동작 구현
                // 유효성 검사 및 회원가입 로직 추가
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreens(), // 로그인 화면으로 이동
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                '회원가입',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreens(), // 로그인 화면으로 이동
                  ),
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              child: const Text(
                '이미 계정이 있으신가요? 로그인',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
