import 'package:flutter/material.dart';
import 'package:social_media_app/config/config.dart';
import 'package:social_media_app/features/chat/widget/chat_card.dart';
import 'package:social_media_app/widgets/widgets.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final mockData = [
    {
      "image":
          'https://img.wattpad.com/42b529199d6fed743c3422d14122181601131070/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f776174747061642d6d656469612d736572766963652f53746f7279496d6167652f67734c72754f323134366c4e34673d3d2d3639393437353131352e313538363463643738613434303162323131363538323130383437372e6a7067?s=fit&w=720&h=720',
      "name": 'naibee',
      "last_message": "Ok",
      "time": "11m",
      "isMe": 'true',
    },
    {
      "image":
          'https://file.tinnhac.com/resize/360x-/music/2018/03/14/20180314160639-44a0.png',
      "name": 'sjwel',
      "last_message": "Wait a minute",
      "time": "13m",
      "isMe": 'true',
    },
    {
      "image":
          'https://static1.dienanh.net/upload/202107/c2f2f188-6a1b-4ba0-8825-078702f4e137.jpg',
      "name": 'storm',
      "last_message": "Reacted to your message",
      "time": "21h",
      "isMe": 'false',
    },
    {
      "image":
          'https://i.pinimg.com/736x/f2/c0/f6/f2c0f6d2ebd0da4d7ce8f3aa36e2ebfc.jpg',
      "name": 'gilibele',
      "last_message": "nothing",
      "time": "1d",
      "isMe": 'false',
    },
  ];

  @override
  Widget build(BuildContext context) {
    void onChatDetailClick() {
      Navigator.pushNamed(context, '/chat-detail');
    }

    return Scaffold(
      appBar: CustomAppbar(
        title: "Chats",
        actionIcon: Icons.edit_note_outlined,
        baseColor: false,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ColorPalette.grayscaleText.withOpacity(0.05),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    size: 20,
                  ),
                  hintText: 'Search',
                  border: InputBorder.none,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Text("Tin nhắn đang chờ"),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: mockData.length,
                itemBuilder: (context, index) {
                  return ChatCard(
                    imageAvatarUrl: mockData[index]["image"] ?? '',
                    name: mockData[index]["name"] ?? '',
                    lastMessage: mockData[index]["last_message"] ?? '',
                    time: mockData[index]["time"] ?? '',
                    isMe: mockData[index]["isMe"] ?? 'false',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
