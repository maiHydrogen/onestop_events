// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AdminEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? title,
            String? description,
            DateTime? startTime,
            DateTime? endTime,
            String? venue,
            String? imageUrl)
        updateForm,
    required TResult Function() submitEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? title, String? description, DateTime? startTime,
            DateTime? endTime, String? venue, String? imageUrl)?
        updateForm,
    TResult? Function()? submitEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? title, String? description, DateTime? startTime,
            DateTime? endTime, String? venue, String? imageUrl)?
        updateForm,
    TResult Function()? submitEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateForm value) updateForm,
    required TResult Function(_SubmitEvent value) submitEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateForm value)? updateForm,
    TResult? Function(_SubmitEvent value)? submitEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateForm value)? updateForm,
    TResult Function(_SubmitEvent value)? submitEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminEventCopyWith<$Res> {
  factory $AdminEventCopyWith(
          AdminEvent value, $Res Function(AdminEvent) then) =
      _$AdminEventCopyWithImpl<$Res, AdminEvent>;
}

/// @nodoc
class _$AdminEventCopyWithImpl<$Res, $Val extends AdminEvent>
    implements $AdminEventCopyWith<$Res> {
  _$AdminEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UpdateFormImplCopyWith<$Res> {
  factory _$$UpdateFormImplCopyWith(
          _$UpdateFormImpl value, $Res Function(_$UpdateFormImpl) then) =
      __$$UpdateFormImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String? title,
      String? description,
      DateTime? startTime,
      DateTime? endTime,
      String? venue,
      String? imageUrl});
}

/// @nodoc
class __$$UpdateFormImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$UpdateFormImpl>
    implements _$$UpdateFormImplCopyWith<$Res> {
  __$$UpdateFormImplCopyWithImpl(
      _$UpdateFormImpl _value, $Res Function(_$UpdateFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? venue = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$UpdateFormImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      venue: freezed == venue
          ? _value.venue
          : venue // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UpdateFormImpl implements _UpdateForm {
  const _$UpdateFormImpl(
      {this.title,
      this.description,
      this.startTime,
      this.endTime,
      this.venue,
      this.imageUrl});

  @override
  final String? title;
  @override
  final String? description;
  @override
  final DateTime? startTime;
  @override
  final DateTime? endTime;
  @override
  final String? venue;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'AdminEvent.updateForm(title: $title, description: $description, startTime: $startTime, endTime: $endTime, venue: $venue, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateFormImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.venue, venue) || other.venue == venue) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, title, description, startTime, endTime, venue, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateFormImplCopyWith<_$UpdateFormImpl> get copyWith =>
      __$$UpdateFormImplCopyWithImpl<_$UpdateFormImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? title,
            String? description,
            DateTime? startTime,
            DateTime? endTime,
            String? venue,
            String? imageUrl)
        updateForm,
    required TResult Function() submitEvent,
  }) {
    return updateForm(title, description, startTime, endTime, venue, imageUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? title, String? description, DateTime? startTime,
            DateTime? endTime, String? venue, String? imageUrl)?
        updateForm,
    TResult? Function()? submitEvent,
  }) {
    return updateForm?.call(
        title, description, startTime, endTime, venue, imageUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? title, String? description, DateTime? startTime,
            DateTime? endTime, String? venue, String? imageUrl)?
        updateForm,
    TResult Function()? submitEvent,
    required TResult orElse(),
  }) {
    if (updateForm != null) {
      return updateForm(
          title, description, startTime, endTime, venue, imageUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateForm value) updateForm,
    required TResult Function(_SubmitEvent value) submitEvent,
  }) {
    return updateForm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateForm value)? updateForm,
    TResult? Function(_SubmitEvent value)? submitEvent,
  }) {
    return updateForm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateForm value)? updateForm,
    TResult Function(_SubmitEvent value)? submitEvent,
    required TResult orElse(),
  }) {
    if (updateForm != null) {
      return updateForm(this);
    }
    return orElse();
  }
}

abstract class _UpdateForm implements AdminEvent {
  const factory _UpdateForm(
      {final String? title,
      final String? description,
      final DateTime? startTime,
      final DateTime? endTime,
      final String? venue,
      final String? imageUrl}) = _$UpdateFormImpl;

  String? get title;
  String? get description;
  DateTime? get startTime;
  DateTime? get endTime;
  String? get venue;
  String? get imageUrl;
  @JsonKey(ignore: true)
  _$$UpdateFormImplCopyWith<_$UpdateFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmitEventImplCopyWith<$Res> {
  factory _$$SubmitEventImplCopyWith(
          _$SubmitEventImpl value, $Res Function(_$SubmitEventImpl) then) =
      __$$SubmitEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SubmitEventImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$SubmitEventImpl>
    implements _$$SubmitEventImplCopyWith<$Res> {
  __$$SubmitEventImplCopyWithImpl(
      _$SubmitEventImpl _value, $Res Function(_$SubmitEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SubmitEventImpl implements _SubmitEvent {
  const _$SubmitEventImpl();

  @override
  String toString() {
    return 'AdminEvent.submitEvent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SubmitEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? title,
            String? description,
            DateTime? startTime,
            DateTime? endTime,
            String? venue,
            String? imageUrl)
        updateForm,
    required TResult Function() submitEvent,
  }) {
    return submitEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? title, String? description, DateTime? startTime,
            DateTime? endTime, String? venue, String? imageUrl)?
        updateForm,
    TResult? Function()? submitEvent,
  }) {
    return submitEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? title, String? description, DateTime? startTime,
            DateTime? endTime, String? venue, String? imageUrl)?
        updateForm,
    TResult Function()? submitEvent,
    required TResult orElse(),
  }) {
    if (submitEvent != null) {
      return submitEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateForm value) updateForm,
    required TResult Function(_SubmitEvent value) submitEvent,
  }) {
    return submitEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateForm value)? updateForm,
    TResult? Function(_SubmitEvent value)? submitEvent,
  }) {
    return submitEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateForm value)? updateForm,
    TResult Function(_SubmitEvent value)? submitEvent,
    required TResult orElse(),
  }) {
    if (submitEvent != null) {
      return submitEvent(this);
    }
    return orElse();
  }
}

abstract class _SubmitEvent implements AdminEvent {
  const factory _SubmitEvent() = _$SubmitEventImpl;
}

/// @nodoc
mixin _$AdminState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String title,
            String description,
            DateTime? startTime,
            DateTime? endTime,
            String venue,
            String? imageUrl)
        idle,
    required TResult Function() validating,
    required TResult Function() success,
    required TResult Function(String error) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title, String description, DateTime? startTime,
            DateTime? endTime, String venue, String? imageUrl)?
        idle,
    TResult? Function()? validating,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, String description, DateTime? startTime,
            DateTime? endTime, String venue, String? imageUrl)?
        idle,
    TResult Function()? validating,
    TResult Function()? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Validating value) validating,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Validating value)? validating,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Validating value)? validating,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminStateCopyWith<$Res> {
  factory $AdminStateCopyWith(
          AdminState value, $Res Function(AdminState) then) =
      _$AdminStateCopyWithImpl<$Res, AdminState>;
}

/// @nodoc
class _$AdminStateCopyWithImpl<$Res, $Val extends AdminState>
    implements $AdminStateCopyWith<$Res> {
  _$AdminStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$IdleImplCopyWith<$Res> {
  factory _$$IdleImplCopyWith(
          _$IdleImpl value, $Res Function(_$IdleImpl) then) =
      __$$IdleImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String title,
      String description,
      DateTime? startTime,
      DateTime? endTime,
      String venue,
      String? imageUrl});
}

/// @nodoc
class __$$IdleImplCopyWithImpl<$Res>
    extends _$AdminStateCopyWithImpl<$Res, _$IdleImpl>
    implements _$$IdleImplCopyWith<$Res> {
  __$$IdleImplCopyWithImpl(_$IdleImpl _value, $Res Function(_$IdleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? venue = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_$IdleImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      venue: null == venue
          ? _value.venue
          : venue // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$IdleImpl implements _Idle {
  const _$IdleImpl(
      {this.title = '',
      this.description = '',
      this.startTime,
      this.endTime,
      this.venue = '',
      this.imageUrl});

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  final DateTime? startTime;
  @override
  final DateTime? endTime;
  @override
  @JsonKey()
  final String venue;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'AdminState.idle(title: $title, description: $description, startTime: $startTime, endTime: $endTime, venue: $venue, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdleImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.venue, venue) || other.venue == venue) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, title, description, startTime, endTime, venue, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IdleImplCopyWith<_$IdleImpl> get copyWith =>
      __$$IdleImplCopyWithImpl<_$IdleImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String title,
            String description,
            DateTime? startTime,
            DateTime? endTime,
            String venue,
            String? imageUrl)
        idle,
    required TResult Function() validating,
    required TResult Function() success,
    required TResult Function(String error) failure,
  }) {
    return idle(title, description, startTime, endTime, venue, imageUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title, String description, DateTime? startTime,
            DateTime? endTime, String venue, String? imageUrl)?
        idle,
    TResult? Function()? validating,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
  }) {
    return idle?.call(title, description, startTime, endTime, venue, imageUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, String description, DateTime? startTime,
            DateTime? endTime, String venue, String? imageUrl)?
        idle,
    TResult Function()? validating,
    TResult Function()? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(title, description, startTime, endTime, venue, imageUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Validating value) validating,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Validating value)? validating,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Validating value)? validating,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _Idle implements AdminState {
  const factory _Idle(
      {final String title,
      final String description,
      final DateTime? startTime,
      final DateTime? endTime,
      final String venue,
      final String? imageUrl}) = _$IdleImpl;

  String get title;
  String get description;
  DateTime? get startTime;
  DateTime? get endTime;
  String get venue;
  String? get imageUrl;
  @JsonKey(ignore: true)
  _$$IdleImplCopyWith<_$IdleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValidatingImplCopyWith<$Res> {
  factory _$$ValidatingImplCopyWith(
          _$ValidatingImpl value, $Res Function(_$ValidatingImpl) then) =
      __$$ValidatingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ValidatingImplCopyWithImpl<$Res>
    extends _$AdminStateCopyWithImpl<$Res, _$ValidatingImpl>
    implements _$$ValidatingImplCopyWith<$Res> {
  __$$ValidatingImplCopyWithImpl(
      _$ValidatingImpl _value, $Res Function(_$ValidatingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ValidatingImpl implements _Validating {
  const _$ValidatingImpl();

  @override
  String toString() {
    return 'AdminState.validating()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ValidatingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String title,
            String description,
            DateTime? startTime,
            DateTime? endTime,
            String venue,
            String? imageUrl)
        idle,
    required TResult Function() validating,
    required TResult Function() success,
    required TResult Function(String error) failure,
  }) {
    return validating();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title, String description, DateTime? startTime,
            DateTime? endTime, String venue, String? imageUrl)?
        idle,
    TResult? Function()? validating,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
  }) {
    return validating?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, String description, DateTime? startTime,
            DateTime? endTime, String venue, String? imageUrl)?
        idle,
    TResult Function()? validating,
    TResult Function()? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (validating != null) {
      return validating();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Validating value) validating,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return validating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Validating value)? validating,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return validating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Validating value)? validating,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (validating != null) {
      return validating(this);
    }
    return orElse();
  }
}

abstract class _Validating implements AdminState {
  const factory _Validating() = _$ValidatingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$AdminStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl();

  @override
  String toString() {
    return 'AdminState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String title,
            String description,
            DateTime? startTime,
            DateTime? endTime,
            String venue,
            String? imageUrl)
        idle,
    required TResult Function() validating,
    required TResult Function() success,
    required TResult Function(String error) failure,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title, String description, DateTime? startTime,
            DateTime? endTime, String venue, String? imageUrl)?
        idle,
    TResult? Function()? validating,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, String description, DateTime? startTime,
            DateTime? endTime, String venue, String? imageUrl)?
        idle,
    TResult Function()? validating,
    TResult Function()? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Validating value) validating,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Validating value)? validating,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Validating value)? validating,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements AdminState {
  const factory _Success() = _$SuccessImpl;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$AdminStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$FailureImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'AdminState.failure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String title,
            String description,
            DateTime? startTime,
            DateTime? endTime,
            String venue,
            String? imageUrl)
        idle,
    required TResult Function() validating,
    required TResult Function() success,
    required TResult Function(String error) failure,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title, String description, DateTime? startTime,
            DateTime? endTime, String venue, String? imageUrl)?
        idle,
    TResult? Function()? validating,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
  }) {
    return failure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, String description, DateTime? startTime,
            DateTime? endTime, String venue, String? imageUrl)?
        idle,
    TResult Function()? validating,
    TResult Function()? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Validating value) validating,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Validating value)? validating,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Validating value)? validating,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements AdminState {
  const factory _Failure(final String error) = _$FailureImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
