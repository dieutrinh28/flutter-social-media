
import 'package:social_media_app/config/config.dart';

class SpecialRequestItem<T>{
  bool isChecked;
  final SpecialRequest title;
  T result;

  SpecialRequestItem({
    this.isChecked = false,
    required this.title,
    required this.result,
  });

  SpecialRequestItem copyWith({
    bool? isChecked,
    SpecialRequest? title,
    T? result,
  }) {
    return SpecialRequestItem(
      isChecked: isChecked ?? this.isChecked,
      title: title ?? this.title,
      result: result ?? this.result,
    );
  }
}
