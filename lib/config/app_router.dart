import 'package:flutter/material.dart';
import 'package:social_media_app/features/auth/screen/login.dart';
import 'package:social_media_app/features/auth/screen/register.dart';
import 'package:social_media_app/features/chat/screen/chat.dart';
import 'package:social_media_app/features/chat/screen/chat_detail.dart';
import 'package:social_media_app/features/create_new_post/screen/create_new_post.dart';
import 'package:social_media_app/features/home/screen/home.dart';
import 'package:social_media_app/features/profile/screen/profile.dart';
import 'package:social_media_app/features/setting/screen/setting.dart';
import 'package:social_media_app/features/special_features/screen/special_features.dart';
import 'package:social_media_app/features/special_features/special_request/screen/special_request_screen.dart';
import 'package:social_media_app/widgets/widgets.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routes = {
    '/register': (context) => const RegisterScreen(),
    '/login': (context) => const LoginScreen(),
    '/': (context) => const CustomFooterMenu(),
    '/home': (context) => HomeScreen(),
    '/create-new-post': (context) => const CreatePostScreen(),
    '/profile': (context) => ProfileScreen(),
    '/setting': (context) => const SettingScreen(),
    '/chatting': (context) => ChatScreen(),
    '/chat-detail': (context) => const ChatDetailScreen(),
    '/special-features': (context) => const SpecialFeaturesScreen(),
    '/special-requests': (context) => SpecialRequestScreen(),
  };
}
