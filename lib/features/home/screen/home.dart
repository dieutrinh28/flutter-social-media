import 'package:flutter/material.dart';
import 'package:social_media_app/config/config.dart';
import 'package:social_media_app/features/home/model/post.dart';
import 'package:social_media_app/features/home/widget/post_card.dart';
import 'package:social_media_app/features/home/widget/story_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final mockData = [
    {
      "image":
          'https://img.wattpad.com/42b529199d6fed743c3422d14122181601131070/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f776174747061642d6d656469612d736572766963652f53746f7279496d6167652f67734c72754f323134366c4e34673d3d2d3639393437353131352e313538363463643738613434303162323131363538323130383437372e6a7067?s=fit&w=720&h=720',
      "name": 'naibee'
    },
    {
      "image":
          'https://file.tinnhac.com/resize/360x-/music/2018/03/14/20180314160639-44a0.png',
      "name": 'sjwel'
    },
    {
      "image":
          'https://static1.dienanh.net/upload/202107/c2f2f188-6a1b-4ba0-8825-078702f4e137.jpg',
      "name": 'storm'
    },
    {
      "image":
          'https://i.pinimg.com/736x/f2/c0/f6/f2c0f6d2ebd0da4d7ce8f3aa36e2ebfc.jpg',
      "name": 'gilibele'
    },
  ];

  @override
  Widget build(BuildContext context) {
    void navigateCreateNewPost() {
      Navigator.pushNamed(context, '/create-new-post');
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          'Media X',
          style: TextStyle(
            color: ColorPalette.brandPrimaryBase,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              navigateCreateNewPost();
            },
            icon: const Icon(
              Icons.add,
              size: 24,
              color: ColorPalette.grayscaleDark,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              size: 24,
              color: ColorPalette.grayscaleDark,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: mockData.length + 1,
                  itemBuilder: (context, index) {
                    return (index == 0)
                        ? Stack(
                            children: [
                              StoryCard(
                                imageAvatarUrl:
                                    'https://i.pinimg.com/1200x/4c/75/c8/4c75c874797cff36002fd274dc323ece.jpg',
                                username: "dieutrinhhz",
                              ),
                              Positioned(
                                bottom: 37,
                                right: 24,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue,
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : StoryCard(
                            imageAvatarUrl: mockData[index - 1]["image"] ?? '',
                            username: mockData[index - 1]["name"] ?? '');
                  },
                ),
              ),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return (index == 1)
                        ? PostCard(
                            imageAvatarUrl:
                                Post.generateAnother().imageAvatarUrl ?? '',
                            username: Post.generateAnother().username ?? '',
                            positionPost:
                                Post.generateAnother().positionPost ?? '',
                            imagePostUrl:
                                Post.generateAnother().imagePostUrl ?? '',
                            contentPost:
                                Post.generateAnother().contentPost ?? '',
                          )
                        : PostCard(
                            imageAvatarUrl:
                                Post.generate().imageAvatarUrl ?? '',
                            username: Post.generate().username ?? '',
                            positionPost: Post.generate().positionPost ?? '',
                            imagePostUrl: Post.generate().imagePostUrl ?? '',
                            contentPost: Post.generate().contentPost ?? '',
                          );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
