import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/config/config.dart';
import 'package:social_media_app/features/special_features/special_request/model/special_request_item.dart';
import 'package:social_media_app/features/special_features/special_request/model/special_request_model.dart';
import 'package:social_media_app/features/special_features/special_request/widget/custom_time_picker.dart';
import 'package:social_media_app/models/time_model.dart';
import 'package:social_media_app/widgets/widgets.dart';

class SpecialRequestScreen extends StatefulWidget {
  SpecialRequestScreen({super.key});

  final List<SpecialRequestItem> specialRequestList =
      SpecialRequestModel.initial().items;

  @override
  State<SpecialRequestScreen> createState() => _SpecialRequestScreenState();
}

class _SpecialRequestScreenState extends State<SpecialRequestScreen> {
  late SpecialRequestModel specialRequestModel;

  @override
  void initState() {
    super.initState();
    specialRequestModel = SpecialRequestModel(items: widget.specialRequestList);
    print('init State: ${specialRequestModel.items.toString()}');
  }

  @override
  Widget build(BuildContext context) {
    print('build: ${specialRequestModel.items.toString()}');
    return Scaffold(
      appBar: CustomAppbar(
        title: "Special Request",
        baseColor: true,
        leadingIcon: Icons.arrow_back_ios_new,
        leadingText: "Back",
        leadingPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            /*Container(
              padding: const EdgeInsets.all(16),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Special Request Section'),
                  SizedBox(height: 4),
                  Text(
                      'Choose your option about my special request i can provide'),
                ],
              ),
            ),*/
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: specialRequestModel.items.length,
                itemBuilder: (context, index) {
                  return buildShowItem(
                    item: specialRequestModel.items[index],
                    child: typeSpecial(
                      item: specialRequestModel.items[index],
                      context: context,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildShowItem({
    required SpecialRequestItem item,
    required Widget child,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            children: [
              Checkbox(
                side: MaterialStateBorderSide.resolveWith(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return const BorderSide(
                        color: ColorPalette.brandPrimaryBase,
                        width: 1,
                      );
                    }
                    return const BorderSide(
                      width: 1,
                      color: ColorPalette.grayscaleText,
                    );
                  },
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                activeColor: ColorPalette.brandPrimaryBase.withOpacity(0.08),
                checkColor: ColorPalette.brandPrimaryBase,
                value: item.isChecked,
                onChanged: (value) {
                  setState(() {
                    item.isChecked = value ?? false;
                  });
                  print('isSelected nef: ${item.isChecked}');
                },
              ),
              Text(
                item.title.toString(),
              ), //create function to translate to String
            ],
          ),
        ),
        Offstage(
          offstage: !item.isChecked,
          child: Padding(
            padding: const EdgeInsets.only(left: 40, right: 16),
            child: child,
          ),
        ),
      ],
    );
  }

  Widget typeSpecial({
    required SpecialRequestItem item,
    required BuildContext context,
  }) {
    switch (item.title) {
      case SpecialRequest.isNonSmokingRoom:
        break;
      case SpecialRequest.typeOfBed:
        return buildTypeOfBed(item: item);
      case SpecialRequest.checkInTime:
        return buildSelectTime(item: item, context: context);
      case SpecialRequest.checkOutTime:
        return buildSelectTime(item: item, context: context);
      case SpecialRequest.other:
        return buildOther(item: item);
      default:
        break;
    }
    return Container();
  }

  Widget buildTypeOfBed({required SpecialRequestItem item}) {
    SpecialBedType? groupValue = item.result;
    return Column(
      children: SpecialBedType.values
          .map((e) => ListTileTheme(
                horizontalTitleGap: 0.0,
                child: RadioListTile(
                  contentPadding: EdgeInsets.zero,
                  activeColor: ColorPalette.brandPrimaryBase,
                  title: Text(e.toString()), // convert to String too
                  value: e,
                  groupValue: groupValue,
                  onChanged: (value) {
                    setState(() {
                      groupValue = value;
                      item.result = value;
                    });
                  },
                ),
              ))
          .toList(),
    );
  }

  Widget buildSelectTime(
      {required SpecialRequestItem item, required BuildContext context}) {
    final isCheckout = item.title == SpecialRequest.checkOutTime;
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          elevation: 0,
          backgroundColor: Colors.white,
          isDismissible: false,
          showDragHandle: true,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16),
            ),
          ),
          builder: (BuildContext context) {
            return FractionallySizedBox(
              child: CustomTimePicker(
                isCheckout: isCheckout,
                time: item.result as TimeModel,
                onResult: (time) {
                  setState(() {
                    item.result = time;
                  });
                },
              ),
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: ColorPalette.grayscaleDark,
          ),
          color: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.access_time_outlined),
            const SizedBox(
              width: 8,
            ),
            Text((item.result as TimeModel).toString()),
          ],
        ),
      ),
    );
  }

  Widget buildOther({required SpecialRequestItem item}) {
    return Focus(
      onFocusChange: (hasFocus) {
        if (!hasFocus) {}
      },
      // child: Theme(
      //   data: ThemeData(
      //     textSelectionTheme: TextSelectionThemeData(
      //       selectionColor: ColorPalette.brandPrimaryBase.withOpacity(0.5),
      //       // selectionHandleColor: ColorPalette.brandPrimaryBase,
      //       // cursorColor: ColorPalette.brandPrimaryBase,
      //     ),
      //   ),
      //   child: TextField(
      //     cursorColor: ColorPalette.brandPrimaryBase,
      //     maxLength: 256,
      //     maxLines: 4,
      //     autofocus: false,
      //     onChanged: (value) {
      //       item.result = value;
      //     },
      //     decoration: InputDecoration(
      //       contentPadding:
      //           const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      //       hintText: 'Enter description',
      //       border: OutlineInputBorder(
      //         borderSide: const BorderSide(
      //           color: ColorPalette.grayscaleText,
      //           width: 1,
      //         ),
      //         borderRadius: BorderRadius.circular(8),
      //       ),
      //       focusedBorder: OutlineInputBorder(
      //         borderSide: const BorderSide(
      //           color: ColorPalette.grayscaleText,
      //           width: 1,
      //         ),
      //         borderRadius: BorderRadius.circular(8),
      //       ),
      //     ),
      //   ),
      // ),

      child: CupertinoTheme(
        data: CupertinoThemeData(
          textTheme: CupertinoTextThemeData(
            primaryColor: ColorPalette.brandPrimaryBase,
          ),
        ),
        child: TextField(
          cursorColor: ColorPalette.brandPrimaryBase,
          maxLength: 256,
          maxLines: 4,
          autofocus: false,
          onChanged: (value) {
            item.result = value;
          },
          decoration: InputDecoration(
            contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
            hintText: 'Enter description',
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorPalette.grayscaleText,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorPalette.grayscaleText,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
