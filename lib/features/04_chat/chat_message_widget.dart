import 'package:flutter/material.dart';

class ChatMessage {
  final String role;
  final String message;

  ChatMessage({required this.role, required this.message});
}

class ChatMessageWidget extends StatelessWidget {
  final String role;
  final String message;

  ChatMessageWidget({required this.role, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      alignment: role == 'You' ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            role == 'You' ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            role,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(message),
        ],
      ),
    );
  }
}
