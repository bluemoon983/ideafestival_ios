import 'package:flutter/material.dart';

class HelpScreens extends StatelessWidget {
  const HelpScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('도움말'),
      ),
      body: ListView(
        children: const [
          QnAItem(
            question: 'Q1. 이 앱은 어떤 기능을 제공하나요?',
            answer: 'A. 이 앱은 사용자에게 다양한 기능을 제공하며, 간편한 UI로 빠른 작업을 도와줍니다.',
          ),
          QnAItem(
            question: 'Q2. 계정을 어떻게 생성하나요?',
            answer: 'A. 메인 화면에서 "회원가입" 버튼을 눌러 간단한 정보를 입력하면 계정을 생성할 수 있습니다.',
          ),
          QnAItem(
            question: 'Q3. 비밀번호를 잊어버렸어요. 어떻게 해야 하나요?',
            answer: 'A. 로그인 화면에서 "비밀번호 찾기"를 클릭하여 이메일을 입력하면 재설정 링크를 받을 수 있습니다.',
          ),
          QnAItem(
            question: 'Q4. 고객 지원에 어떻게 연락할 수 있나요?',
            answer: 'A. 설정 화면에서 "고객 지원" 버튼을 눌러 문의를 남길 수 있습니다.',
          ),
        ],
      ),
    );
  }
}

class QnAItem extends StatefulWidget {
  final String question;
  final String answer;

  const QnAItem({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  _QnAItemState createState() => _QnAItemState();
}

class _QnAItemState extends State<QnAItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(widget.question),
        subtitle: _isExpanded ? Text(widget.answer) : null,
        trailing: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
        onTap: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
      ),
    );
  }
}
