// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventModel _$EventModelFromJson(Map<String, dynamic> json) {
  return _EventModel.fromJson(json);
}

/// @nodoc
mixin _$EventModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  String get venue =>
      throw _privateConstructorUsedError; // Nullable fields don't need 'required'
  String? get imageUrl =>
      throw _privateConstructorUsedError; // Default values are great for flags like this
  bool get isBookmarked => throw _privateConstructorUsedError;
  bool get isRegistered => throw _privateConstructorUsedError;
  bool get isDraft => throw _privateConstructorUsedError;
  String? get boardName => throw _privateConstructorUsedError;
  List<String> get guestNames => throw _privateConstructorUsedError;
  List<String> get guestRoles => throw _privateConstructorUsedError;
  List<String> get pocNames => throw _privateConstructorUsedError;
  List<String> get pocRoles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventModelCopyWith<EventModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventModelCopyWith<$Res> {
  factory $EventModelCopyWith(
          EventModel value, $Res Function(EventModel) then) =
      _$EventModelCopyWithImpl<$Res, EventModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      DateTime startTime,
      DateTime endTime,
      String venue,
      String? imageUrl,
      bool isBookmarked,
      bool isRegistered,
      bool isDraft,
      String? boardName,
      List<String> guestNames,
      List<String> guestRoles,
      List<String> pocNames,
      List<String> pocRoles});
}

/// @nodoc
class _$EventModelCopyWithImpl<$Res, $Val extends EventModel>
    implements $EventModelCopyWith<$Res> {
  _$EventModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? venue = null,
    Object? imageUrl = freezed,
    Object? isBookmarked = null,
    Object? isRegistered = null,
    Object? isDraft = null,
    Object? boardName = freezed,
    Object? guestNames = null,
    Object? guestRoles = null,
    Object? pocNames = null,
    Object? pocRoles = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      venue: null == venue
          ? _value.venue
          : venue // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isBookmarked: null == isBookmarked
          ? _value.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as bool,
      isRegistered: null == isRegistered
          ? _value.isRegistered
          : isRegistered // ignore: cast_nullable_to_non_nullable
              as bool,
      isDraft: null == isDraft
          ? _value.isDraft
          : isDraft // ignore: cast_nullable_to_non_nullable
              as bool,
      boardName: freezed == boardName
          ? _value.boardName
          : boardName // ignore: cast_nullable_to_non_nullable
              as String?,
      guestNames: null == guestNames
          ? _value.guestNames
          : guestNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      guestRoles: null == guestRoles
          ? _value.guestRoles
          : guestRoles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pocNames: null == pocNames
          ? _value.pocNames
          : pocNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pocRoles: null == pocRoles
          ? _value.pocRoles
          : pocRoles // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventModelImplCopyWith<$Res>
    implements $EventModelCopyWith<$Res> {
  factory _$$EventModelImplCopyWith(
          _$EventModelImpl value, $Res Function(_$EventModelImpl) then) =
      __$$EventModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      DateTime startTime,
      DateTime endTime,
      String venue,
      String? imageUrl,
      bool isBookmarked,
      bool isRegistered,
      bool isDraft,
      String? boardName,
      List<String> guestNames,
      List<String> guestRoles,
      List<String> pocNames,
      List<String> pocRoles});
}

/// @nodoc
class __$$EventModelImplCopyWithImpl<$Res>
    extends _$EventModelCopyWithImpl<$Res, _$EventModelImpl>
    implements _$$EventModelImplCopyWith<$Res> {
  __$$EventModelImplCopyWithImpl(
      _$EventModelImpl _value, $Res Function(_$EventModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? venue = null,
    Object? imageUrl = freezed,
    Object? isBookmarked = null,
    Object? isRegistered = null,
    Object? isDraft = null,
    Object? boardName = freezed,
    Object? guestNames = null,
    Object? guestRoles = null,
    Object? pocNames = null,
    Object? pocRoles = null,
  }) {
    return _then(_$EventModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      venue: null == venue
          ? _value.venue
          : venue // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isBookmarked: null == isBookmarked
          ? _value.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as bool,
      isRegistered: null == isRegistered
          ? _value.isRegistered
          : isRegistered // ignore: cast_nullable_to_non_nullable
              as bool,
      isDraft: null == isDraft
          ? _value.isDraft
          : isDraft // ignore: cast_nullable_to_non_nullable
              as bool,
      boardName: freezed == boardName
          ? _value.boardName
          : boardName // ignore: cast_nullable_to_non_nullable
              as String?,
      guestNames: null == guestNames
          ? _value._guestNames
          : guestNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      guestRoles: null == guestRoles
          ? _value._guestRoles
          : guestRoles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pocNames: null == pocNames
          ? _value._pocNames
          : pocNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pocRoles: null == pocRoles
          ? _value._pocRoles
          : pocRoles // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventModelImpl implements _EventModel {
  const _$EventModelImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.startTime,
      required this.endTime,
      required this.venue,
      this.imageUrl,
      this.isBookmarked = false,
      this.isRegistered = false,
      this.isDraft = false,
      this.boardName,
      final List<String> guestNames = const [],
      final List<String> guestRoles = const [],
      final List<String> pocNames = const [],
      final List<String> pocRoles = const []})
      : _guestNames = guestNames,
        _guestRoles = guestRoles,
        _pocNames = pocNames,
        _pocRoles = pocRoles;

  factory _$EventModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final String venue;
// Nullable fields don't need 'required'
  @override
  final String? imageUrl;
// Default values are great for flags like this
  @override
  @JsonKey()
  final bool isBookmarked;
  @override
  @JsonKey()
  final bool isRegistered;
  @override
  @JsonKey()
  final bool isDraft;
  @override
  final String? boardName;
  final List<String> _guestNames;
  @override
  @JsonKey()
  List<String> get guestNames {
    if (_guestNames is EqualUnmodifiableListView) return _guestNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_guestNames);
  }

  final List<String> _guestRoles;
  @override
  @JsonKey()
  List<String> get guestRoles {
    if (_guestRoles is EqualUnmodifiableListView) return _guestRoles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_guestRoles);
  }

  final List<String> _pocNames;
  @override
  @JsonKey()
  List<String> get pocNames {
    if (_pocNames is EqualUnmodifiableListView) return _pocNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pocNames);
  }

  final List<String> _pocRoles;
  @override
  @JsonKey()
  List<String> get pocRoles {
    if (_pocRoles is EqualUnmodifiableListView) return _pocRoles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pocRoles);
  }

  @override
  String toString() {
    return 'EventModel(id: $id, title: $title, description: $description, startTime: $startTime, endTime: $endTime, venue: $venue, imageUrl: $imageUrl, isBookmarked: $isBookmarked, isRegistered: $isRegistered, isDraft: $isDraft, boardName: $boardName, guestNames: $guestNames, guestRoles: $guestRoles, pocNames: $pocNames, pocRoles: $pocRoles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.venue, venue) || other.venue == venue) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isBookmarked, isBookmarked) ||
                other.isBookmarked == isBookmarked) &&
            (identical(other.isRegistered, isRegistered) ||
                other.isRegistered == isRegistered) &&
            (identical(other.isDraft, isDraft) || other.isDraft == isDraft) &&
            (identical(other.boardName, boardName) ||
                other.boardName == boardName) &&
            const DeepCollectionEquality()
                .equals(other._guestNames, _guestNames) &&
            const DeepCollectionEquality()
                .equals(other._guestRoles, _guestRoles) &&
            const DeepCollectionEquality().equals(other._pocNames, _pocNames) &&
            const DeepCollectionEquality().equals(other._pocRoles, _pocRoles));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      startTime,
      endTime,
      venue,
      imageUrl,
      isBookmarked,
      isRegistered,
      isDraft,
      boardName,
      const DeepCollectionEquality().hash(_guestNames),
      const DeepCollectionEquality().hash(_guestRoles),
      const DeepCollectionEquality().hash(_pocNames),
      const DeepCollectionEquality().hash(_pocRoles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventModelImplCopyWith<_$EventModelImpl> get copyWith =>
      __$$EventModelImplCopyWithImpl<_$EventModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventModelImplToJson(
      this,
    );
  }
}

abstract class _EventModel implements EventModel {
  const factory _EventModel(
      {required final String id,
      required final String title,
      required final String description,
      required final DateTime startTime,
      required final DateTime endTime,
      required final String venue,
      final String? imageUrl,
      final bool isBookmarked,
      final bool isRegistered,
      final bool isDraft,
      final String? boardName,
      final List<String> guestNames,
      final List<String> guestRoles,
      final List<String> pocNames,
      final List<String> pocRoles}) = _$EventModelImpl;

  factory _EventModel.fromJson(Map<String, dynamic> json) =
      _$EventModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  String get venue;
  @override // Nullable fields don't need 'required'
  String? get imageUrl;
  @override // Default values are great for flags like this
  bool get isBookmarked;
  @override
  bool get isRegistered;
  @override
  bool get isDraft;
  @override
  String? get boardName;
  @override
  List<String> get guestNames;
  @override
  List<String> get guestRoles;
  @override
  List<String> get pocNames;
  @override
  List<String> get pocRoles;
  @override
  @JsonKey(ignore: true)
  _$$EventModelImplCopyWith<_$EventModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
