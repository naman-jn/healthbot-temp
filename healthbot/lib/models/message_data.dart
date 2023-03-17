import 'package:uuid/uuid.dart';

class MessageData {
  late final String id;
  final String text;
  late final DateTime createdAt;
  final bool isBotMessage;
  MessageData({
    required this.text,
    this.isBotMessage = false,
  }) {
    id = const Uuid().v4();
    createdAt = DateTime.now();
  }

  @override
  String toString() {
    return 'MessageData(id: $id, text: $text, createdAt: $createdAt, isBotMessage: $isBotMessage)';
  }
}
