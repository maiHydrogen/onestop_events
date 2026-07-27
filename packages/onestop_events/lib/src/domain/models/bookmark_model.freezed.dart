// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BookmarkModel _$BookmarkModelFromJson(Map<String, dynamic> json) {
  return _BookmarkModel.fromJson(json);
}

/// @nodoc
mixin _$BookmarkModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  List<String> get bookmarkedEventIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookmarkModelCopyWith<BookmarkModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookmarkModelCopyWith<$Res> {
  factory $BookmarkModelCopyWith(
          BookmarkModel value, $Res Function(BookmarkModel) then) =
      _$BookmarkModelCopyWithImpl<$Res, BookmarkModel>;
  @useResult
  $Res call({String id, String userId, List<String> bookmarkedEventIds});
}

/// @nodoc
class _$BookmarkModelCopyWithImpl<$Res, $Val extends BookmarkModel>
    implements $BookmarkModelCopyWith<$Res> {
  _$BookmarkModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? bookmarkedEventIds = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      bookmarkedEventIds: null == bookmarkedEventIds
          ? _value.bookmarkedEventIds
          : bookmarkedEventIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookmarkModelImplCopyWith<$Res>
    implements $BookmarkModelCopyWith<$Res> {
  factory _$$BookmarkModelImplCopyWith(
          _$BookmarkModelImpl value, $Res Function(_$BookmarkModelImpl) then) =
      __$$BookmarkModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String userId, List<String> bookmarkedEventIds});
}

/// @nodoc
class __$$BookmarkModelImplCopyWithImpl<$Res>
    extends _$BookmarkModelCopyWithImpl<$Res, _$BookmarkModelImpl>
    implements _$$BookmarkModelImplCopyWith<$Res> {
  __$$BookmarkModelImplCopyWithImpl(
      _$BookmarkModelImpl _value, $Res Function(_$BookmarkModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? bookmarkedEventIds = null,
  }) {
    return _then(_$BookmarkModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      bookmarkedEventIds: null == bookmarkedEventIds
          ? _value._bookmarkedEventIds
          : bookmarkedEventIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookmarkModelImpl implements _BookmarkModel {
  const _$BookmarkModelImpl(
      {required this.id,
      required this.userId,
      required final List<String> bookmarkedEventIds})
      : _bookmarkedEventIds = bookmarkedEventIds;

  factory _$BookmarkModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookmarkModelImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  final List<String> _bookmarkedEventIds;
  @override
  List<String> get bookmarkedEventIds {
    if (_bookmarkedEventIds is EqualUnmodifiableListView)
      return _bookmarkedEventIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookmarkedEventIds);
  }

  @override
  String toString() {
    return 'BookmarkModel(id: $id, userId: $userId, bookmarkedEventIds: $bookmarkedEventIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality()
                .equals(other._bookmarkedEventIds, _bookmarkedEventIds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId,
      const DeepCollectionEquality().hash(_bookmarkedEventIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookmarkModelImplCopyWith<_$BookmarkModelImpl> get copyWith =>
      __$$BookmarkModelImplCopyWithImpl<_$BookmarkModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookmarkModelImplToJson(
      this,
    );
  }
}

abstract class _BookmarkModel implements BookmarkModel {
  const factory _BookmarkModel(
      {required final String id,
      required final String userId,
      required final List<String> bookmarkedEventIds}) = _$BookmarkModelImpl;

  factory _BookmarkModel.fromJson(Map<String, dynamic> json) =
      _$BookmarkModelImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  List<String> get bookmarkedEventIds;
  @override
  @JsonKey(ignore: true)
  _$$BookmarkModelImplCopyWith<_$BookmarkModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
