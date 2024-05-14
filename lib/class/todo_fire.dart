import 'package:beginner_app/class/date_time_timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'todo_fire.freezed.dart';
part 'todo_fire.g.dart';

@freezed
class TodoFire with _$TodoFire {
  const factory TodoFire({
    required String todoId,
    required String title,
    @Default(false) bool isCompleted,
    @DateTimeTimestampConverter() required DateTime createdAt,
  }) = _TodoFire;
  
  factory TodoFire.fromJson(Map<String, dynamic> json) => _$TodoFireFromJson(json);
}
