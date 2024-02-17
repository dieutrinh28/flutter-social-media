class MessageModel {
  final bool isSentByMe;
  final String text;
  final DateTime date;

  const MessageModel({
    required this.isSentByMe,
    required this.text,
    required this.date,
  });
}
