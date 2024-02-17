import 'package:flutter/material.dart';
import 'package:social_media_app/config/config.dart';

class NewMessageCard extends StatefulWidget {
  const NewMessageCard({super.key});

  @override
  State<NewMessageCard> createState() => _NewMessageCardState();
}

class _NewMessageCardState extends State<NewMessageCard> {
  final _messageController = TextEditingController();

  void sendMessage() async {
    _messageController.clear();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: ColorPalette.grayscaleText.withOpacity(0.05),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(12),
                hintText: 'Type your message here...',
                border: OutlineInputBorder(
                  borderSide: const BorderSide(width: 0),
                  gapPadding: 10,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: _messageController.text.trim().isEmpty ? null : sendMessage,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ColorPalette.brandPrimaryBase,
              ),
              child: const Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
