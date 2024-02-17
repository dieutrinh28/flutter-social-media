import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({super.key, required this.imageAvatarUrl, required this.username});
  final String imageAvatarUrl;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: CircleAvatar(
              radius: 20,
              backgroundImage:
              NetworkImage(imageAvatarUrl),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(username),
        ],
      ),
    );
  }
}
