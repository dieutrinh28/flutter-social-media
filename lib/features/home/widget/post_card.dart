import 'package:flutter/material.dart';
import 'package:social_media_app/config/config.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.imageAvatarUrl,
    required this.username,
    required this.positionPost,
    required this.imagePostUrl,
    required this.contentPost,
  });

  final String imageAvatarUrl;
  final String username;
  final String positionPost;
  final String imagePostUrl;
  final String contentPost;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: CircleAvatar(
                radius: 14,
                backgroundImage:
                NetworkImage(imageAvatarUrl),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: ColorPalette.grayscaleDark,
                  ),
                ),
                Text(
                  positionPost,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    color: ColorPalette.grayscaleText,
                  ),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_horiz_outlined,
                size: 24,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        // Container(
        //   width: 120,
        //   height: 120,
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: NetworkImage(imagePostUrl),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
        Image.network(imagePostUrl),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border,
                color: ColorPalette.tertiary,
                size: 24,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.comment_outlined,
                color: ColorPalette.grayscaleDark,
                size: 24,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.ios_share_outlined,
                color: ColorPalette.grayscaleDark,
                size: 24,
              ),
            ),
            const Expanded(child: SizedBox()),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.save_outlined,
                color: ColorPalette.grayscaleDark,
                size: 24,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, bottom: 20),
          child: Column(
            children: [
              const Text(
                'Like by you and 500 others',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: ColorPalette.grayscaleText,
                ),
              ),
              Text(
                contentPost,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: ColorPalette.grayscaleText,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
