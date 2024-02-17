import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final String? imageAvatarUrl;
  final String? username;
  final String? positionPost;
  final String? imagePostUrl;
  final String? contentPost;

  const Post(
      {required this.imageAvatarUrl,
      required this.username,
      required this.positionPost,
      required this.imagePostUrl,
      required this.contentPost});

  @override
  List<Object?> get props => [
        imageAvatarUrl,
        username,
        positionPost,
        imagePostUrl,
        contentPost,
      ];

  factory Post.generate() {
    return const Post(
        imageAvatarUrl:
            'https://img.wattpad.com/42b529199d6fed743c3422d14122181601131070/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f776174747061642d6d656469612d736572766963652f53746f7279496d6167652f67734c72754f323134366c4e34673d3d2d3639393437353131352e313538363463643738613434303162323131363538323130383437372e6a7067?s=fit&w=720&h=720',
        username: "naibee",
        positionPost: "Hue, VietName",
        imagePostUrl:
            'https://saeedamali.files.wordpress.com/2020/07/ottokim3.jpg?w=365&h=365&crop=1',
        contentPost: "");
  }

  factory Post.generateAnother() {
    return const Post(
        imageAvatarUrl:
            'https://i.pinimg.com/1200x/4c/75/c8/4c75c874797cff36002fd274dc323ece.jpg',
        username: "dieutrinhhz",
        positionPost: "Sai Gon",
        imagePostUrl:
            'https://www.picamemag.com/wp-content/uploads/2018/03/otto-kim-picame-6.jpg',
        contentPost: "");
  }
}
