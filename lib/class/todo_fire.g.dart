// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_fire.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoFireImpl _$$TodoFireImplFromJson(Map<String, dynamic> json) =>
    _$TodoFireImpl(
      todoId: json['todoId'] as String,
      title: json['title'] as String,
      isCompleted: json['isCompleted'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$TodoFireImplToJson(_$TodoFireImpl instance) =>
    <String, dynamic>{
      'todoId': instance.todoId,
      'title': instance.title,
      'isCompleted': instance.isCompleted,
      'createdAt': instance.createdAt.toIso8601String(),
    };
