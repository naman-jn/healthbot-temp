import 'package:flutter/material.dart';
import 'package:healthbot/models/message_data.dart';
import 'package:healthbot/styles/app_colors.dart';
import 'package:intl/intl.dart';

class MessageWidget extends StatelessWidget {
  final bool isSentMessage;
  final MessageData chatMessage;
  const MessageWidget({
    required this.isSentMessage,
    required this.chatMessage,
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Align(
      alignment: isSentMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment:
            isSentMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            margin: EdgeInsets.only(
              top: 20.0,
              left: isSentMessage ? 40 : 0,
              right: isSentMessage ? 0 : 40,
            ),
            decoration: BoxDecoration(
              color:
                  isSentMessage ? AppColors.orange400 : AppColors.secondary100,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(18),
                topRight: const Radius.circular(18),
                bottomLeft: Radius.circular(isSentMessage ? 18 : 2),
                bottomRight: Radius.circular(isSentMessage ? 2 : 18),
              ),
            ),
            child: Text(
              chatMessage.text,
              style: TextStyle(
                color: isSentMessage ? Colors.white : null,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            DateFormat('hh:mm a').format(chatMessage.createdAt).toLowerCase(),
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.grey500,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
