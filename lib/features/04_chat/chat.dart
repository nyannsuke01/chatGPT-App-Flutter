import 'dart:convert';
import 'package:flutter/material.dart';
import '../../app/constants.dart';
import 'package:http/http.dart' as http;
import 'chat_message_widget.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [];

  Future<void> _sendMessage(String message) async {
    _messageController.clear();

    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Constants.OPEN_AI_KEY}',
      },
      body: jsonEncode({
        "model": "gpt-3.5-turbo-0301",
        "messages": [
          {"role": "user", "content": message}
        ]
      }),
    );

    final data = jsonDecode(response.body);
    setState(() {
      _messages.add(ChatMessage(
        role: 'You',
        message: message,
      ));
      _messages.add(ChatMessage(
        role: 'AI',
        message: data["choices"][0]["message"]["content"],
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatGPT'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final chatMessage = _messages[index];
                return ChatMessageWidget(
                  role: chatMessage.role,
                  message: chatMessage.message,
                );
              },
              itemCount: _messages.length,
            ),
          ),
          TextField(
            controller: _messageController,
            decoration: InputDecoration(
              hintText: 'Enter your message',
              suffixIcon: IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  _sendMessage(_messageController.text);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
