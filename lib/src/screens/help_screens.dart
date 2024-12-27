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
            question: 'Q. 질문',
            answer: 'A. -설명',
          ),
          QnAItem(
            question: 'Q. 질문',
            answer: 'A. -설명',
          ),
          QnAItem(
            question: 'Q. 질문',
            answer: 'A. -설명',
          ),
          QnAItem(
            question: 'Q. 질문',
            answer: 'A. -설명',
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
