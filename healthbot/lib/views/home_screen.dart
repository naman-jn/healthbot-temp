import 'package:flutter/material.dart';
import 'package:healthbot/views/chat/chatbot_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Health Bot')),
      body: Center(
        child: InkWell(
          onTap: () async {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ChatScreen()));
          },
          child: const Text(
            'Start Asking',
          ),
        ),
      ),
    );
  }
}
