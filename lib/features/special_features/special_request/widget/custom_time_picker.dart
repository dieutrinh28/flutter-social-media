import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:social_media_app/config/config.dart';
import 'package:social_media_app/models/time_model.dart';

class CustomTimePicker extends StatefulWidget {
  final Function(TimeModel) onResult;
  final bool isCheckout;
  final TimeModel? time;
  const CustomTimePicker(
      {super.key, required this.onResult, required this.isCheckout, this.time});

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  late TimeModel time;

  @override
  void initState() {
    super.initState();
    time = widget.time ??
        (widget.isCheckout
            ? const TimeModel(hour: 12)
            : const TimeModel(hour: 14));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Time Picker"),
              const Expanded(child: SizedBox()),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.close),
              )
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 0.5,
              color: ColorPalette.grayscaleText,
            ),
          ),
          child: Row(
            children: [
              Expanded(child: buildTimeListView(isHourMode: true)),
              Expanded(child: buildTimeListView(isHourMode: false)),
            ],
          ),
        ),
        buildOptionButton(),
      ],
    );
  }

  Widget buildOptionButton() {
    final buttonApply = InkWell(
      child: Container(
        margin: const EdgeInsets.only(right: 16, bottom: 32),
        height: 40,
        decoration: const BoxDecoration(
            border: Border.fromBorderSide(
                BorderSide(color: ColorPalette.grayscaleDark)),
            color: ColorPalette.brandPrimaryBase,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: const Center(
          child: Text(
            "Apply",
          ),
        ),
      ),
      onTap: () {
        widget.onResult.call(time);
        Navigator.pop(context);
      },
    );

    final buttonCancel = InkWell(
      child: Container(
        margin: const EdgeInsets.only(left: 16, bottom: 32),
        height: 40,
        decoration: const BoxDecoration(
            border: Border.fromBorderSide(
                BorderSide(color: ColorPalette.grayscaleDark)),
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: const Center(
          child: Text(
            "Cancel",
          ),
        ),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );

    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 24),
      child: Row(
        children: [
          Expanded(child: buttonCancel),
          const SizedBox(
            width: 8,
          ),
          Expanded(child: buttonApply),
        ],
      ),
    );
  }

  Widget buildTimeListView({required bool isHourMode}) {
    return Container(
      height: 332,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ScrollablePositionedList.builder(
        initialScrollIndex: isHourMode ? time.hour : time.minute ~/ 5,
        itemCount: isHourMode ? 24 : 60 ~/ 5,
        itemBuilder: (context, index) {
          bool isSelected =
              isHourMode ? time.hour == index : time.minute ~/ 5 == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                if (isHourMode) {
                  time = time.copyWith(hour: index);
                } else {
                  time = time.copyWith(minute: index * 5);
                }
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: isSelected
                    ? ColorPalette.brandPrimaryBase
                    : Colors.transparent,
              ),
              child: buildItem(
                isSelected: isSelected,
                isTwoDigit: !isHourMode,
                time: isHourMode ? index : index * 5,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildItem(
      {required int time, bool isTwoDigit = false, required bool isSelected}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        (isTwoDigit && time < 10) ? '0$time' : time.toString(),
        style: isSelected
            ? const TextStyle(color: Colors.white)
            : const TextStyle(color: ColorPalette.brandPrimaryBase),
        textAlign: TextAlign.center,
      ),
    );
  }

  String convertToTwoDigit(int number) {
    if (number < 10) {
      return "0$number";
    } else {
      return number.toString();
    }
  }
}
