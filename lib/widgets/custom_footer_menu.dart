import 'package:flutter/material.dart';
import 'package:social_media_app/config/config.dart';
import 'package:social_media_app/features/chat/screen/chat.dart';
import 'package:social_media_app/features/home/screen/home.dart';
import 'package:social_media_app/features/profile/screen/profile.dart';
import 'package:social_media_app/features/special_features/screen/special_features.dart';

class CustomFooterMenu extends StatefulWidget {
  const CustomFooterMenu({
    super.key,
  });

  @override
  State<CustomFooterMenu> createState() => _CustomFooterMenuState();
}

class _CustomFooterMenuState extends State<CustomFooterMenu> {
  int currentIndex = 0;

  final List<Widget> pages = [
    HomeScreen(),
    ChatScreen(),
    const SpecialFeaturesScreen(),
    ProfileScreen(),
  ];

  List<BottomNavigationBarItem> bottomNavBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.chat_outlined),
      label: 'Chat',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search_outlined),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_outline),
      label: 'Profile',
    ),
  ];

  void onNavBarItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        color: ColorPalette.brandPrimaryBase,
        child: BottomNavigationBar(
          backgroundColor: ColorPalette.brandPrimaryBase,
          items: bottomNavBarItems,
          currentIndex: currentIndex,
          onTap: onNavBarItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          showUnselectedLabels: false,
          iconSize: 24,
        ),
      ),
    );
  }
}
