import 'package:flutter/material.dart';
import 'package:iosgsmarket/src/screens/join_screens.dart';
import 'package:iosgsmarket/src/screens/main_screens.dart';

class LoginScreens extends StatelessWidget {
  const LoginScreens({super.key});

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
            TextField(
              obscureText: true,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: '비밀번호',
                labelStyle: const TextStyle(color: Colors.white70),
                filled: true,
                fillColor: const Color.fromRGBO(50, 50, 50, 1),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.visibility, color: Colors.white70),
                  onPressed: () {
                    // 비밀번호 표시 토글 기능 구현
                  },
                ),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // 로그인 버튼 동작 구현
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const MainScreens(), // MainScreen으로 이동
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
                '로그인',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const JoinScreens(), // MainScreen으로 이동
                  ),
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              child: const Text(
                '회원가입',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.facebook, color: Colors.blue),
                  onPressed: () {
                    // Facebook 로그인 동작 구현
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.g_translate, color: Colors.red),
                  onPressed: () {
                    // Google 로그인 동작 구현
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
