import 'package:flutter/material.dart';
import 'package:social_media_app/config/config.dart';
import 'package:social_media_app/widgets/widgets.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  String _dropdownValue = "Public";
  late TextEditingController contentController;

  @override
  void initState() {
    super.initState();
    contentController = TextEditingController();
  }

  @override
  void dispose() {
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void onPostClick() {}
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppbar(
        title: "Create New Post",
        leadingIcon: Icons.highlight_remove_outlined,
        leadingPressed: () {
          Navigator.pop(context);
        },
        actionText: "Post",
        actionPressed: onPostClick,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white70,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              child: Icon(
                                Icons.person,
                                size: 48,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'dieutrinhhz',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: ColorPalette.grayscaleDark,
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            Container(
                              padding: const EdgeInsets.only(left: 8, right: 4),
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                color: ColorPalette.brandPrimaryBase,
                              ),
                              height: 24,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  items: const [
                                    DropdownMenuItem(
                                      value: "Public",
                                      child: Text("Public"),
                                    ),
                                    DropdownMenuItem(
                                      value: "Private",
                                      child: Text("Private"),
                                    ),
                                  ],
                                  onChanged: (String? selectedValue) {
                                    if (selectedValue is String) {
                                      setState(() {
                                        _dropdownValue = selectedValue;
                                      });
                                    }
                                  },
                                  iconEnabledColor: Colors.white,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  value: _dropdownValue,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  dropdownColor: ColorPalette.brandPrimaryBase,
                                ),
                              ),
                            ),
                          ],
                        ),
                        TextField(
                          controller: contentController,
                          decoration: InputDecoration(
                            hintText: "What's on your mind?",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: ColorPalette.grayscaleText.withOpacity(0.4),
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                          maxLines: 4,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Also post on",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: ColorPalette.grayscaleDark,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Facebook",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: ColorPalette.grayscaleDark,
                      ),
                    ),
                    CustomSwitch(),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Twitter",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: ColorPalette.grayscaleDark,
                      ),
                    ),
                    CustomSwitch(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
