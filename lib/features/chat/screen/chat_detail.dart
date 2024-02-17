import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:social_media_app/config/color_palette.dart';
import 'package:social_media_app/features/chat/model/message.dart';
import 'package:social_media_app/features/chat/widget/message_card.dart';
import 'package:social_media_app/features/chat/widget/new_message_card.dart';

class ChatDetailScreen extends StatelessWidget {
  const ChatDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<MessageModel> messages = [

      MessageModel(
        text: 'Địa chỉ là TMA Solutions Off 6',
        date: DateTime.now().subtract(
          const Duration(days: 3, minutes: 4),
        ),
        isSentByMe: true,
      ),
      MessageModel(
        text: 'Giao bánh lúc 4h chiều nhé',
        date: DateTime.now().subtract(
          const Duration(days: 3, minutes: 5),
        ),
        isSentByMe: true,
      ),
      MessageModel(
        text: 'Cho sốp xin thông tin của bạn nha',
        date: DateTime.now().subtract(
          const Duration(days: 4, minutes: 4),
        ),
        isSentByMe: false,
      ),
      MessageModel(
        text: 'Ok bạn, sốp đã chốt đơn',
        date: DateTime.now().subtract(
          const Duration(days: 7, minutes: 5),
        ),
        isSentByMe: false,
      ),
      MessageModel(
        text: 'Sốp cho mình đặt 1 bánh size L',
        date: DateTime.now().subtract(
          const Duration(days: 7, minutes: 4),
        ),
        isSentByMe: true,
      ),
      MessageModel(
        text: 'Sốp chào bạn',
        date: DateTime.now().subtract(
          const Duration(days: 11, minutes: 2),
        ),
        isSentByMe: false,
      ),
      MessageModel(
        text: 'Xin chào sốp',
        date: DateTime.now().subtract(
          const Duration(days: 11, minutes: 3),
        ),
        isSentByMe: true,
      ),
    ].reversed.toList();

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(
          'sjwel',
          style: TextStyle(
            color: ColorPalette.brandPrimaryBase,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leadingWidth: 100,
        actions: [
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                children: [
                    Icon(
                      Icons.call,
                      color: ColorPalette.brandPrimaryBase,
                    ),
                  SizedBox(width: 12,),
                  Icon(
                    Icons.video_call,
                    color: ColorPalette.brandPrimaryBase,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GroupedListView<MessageModel, DateTime>(
                padding: const EdgeInsets.all(8),
                reverse: true,
                order: GroupedListOrder.DESC,
                elements: messages,
                groupBy: (messages) => DateTime(
                  messages.date.year,
                  messages.date.month,
                  messages.date.day,
                ),
                groupHeaderBuilder: (MessageModel message) {
                  return SizedBox(
                    height: 40,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          DateFormat.yMMMd().format(message.date),
                          style: const TextStyle(
                            color: ColorPalette.grayscaleDark,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemBuilder: (context, message) {
                  return MessageCard(isMe: message.isSentByMe, message: message.text,);
                },
              ),
            ),
            const NewMessageCard(),
          ],
        ),
      ),
    );
  }
}
