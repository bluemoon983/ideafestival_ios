import 'package:flutter/material.dart';

class SettingsScreens extends StatelessWidget {
  const SettingsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('설정'),
      ),
      body: ListView(
        children: [
          // 테마 설정
          SwitchListTile(
            title: const Text('다크 모드'),
            subtitle: const Text('앱 테마를 변경합니다.'),
            value: false, // 상태 값 (테마 여부)
            onChanged: (bool value) {
              // 다크 모드 상태 변경
            },
          ),
          const Divider(),

          // 언어 설정
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('언어 설정'),
            subtitle: const Text('앱 언어를 선택합니다.'),
            onTap: () {
              // 언어 설정 화면으로 이동
            },
          ),
          const Divider(),

          // 보안 설정
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('비밀번호 변경'),
            subtitle: const Text('비밀번호를 변경합니다.'),
            onTap: () {
              // 비밀번호 변경 화면으로 이동
            },
          ),
          ListTile(
            leading: const Icon(Icons.security),
            title: const Text('2단계 인증'),
            subtitle: const Text('추가 보안 인증을 설정합니다.'),
            onTap: () {
              // 2단계 인증 설정 화면으로 이동
            },
          ),
          const Divider(),

          // 앱 정보
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('앱 정보'),
            subtitle: const Text('앱 버전 및 약관 보기'),
            onTap: () {
              // 앱 정보 화면으로 이동
            },
          ),
          // 앱 정보
          ListTile(
            leading: const Icon(Icons.call),
            title: const Text('고객 지원'),
            subtitle: const Text('도와드림 ㅅㄱ'),
            onTap: () {
              // 앱 정보 화면으로 이동
            },
          ),
        ],
      ),
    );
  }
}
