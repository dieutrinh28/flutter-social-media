import 'package:equatable/equatable.dart';
import 'package:social_media_app/config/config.dart';
import 'package:social_media_app/features/special_features/special_request/model/special_request_item.dart';
import 'package:social_media_app/models/time_model.dart';

class SpecialRequestModel extends Equatable {
  final List<SpecialRequestItem> items;

  const SpecialRequestModel({required this.items});

  @override
  List<Object?> get props => [items];

  factory SpecialRequestModel.initial() {
    return SpecialRequestModel(items: [
      SpecialRequestItem<bool>(
          title: SpecialRequest.isNonSmokingRoom, result: true),
      SpecialRequestItem<SpecialBedType>(
          title: SpecialRequest.typeOfBed, result: SpecialBedType.doubleBed),
      SpecialRequestItem<TimeModel>(
          title: SpecialRequest.checkInTime,
          result: TimeModel.generate(isCheckIn: true)),
      SpecialRequestItem<TimeModel>(
          title: SpecialRequest.checkOutTime,
          result: TimeModel.generate(isCheckIn: false)),
      SpecialRequestItem<String>(title: SpecialRequest.other, result: ''),
    ]);
  }

  SpecialRequestModel copyWith({
    List<SpecialRequestItem>? items,
  }) {
    return SpecialRequestModel(items: items ?? this.items);
  }
}
