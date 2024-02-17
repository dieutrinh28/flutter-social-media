import 'package:flutter/material.dart';
import 'package:social_media_app/config/config.dart';
import 'package:social_media_app/widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final mockData = [
    {
      "image":
          "https://e0.pxfuel.com/wallpapers/171/985/desktop-wallpaper-iga-romanowska-on-insta-highlights-in-2021-minimalist-phone-iphone-background-flower-icons-simple-green-aesthetic.jpg",
      "name": "My Highlight",
    },
    {
      "image":
          "https://i.pinimg.com/1200x/46/07/44/46074425978361d631769194068ee382.jpg",
      "name": "Me",
    },
    {
      "image":
          "https://i.pinimg.com/736x/cd/0a/df/cd0adfc28f207025fb15e477a5ae1bc5.jpg",
      "name": "Sweetie",
    },
  ];

  final images = [
    "https://kenh14cdn.com/2020/8/15/kulzsc971429695452109495260041728102589225529089n-15975008782011952213693.jpg",
    "https://i.pinimg.com/736x/de/37/81/de3781ecc083d431f5d581728d85bd06.jpg",
    "https://i.pinimg.com/1200x/96/45/c9/9645c94d3f39a967f2f34d0cb7a9729f.jpg",
    "https://kenh14cdn.com/2020/8/15/kulzsc90427902807486546412555341066667056056814n-15975008781791170668825.jpg",
    "https://i.pinimg.com/736x/b0/48/db/b048dba49e109e100775b4c83e971566.jpg",
    "https://i.pinimg.com/1200x/93/75/45/937545d0ebadd3a98f8b9276ac0d59d5.jpg",
    "https://i.pinimg.com/736x/4a/78/e8/4a78e89e56c12a1318cfe8ab006ff05c.jpg",
    "https://i.pinimg.com/736x/d0/df/58/d0df5820f1eb2f853c2dc0585f7f0744.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        leadingIcon: Icons.arrow_back_ios_new,
        leadingText: "Back",
        actionIcon: Icons.settings,
        actionPressed: () {
          Navigator.pushNamed(context, '/setting');
        },
        baseColor: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: const CircleAvatar(
                            radius: 45,
                            backgroundImage: NetworkImage(
                              'https://i.pinimg.com/1200x/4c/75/c8/4c75c874797cff36002fd274dc323ece.jpg',
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "dieutrinhhz",
                              style: TextStyle(
                                fontSize: 18,
                                color: ColorPalette.brandPrimaryBase,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            CustomSecondaryButton(
                              icon: Icons.edit,
                              text: "Edit",
                              onTap: () {},
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildUserData(
                          content: '256',
                          title: "Following",
                        ),
                        const VerticalDivider(
                          color: Colors.red,
                          thickness: 1,
                          width: 1,
                        ),
                        buildUserData(
                          content: '45K',
                          title: "Follower",
                        ),
                        const VerticalDivider(
                          color: ColorPalette.grayscaleDark,
                          thickness: 1,
                          width: 1,
                        ),
                        buildUserData(
                          content: '100',
                          title: "Post",
                        ),
                      ],
                    ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: mockData.length + 1,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: (index == 0)
                          ? Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, top: 10.0),
                                  child: Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      border: Border.all(
                                        color: ColorPalette.brandPrimaryBase,
                                        width: 2,
                                      ),
                                    ),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.add,
                                        color: ColorPalette.brandPrimaryBase,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(''),
                              ],
                            )
                          : Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: CircleAvatar(
                                    radius: 35,
                                    backgroundImage: NetworkImage(
                                        mockData[index - 1]["image"] ?? ''),
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(mockData[index - 1]["name"] ?? ''),
                              ],
                            ),
                    );
                  },
                ),
              ),
              Flexible(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Image.network(
                        images[index],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildUserData({
    required String content,
    required String title,
  }) {
    return Column(
      children: [
        Text(
          content,
          style: const TextStyle(
            color: ColorPalette.grayscaleDark,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            color: ColorPalette.grayscaleText,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
