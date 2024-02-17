import 'package:equatable/equatable.dart';

class TimeModel extends Equatable {
  final int hour;
  final int minute;

  const TimeModel({required this.hour, this.minute = 0});

  factory TimeModel.generate({isCheckIn = false}) {
    return (isCheckIn)
        ? const TimeModel(hour: 14)
        : const TimeModel(hour: 12);
  }

  TimeModel copyWith({
    int? hour,
    int? minute,
  }) {
    return TimeModel(
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
    );
  }

  @override
  String toString() {
    if (minute < 10) {
      return '$hour:0$minute';
    } else {
      return '$hour:$minute';
    }
  }

  @override
  List<Object?> get props => [hour, minute];
}
