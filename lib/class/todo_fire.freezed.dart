// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_fire.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TodoFire _$TodoFireFromJson(Map<String, dynamic> json) {
  return _TodoFire.fromJson(json);
}

/// @nodoc
mixin _$TodoFire {
  String get todoId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoFireCopyWith<TodoFire> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoFireCopyWith<$Res> {
  factory $TodoFireCopyWith(TodoFire value, $Res Function(TodoFire) then) =
      _$TodoFireCopyWithImpl<$Res, TodoFire>;
  @useResult
  $Res call(
      {String todoId, String title, bool isCompleted, DateTime createdAt});
}

/// @nodoc
class _$TodoFireCopyWithImpl<$Res, $Val extends TodoFire>
    implements $TodoFireCopyWith<$Res> {
  _$TodoFireCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todoId = null,
    Object? title = null,
    Object? isCompleted = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      todoId: null == todoId
          ? _value.todoId
          : todoId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodoFireImplCopyWith<$Res>
    implements $TodoFireCopyWith<$Res> {
  factory _$$TodoFireImplCopyWith(
          _$TodoFireImpl value, $Res Function(_$TodoFireImpl) then) =
      __$$TodoFireImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String todoId, String title, bool isCompleted, DateTime createdAt});
}

/// @nodoc
class __$$TodoFireImplCopyWithImpl<$Res>
    extends _$TodoFireCopyWithImpl<$Res, _$TodoFireImpl>
    implements _$$TodoFireImplCopyWith<$Res> {
  __$$TodoFireImplCopyWithImpl(
      _$TodoFireImpl _value, $Res Function(_$TodoFireImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todoId = null,
    Object? title = null,
    Object? isCompleted = null,
    Object? createdAt = null,
  }) {
    return _then(_$TodoFireImpl(
      todoId: null == todoId
          ? _value.todoId
          : todoId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TodoFireImpl implements _TodoFire {
  const _$TodoFireImpl(
      {required this.todoId,
      required this.title,
      this.isCompleted = false,
      required this.createdAt});

  factory _$TodoFireImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodoFireImplFromJson(json);

  @override
  final String todoId;
  @override
  final String title;
  @override
  @JsonKey()
  final bool isCompleted;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'TodoFire(todoId: $todoId, title: $title, isCompleted: $isCompleted, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoFireImpl &&
            (identical(other.todoId, todoId) || other.todoId == todoId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, todoId, title, isCompleted, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoFireImplCopyWith<_$TodoFireImpl> get copyWith =>
      __$$TodoFireImplCopyWithImpl<_$TodoFireImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodoFireImplToJson(
      this,
    );
  }
}

abstract class _TodoFire implements TodoFire {
  const factory _TodoFire(
      {required final String todoId,
      required final String title,
      final bool isCompleted,
      required final DateTime createdAt}) = _$TodoFireImpl;

  factory _TodoFire.fromJson(Map<String, dynamic> json) =
      _$TodoFireImpl.fromJson;

  @override
  String get todoId;
  @override
  String get title;
  @override
  bool get isCompleted;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$TodoFireImplCopyWith<_$TodoFireImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
