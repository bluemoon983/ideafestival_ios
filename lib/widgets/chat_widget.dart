import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  final String name;
  final String lastMessage;
  final IconData icon;
  final VoidCallback onTap;

  const ChatWidget({
    super.key,
    required this.name,
    required this.lastMessage,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300, // 구분선 색상
            width: 1.0, // 구분선 두께
          ),
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(icon, size: 24.0),
        ),
        title: Text(name),
        subtitle: Text(lastMessage),
        onTap: onTap,
      ),
    );
  }
}
