import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  final String imageAvatarUrl;
  final String name;
  final String lastMessage;
  final String time;
  final String isMe;
  const ChatCard({
    super.key,
    required this.imageAvatarUrl,
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 40,
        backgroundImage: NetworkImage(imageAvatarUrl),
      ),
      title: Text(name),
      subtitle: isMe == 'true' ? Text("You: $lastMessage - $time") : Text("$lastMessage - $time"),
      trailing: const Icon(Icons.camera_alt_outlined),
      onTap: () {
        Navigator.pushNamed(context, '/chat-detail');
      },
    );
  }
}
