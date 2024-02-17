import 'package:flutter/material.dart';
import 'package:social_media_app/config/config.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({super.key, required this.isMe, required this.message});

  final bool isMe;
  final String message;

  @override
  Widget build(BuildContext context) {
    return isMe ? buildMessage() : Row(
      children: [
        const CircleAvatar(
          radius: 18,
          backgroundImage: NetworkImage('https://file.tinnhac.com/resize/360x-/music/2018/03/14/20180314160639-44a0.png'),
        ),
        buildMessage(),
      ],
    )
    ;
  }
  buildMessage() {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
            padding:
            const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
            margin: const EdgeInsets.all(16),
            constraints: const BoxConstraints(maxWidth: 280),
            decoration: BoxDecoration(
                color: isMe
                    ? ColorPalette.brandPrimaryBase
                    : ColorPalette.grayscaleText.withOpacity(0.4),
                borderRadius: const BorderRadius.all(Radius.circular(24))),
            child: Column(
              crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 16,
                    color: isMe ? Colors.white : ColorPalette.grayscaleDark,
                  ),
                  textAlign: isMe ? TextAlign.end : TextAlign.start,
                )
              ],
            )),
      ],
    );
  }
}
