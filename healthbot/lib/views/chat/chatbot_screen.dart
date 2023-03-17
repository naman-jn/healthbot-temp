import 'package:flutter/material.dart';
import 'package:healthbot/models/message_data.dart';
import 'package:healthbot/views/chat/message_textfield.dart';
import 'package:healthbot/views/chat/message_widget.dart';
import 'package:sticky_grouped_list/sticky_grouped_list.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  List<MessageData> messages = [];
  @override
  Widget build(BuildContext context) {
    Widget buildGroupSeparator(MessageData message) {
      String dayText =
          '${message.createdAt.day}/${message.createdAt.month}/${message.createdAt.year}';
      int difference = calculateDifference(message.createdAt);
      if (difference == 0) {
        dayText = 'Today';
      } else if (difference == -1) {
        dayText = 'Yesterday';
      }

      return SizedBox(
        height: 50,
        width: 80,
        child: Align(
          alignment: Alignment.center,
          child: Container(
            color: Colors.white,
            child: Text(
              dayText,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: StickyGroupedListView<MessageData, DateTime>(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              elements: messages,
              order: StickyGroupedListOrder.ASC,
              groupBy: (MessageData message) => DateTime(
                message.createdAt.year,
                message.createdAt.month,
                message.createdAt.day,
              ),
              groupComparator: (DateTime value1, DateTime value2) =>
                  value2.compareTo(value1),
              itemComparator: (
                MessageData chatMessage1,
                MessageData chatMessage2,
              ) =>
                  chatMessage2.createdAt.compareTo(chatMessage1.createdAt),
              floatingHeader: true,
              groupSeparatorBuilder: buildGroupSeparator,
              itemBuilder: (_, chatMessage) => MessageWidget(
                isSentMessage: !chatMessage.isBotMessage,
                chatMessage: chatMessage,
              ),
              reverse: true,
            ),
          ),
          MessageTextfield(chatScreenState: this, messages: messages)
        ],
      ),
    );
  }
}

int calculateDifference(DateTime date) {
  DateTime now = DateTime.now();
  return DateTime(date.year, date.month, date.day)
      .difference(DateTime(now.year, now.month, now.day))
      .inDays;
}
