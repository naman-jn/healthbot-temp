import 'package:flutter/material.dart';
import 'package:healthbot/helpers/api_helper.dart';
import 'package:healthbot/models/message_data.dart';
import 'package:healthbot/styles/app_colors.dart';
import 'package:healthbot/views/chat/chatbot_screen.dart';

class MessageTextfield extends StatefulWidget {
  final ChatScreenState chatScreenState;
  final List<MessageData> messages;

  const MessageTextfield({
    required this.chatScreenState,
    required this.messages,
    super.key,
  });

  @override
  State<MessageTextfield> createState() => _MessageTextfieldState();
}

class _MessageTextfieldState extends State<MessageTextfield> {
  final controller = TextEditingController();

  @override
  Widget build(
    BuildContext context,
  ) {
    Future<void> sendMessage(String message) async {
      addMessage(message);
      final reply = await ApiHelper.ask(message);
      addMessage(reply, true);
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 60,
        child: TextFormField(
          controller: controller,
          style: const TextStyle(
            color: AppColors.brown600,
            fontWeight: FontWeight.w500,
          ),
          expands: true,
          maxLines: null,
          decoration: InputDecoration(
              suffixIcon: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: InkWell(
                  onTap: () async {
                    String message = controller.text.trim();
                    if (message.isNotEmpty) {
                      controller.clear();
                      sendMessage(message);
                    }
                  },
                  child: const Icon(Icons.send_outlined),
                ),
              ),
              hintText: 'Type here...',
              hintStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.grey500,
                fontSize: 14,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.grey200,
                ),
                borderRadius: BorderRadius.circular(18),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.grey200,
                ),
                borderRadius: BorderRadius.circular(18),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.orange200,
                ),
                borderRadius: BorderRadius.circular(18),
              )),
        ),
      ),
    );
  }

  void addMessage(String message, [bool? isBotMessage]) {
    widget.chatScreenState.setState(() {
      widget.messages.add(
        MessageData(
          text: message,
          isBotMessage: isBotMessage ?? false,
        ),
      );
    });
  }
}
