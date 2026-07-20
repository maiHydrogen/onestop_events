// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'events_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EventsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<EventModel> events, int currentPage,
            bool hasReachedMax, bool isLoadingMore, String? loadMoreError)
        loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<EventModel> events, int currentPage,
            bool hasReachedMax, bool isLoadingMore, String? loadMoreError)?
        loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<EventModel> events, int currentPage,
            bool hasReachedMax, bool isLoadingMore, String? loadMoreError)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventsStateCopyWith<$Res> {
  factory $EventsStateCopyWith(
          EventsState value, $Res Function(EventsState) then) =
      _$EventsStateCopyWithImpl<$Res, EventsState>;
}

/// @nodoc
class _$EventsStateCopyWithImpl<$Res, $Val extends EventsState>
    implements $EventsStateCopyWith<$Res> {
  _$EventsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$EventsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'EventsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<EventModel> events, int currentPage,
            bool hasReachedMax, bool isLoadingMore, String? loadMoreError)
        loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<EventModel> events, int currentPage,
            bool hasReachedMax, bool isLoadingMore, String? loadMoreError)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<EventModel> events, int currentPage,
            bool hasReachedMax, bool isLoadingMore, String? loadMoreError)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements EventsState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$EventsStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'EventsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<EventModel> events, int currentPage,
            bool hasReachedMax, bool isLoadingMore, String? loadMoreError)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<EventModel> events, int currentPage,
            bool hasReachedMax, bool isLoadingMore, String? loadMoreError)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<EventModel> events, int currentPage,
            bool hasReachedMax, bool isLoadingMore, String? loadMoreError)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements EventsState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<EventModel> events,
      int currentPage,
      bool hasReachedMax,
      bool isLoadingMore,
      String? loadMoreError});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$EventsStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
    Object? currentPage = null,
    Object? hasReachedMax = null,
    Object? isLoadingMore = null,
    Object? loadMoreError = freezed,
  }) {
    return _then(_$LoadedImpl(
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventModel>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      loadMoreError: freezed == loadMoreError
          ? _value.loadMoreError
          : loadMoreError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(
      {required final List<EventModel> events,
      required this.currentPage,
      this.hasReachedMax = false,
      this.isLoadingMore = false,
      this.loadMoreError})
      : _events = events;

  final List<EventModel> _events;
  @override
  List<EventModel> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  final int currentPage;
  @override
  @JsonKey()
  final bool hasReachedMax;
  @override
  @JsonKey()
  final bool isLoadingMore;
// Transient error field for snackbar signals (null = no error)
  @override
  final String? loadMoreError;

  @override
  String toString() {
    return 'EventsState.loaded(events: $events, currentPage: $currentPage, hasReachedMax: $hasReachedMax, isLoadingMore: $isLoadingMore, loadMoreError: $loadMoreError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.loadMoreError, loadMoreError) ||
                other.loadMoreError == loadMoreError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_events),
      currentPage,
      hasReachedMax,
      isLoadingMore,
      loadMoreError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<EventModel> events, int currentPage,
            bool hasReachedMax, bool isLoadingMore, String? loadMoreError)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(
        events, currentPage, hasReachedMax, isLoadingMore, loadMoreError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<EventModel> events, int currentPage,
            bool hasReachedMax, bool isLoadingMore, String? loadMoreError)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(
        events, currentPage, hasReachedMax, isLoadingMore, loadMoreError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<EventModel> events, int currentPage,
            bool hasReachedMax, bool isLoadingMore, String? loadMoreError)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(
          events, currentPage, hasReachedMax, isLoadingMore, loadMoreError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements EventsState {
  const factory _Loaded(
      {required final List<EventModel> events,
      required final int currentPage,
      final bool hasReachedMax,
      final bool isLoadingMore,
      final String? loadMoreError}) = _$LoadedImpl;

  List<EventModel> get events;
  int get currentPage;
  bool get hasReachedMax;
  bool
      get isLoadingMore; // Transient error field for snackbar signals (null = no error)
  String? get loadMoreError;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$EventsStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'EventsState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<EventModel> events, int currentPage,
            bool hasReachedMax, bool isLoadingMore, String? loadMoreError)
        loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<EventModel> events, int currentPage,
            bool hasReachedMax, bool isLoadingMore, String? loadMoreError)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<EventModel> events, int currentPage,
            bool hasReachedMax, bool isLoadingMore, String? loadMoreError)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements EventsState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EventsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchEvents,
    required TResult Function() loadMoreEvents,
    required TResult Function(String eventId) toggleBookmark,
    required TResult Function(String eventId) toggleRegister,
    required TResult Function(String eventId) markAsDraft,
    required TResult Function(String eventId) publishDraft,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchEvents,
    TResult? Function()? loadMoreEvents,
    TResult? Function(String eventId)? toggleBookmark,
    TResult? Function(String eventId)? toggleRegister,
    TResult? Function(String eventId)? markAsDraft,
    TResult? Function(String eventId)? publishDraft,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchEvents,
    TResult Function()? loadMoreEvents,
    TResult Function(String eventId)? toggleBookmark,
    TResult Function(String eventId)? toggleRegister,
    TResult Function(String eventId)? markAsDraft,
    TResult Function(String eventId)? publishDraft,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchEvents value) fetchEvents,
    required TResult Function(_LoadMoreEvents value) loadMoreEvents,
    required TResult Function(_ToggleBookmark value) toggleBookmark,
    required TResult Function(_ToggleRegister value) toggleRegister,
    required TResult Function(_MarkAsDraft value) markAsDraft,
    required TResult Function(_PublishDraft value) publishDraft,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchEvents value)? fetchEvents,
    TResult? Function(_LoadMoreEvents value)? loadMoreEvents,
    TResult? Function(_ToggleBookmark value)? toggleBookmark,
    TResult? Function(_ToggleRegister value)? toggleRegister,
    TResult? Function(_MarkAsDraft value)? markAsDraft,
    TResult? Function(_PublishDraft value)? publishDraft,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchEvents value)? fetchEvents,
    TResult Function(_LoadMoreEvents value)? loadMoreEvents,
    TResult Function(_ToggleBookmark value)? toggleBookmark,
    TResult Function(_ToggleRegister value)? toggleRegister,
    TResult Function(_MarkAsDraft value)? markAsDraft,
    TResult Function(_PublishDraft value)? publishDraft,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventsEventCopyWith<$Res> {
  factory $EventsEventCopyWith(
          EventsEvent value, $Res Function(EventsEvent) then) =
      _$EventsEventCopyWithImpl<$Res, EventsEvent>;
}

/// @nodoc
class _$EventsEventCopyWithImpl<$Res, $Val extends EventsEvent>
    implements $EventsEventCopyWith<$Res> {
  _$EventsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchEventsImplCopyWith<$Res> {
  factory _$$FetchEventsImplCopyWith(
          _$FetchEventsImpl value, $Res Function(_$FetchEventsImpl) then) =
      __$$FetchEventsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchEventsImplCopyWithImpl<$Res>
    extends _$EventsEventCopyWithImpl<$Res, _$FetchEventsImpl>
    implements _$$FetchEventsImplCopyWith<$Res> {
  __$$FetchEventsImplCopyWithImpl(
      _$FetchEventsImpl _value, $Res Function(_$FetchEventsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchEventsImpl implements _FetchEvents {
  const _$FetchEventsImpl();

  @override
  String toString() {
    return 'EventsEvent.fetchEvents()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchEventsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchEvents,
    required TResult Function() loadMoreEvents,
    required TResult Function(String eventId) toggleBookmark,
    required TResult Function(String eventId) toggleRegister,
    required TResult Function(String eventId) markAsDraft,
    required TResult Function(String eventId) publishDraft,
  }) {
    return fetchEvents();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchEvents,
    TResult? Function()? loadMoreEvents,
    TResult? Function(String eventId)? toggleBookmark,
    TResult? Function(String eventId)? toggleRegister,
    TResult? Function(String eventId)? markAsDraft,
    TResult? Function(String eventId)? publishDraft,
  }) {
    return fetchEvents?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchEvents,
    TResult Function()? loadMoreEvents,
    TResult Function(String eventId)? toggleBookmark,
    TResult Function(String eventId)? toggleRegister,
    TResult Function(String eventId)? markAsDraft,
    TResult Function(String eventId)? publishDraft,
    required TResult orElse(),
  }) {
    if (fetchEvents != null) {
      return fetchEvents();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchEvents value) fetchEvents,
    required TResult Function(_LoadMoreEvents value) loadMoreEvents,
    required TResult Function(_ToggleBookmark value) toggleBookmark,
    required TResult Function(_ToggleRegister value) toggleRegister,
    required TResult Function(_MarkAsDraft value) markAsDraft,
    required TResult Function(_PublishDraft value) publishDraft,
  }) {
    return fetchEvents(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchEvents value)? fetchEvents,
    TResult? Function(_LoadMoreEvents value)? loadMoreEvents,
    TResult? Function(_ToggleBookmark value)? toggleBookmark,
    TResult? Function(_ToggleRegister value)? toggleRegister,
    TResult? Function(_MarkAsDraft value)? markAsDraft,
    TResult? Function(_PublishDraft value)? publishDraft,
  }) {
    return fetchEvents?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchEvents value)? fetchEvents,
    TResult Function(_LoadMoreEvents value)? loadMoreEvents,
    TResult Function(_ToggleBookmark value)? toggleBookmark,
    TResult Function(_ToggleRegister value)? toggleRegister,
    TResult Function(_MarkAsDraft value)? markAsDraft,
    TResult Function(_PublishDraft value)? publishDraft,
    required TResult orElse(),
  }) {
    if (fetchEvents != null) {
      return fetchEvents(this);
    }
    return orElse();
  }
}

abstract class _FetchEvents implements EventsEvent {
  const factory _FetchEvents() = _$FetchEventsImpl;
}

/// @nodoc
abstract class _$$LoadMoreEventsImplCopyWith<$Res> {
  factory _$$LoadMoreEventsImplCopyWith(_$LoadMoreEventsImpl value,
          $Res Function(_$LoadMoreEventsImpl) then) =
      __$$LoadMoreEventsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadMoreEventsImplCopyWithImpl<$Res>
    extends _$EventsEventCopyWithImpl<$Res, _$LoadMoreEventsImpl>
    implements _$$LoadMoreEventsImplCopyWith<$Res> {
  __$$LoadMoreEventsImplCopyWithImpl(
      _$LoadMoreEventsImpl _value, $Res Function(_$LoadMoreEventsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadMoreEventsImpl implements _LoadMoreEvents {
  const _$LoadMoreEventsImpl();

  @override
  String toString() {
    return 'EventsEvent.loadMoreEvents()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadMoreEventsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchEvents,
    required TResult Function() loadMoreEvents,
    required TResult Function(String eventId) toggleBookmark,
    required TResult Function(String eventId) toggleRegister,
    required TResult Function(String eventId) markAsDraft,
    required TResult Function(String eventId) publishDraft,
  }) {
    return loadMoreEvents();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchEvents,
    TResult? Function()? loadMoreEvents,
    TResult? Function(String eventId)? toggleBookmark,
    TResult? Function(String eventId)? toggleRegister,
    TResult? Function(String eventId)? markAsDraft,
    TResult? Function(String eventId)? publishDraft,
  }) {
    return loadMoreEvents?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchEvents,
    TResult Function()? loadMoreEvents,
    TResult Function(String eventId)? toggleBookmark,
    TResult Function(String eventId)? toggleRegister,
    TResult Function(String eventId)? markAsDraft,
    TResult Function(String eventId)? publishDraft,
    required TResult orElse(),
  }) {
    if (loadMoreEvents != null) {
      return loadMoreEvents();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchEvents value) fetchEvents,
    required TResult Function(_LoadMoreEvents value) loadMoreEvents,
    required TResult Function(_ToggleBookmark value) toggleBookmark,
    required TResult Function(_ToggleRegister value) toggleRegister,
    required TResult Function(_MarkAsDraft value) markAsDraft,
    required TResult Function(_PublishDraft value) publishDraft,
  }) {
    return loadMoreEvents(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchEvents value)? fetchEvents,
    TResult? Function(_LoadMoreEvents value)? loadMoreEvents,
    TResult? Function(_ToggleBookmark value)? toggleBookmark,
    TResult? Function(_ToggleRegister value)? toggleRegister,
    TResult? Function(_MarkAsDraft value)? markAsDraft,
    TResult? Function(_PublishDraft value)? publishDraft,
  }) {
    return loadMoreEvents?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchEvents value)? fetchEvents,
    TResult Function(_LoadMoreEvents value)? loadMoreEvents,
    TResult Function(_ToggleBookmark value)? toggleBookmark,
    TResult Function(_ToggleRegister value)? toggleRegister,
    TResult Function(_MarkAsDraft value)? markAsDraft,
    TResult Function(_PublishDraft value)? publishDraft,
    required TResult orElse(),
  }) {
    if (loadMoreEvents != null) {
      return loadMoreEvents(this);
    }
    return orElse();
  }
}

abstract class _LoadMoreEvents implements EventsEvent {
  const factory _LoadMoreEvents() = _$LoadMoreEventsImpl;
}

/// @nodoc
abstract class _$$ToggleBookmarkImplCopyWith<$Res> {
  factory _$$ToggleBookmarkImplCopyWith(_$ToggleBookmarkImpl value,
          $Res Function(_$ToggleBookmarkImpl) then) =
      __$$ToggleBookmarkImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String eventId});
}

/// @nodoc
class __$$ToggleBookmarkImplCopyWithImpl<$Res>
    extends _$EventsEventCopyWithImpl<$Res, _$ToggleBookmarkImpl>
    implements _$$ToggleBookmarkImplCopyWith<$Res> {
  __$$ToggleBookmarkImplCopyWithImpl(
      _$ToggleBookmarkImpl _value, $Res Function(_$ToggleBookmarkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
  }) {
    return _then(_$ToggleBookmarkImpl(
      null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ToggleBookmarkImpl implements _ToggleBookmark {
  const _$ToggleBookmarkImpl(this.eventId);

  @override
  final String eventId;

  @override
  String toString() {
    return 'EventsEvent.toggleBookmark(eventId: $eventId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleBookmarkImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, eventId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleBookmarkImplCopyWith<_$ToggleBookmarkImpl> get copyWith =>
      __$$ToggleBookmarkImplCopyWithImpl<_$ToggleBookmarkImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchEvents,
    required TResult Function() loadMoreEvents,
    required TResult Function(String eventId) toggleBookmark,
    required TResult Function(String eventId) toggleRegister,
    required TResult Function(String eventId) markAsDraft,
    required TResult Function(String eventId) publishDraft,
  }) {
    return toggleBookmark(eventId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchEvents,
    TResult? Function()? loadMoreEvents,
    TResult? Function(String eventId)? toggleBookmark,
    TResult? Function(String eventId)? toggleRegister,
    TResult? Function(String eventId)? markAsDraft,
    TResult? Function(String eventId)? publishDraft,
  }) {
    return toggleBookmark?.call(eventId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchEvents,
    TResult Function()? loadMoreEvents,
    TResult Function(String eventId)? toggleBookmark,
    TResult Function(String eventId)? toggleRegister,
    TResult Function(String eventId)? markAsDraft,
    TResult Function(String eventId)? publishDraft,
    required TResult orElse(),
  }) {
    if (toggleBookmark != null) {
      return toggleBookmark(eventId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchEvents value) fetchEvents,
    required TResult Function(_LoadMoreEvents value) loadMoreEvents,
    required TResult Function(_ToggleBookmark value) toggleBookmark,
    required TResult Function(_ToggleRegister value) toggleRegister,
    required TResult Function(_MarkAsDraft value) markAsDraft,
    required TResult Function(_PublishDraft value) publishDraft,
  }) {
    return toggleBookmark(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchEvents value)? fetchEvents,
    TResult? Function(_LoadMoreEvents value)? loadMoreEvents,
    TResult? Function(_ToggleBookmark value)? toggleBookmark,
    TResult? Function(_ToggleRegister value)? toggleRegister,
    TResult? Function(_MarkAsDraft value)? markAsDraft,
    TResult? Function(_PublishDraft value)? publishDraft,
  }) {
    return toggleBookmark?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchEvents value)? fetchEvents,
    TResult Function(_LoadMoreEvents value)? loadMoreEvents,
    TResult Function(_ToggleBookmark value)? toggleBookmark,
    TResult Function(_ToggleRegister value)? toggleRegister,
    TResult Function(_MarkAsDraft value)? markAsDraft,
    TResult Function(_PublishDraft value)? publishDraft,
    required TResult orElse(),
  }) {
    if (toggleBookmark != null) {
      return toggleBookmark(this);
    }
    return orElse();
  }
}

abstract class _ToggleBookmark implements EventsEvent {
  const factory _ToggleBookmark(final String eventId) = _$ToggleBookmarkImpl;

  String get eventId;
  @JsonKey(ignore: true)
  _$$ToggleBookmarkImplCopyWith<_$ToggleBookmarkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleRegisterImplCopyWith<$Res> {
  factory _$$ToggleRegisterImplCopyWith(_$ToggleRegisterImpl value,
          $Res Function(_$ToggleRegisterImpl) then) =
      __$$ToggleRegisterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String eventId});
}

/// @nodoc
class __$$ToggleRegisterImplCopyWithImpl<$Res>
    extends _$EventsEventCopyWithImpl<$Res, _$ToggleRegisterImpl>
    implements _$$ToggleRegisterImplCopyWith<$Res> {
  __$$ToggleRegisterImplCopyWithImpl(
      _$ToggleRegisterImpl _value, $Res Function(_$ToggleRegisterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
  }) {
    return _then(_$ToggleRegisterImpl(
      null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ToggleRegisterImpl implements _ToggleRegister {
  const _$ToggleRegisterImpl(this.eventId);

  @override
  final String eventId;

  @override
  String toString() {
    return 'EventsEvent.toggleRegister(eventId: $eventId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleRegisterImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, eventId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleRegisterImplCopyWith<_$ToggleRegisterImpl> get copyWith =>
      __$$ToggleRegisterImplCopyWithImpl<_$ToggleRegisterImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchEvents,
    required TResult Function() loadMoreEvents,
    required TResult Function(String eventId) toggleBookmark,
    required TResult Function(String eventId) toggleRegister,
    required TResult Function(String eventId) markAsDraft,
    required TResult Function(String eventId) publishDraft,
  }) {
    return toggleRegister(eventId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchEvents,
    TResult? Function()? loadMoreEvents,
    TResult? Function(String eventId)? toggleBookmark,
    TResult? Function(String eventId)? toggleRegister,
    TResult? Function(String eventId)? markAsDraft,
    TResult? Function(String eventId)? publishDraft,
  }) {
    return toggleRegister?.call(eventId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchEvents,
    TResult Function()? loadMoreEvents,
    TResult Function(String eventId)? toggleBookmark,
    TResult Function(String eventId)? toggleRegister,
    TResult Function(String eventId)? markAsDraft,
    TResult Function(String eventId)? publishDraft,
    required TResult orElse(),
  }) {
    if (toggleRegister != null) {
      return toggleRegister(eventId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchEvents value) fetchEvents,
    required TResult Function(_LoadMoreEvents value) loadMoreEvents,
    required TResult Function(_ToggleBookmark value) toggleBookmark,
    required TResult Function(_ToggleRegister value) toggleRegister,
    required TResult Function(_MarkAsDraft value) markAsDraft,
    required TResult Function(_PublishDraft value) publishDraft,
  }) {
    return toggleRegister(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchEvents value)? fetchEvents,
    TResult? Function(_LoadMoreEvents value)? loadMoreEvents,
    TResult? Function(_ToggleBookmark value)? toggleBookmark,
    TResult? Function(_ToggleRegister value)? toggleRegister,
    TResult? Function(_MarkAsDraft value)? markAsDraft,
    TResult? Function(_PublishDraft value)? publishDraft,
  }) {
    return toggleRegister?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchEvents value)? fetchEvents,
    TResult Function(_LoadMoreEvents value)? loadMoreEvents,
    TResult Function(_ToggleBookmark value)? toggleBookmark,
    TResult Function(_ToggleRegister value)? toggleRegister,
    TResult Function(_MarkAsDraft value)? markAsDraft,
    TResult Function(_PublishDraft value)? publishDraft,
    required TResult orElse(),
  }) {
    if (toggleRegister != null) {
      return toggleRegister(this);
    }
    return orElse();
  }
}

abstract class _ToggleRegister implements EventsEvent {
  const factory _ToggleRegister(final String eventId) = _$ToggleRegisterImpl;

  String get eventId;
  @JsonKey(ignore: true)
  _$$ToggleRegisterImplCopyWith<_$ToggleRegisterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MarkAsDraftImplCopyWith<$Res> {
  factory _$$MarkAsDraftImplCopyWith(
          _$MarkAsDraftImpl value, $Res Function(_$MarkAsDraftImpl) then) =
      __$$MarkAsDraftImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String eventId});
}

/// @nodoc
class __$$MarkAsDraftImplCopyWithImpl<$Res>
    extends _$EventsEventCopyWithImpl<$Res, _$MarkAsDraftImpl>
    implements _$$MarkAsDraftImplCopyWith<$Res> {
  __$$MarkAsDraftImplCopyWithImpl(
      _$MarkAsDraftImpl _value, $Res Function(_$MarkAsDraftImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
  }) {
    return _then(_$MarkAsDraftImpl(
      null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MarkAsDraftImpl implements _MarkAsDraft {
  const _$MarkAsDraftImpl(this.eventId);

  @override
  final String eventId;

  @override
  String toString() {
    return 'EventsEvent.markAsDraft(eventId: $eventId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkAsDraftImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, eventId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkAsDraftImplCopyWith<_$MarkAsDraftImpl> get copyWith =>
      __$$MarkAsDraftImplCopyWithImpl<_$MarkAsDraftImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchEvents,
    required TResult Function() loadMoreEvents,
    required TResult Function(String eventId) toggleBookmark,
    required TResult Function(String eventId) toggleRegister,
    required TResult Function(String eventId) markAsDraft,
    required TResult Function(String eventId) publishDraft,
  }) {
    return markAsDraft(eventId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchEvents,
    TResult? Function()? loadMoreEvents,
    TResult? Function(String eventId)? toggleBookmark,
    TResult? Function(String eventId)? toggleRegister,
    TResult? Function(String eventId)? markAsDraft,
    TResult? Function(String eventId)? publishDraft,
  }) {
    return markAsDraft?.call(eventId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchEvents,
    TResult Function()? loadMoreEvents,
    TResult Function(String eventId)? toggleBookmark,
    TResult Function(String eventId)? toggleRegister,
    TResult Function(String eventId)? markAsDraft,
    TResult Function(String eventId)? publishDraft,
    required TResult orElse(),
  }) {
    if (markAsDraft != null) {
      return markAsDraft(eventId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchEvents value) fetchEvents,
    required TResult Function(_LoadMoreEvents value) loadMoreEvents,
    required TResult Function(_ToggleBookmark value) toggleBookmark,
    required TResult Function(_ToggleRegister value) toggleRegister,
    required TResult Function(_MarkAsDraft value) markAsDraft,
    required TResult Function(_PublishDraft value) publishDraft,
  }) {
    return markAsDraft(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchEvents value)? fetchEvents,
    TResult? Function(_LoadMoreEvents value)? loadMoreEvents,
    TResult? Function(_ToggleBookmark value)? toggleBookmark,
    TResult? Function(_ToggleRegister value)? toggleRegister,
    TResult? Function(_MarkAsDraft value)? markAsDraft,
    TResult? Function(_PublishDraft value)? publishDraft,
  }) {
    return markAsDraft?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchEvents value)? fetchEvents,
    TResult Function(_LoadMoreEvents value)? loadMoreEvents,
    TResult Function(_ToggleBookmark value)? toggleBookmark,
    TResult Function(_ToggleRegister value)? toggleRegister,
    TResult Function(_MarkAsDraft value)? markAsDraft,
    TResult Function(_PublishDraft value)? publishDraft,
    required TResult orElse(),
  }) {
    if (markAsDraft != null) {
      return markAsDraft(this);
    }
    return orElse();
  }
}

abstract class _MarkAsDraft implements EventsEvent {
  const factory _MarkAsDraft(final String eventId) = _$MarkAsDraftImpl;

  String get eventId;
  @JsonKey(ignore: true)
  _$$MarkAsDraftImplCopyWith<_$MarkAsDraftImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PublishDraftImplCopyWith<$Res> {
  factory _$$PublishDraftImplCopyWith(
          _$PublishDraftImpl value, $Res Function(_$PublishDraftImpl) then) =
      __$$PublishDraftImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String eventId});
}

/// @nodoc
class __$$PublishDraftImplCopyWithImpl<$Res>
    extends _$EventsEventCopyWithImpl<$Res, _$PublishDraftImpl>
    implements _$$PublishDraftImplCopyWith<$Res> {
  __$$PublishDraftImplCopyWithImpl(
      _$PublishDraftImpl _value, $Res Function(_$PublishDraftImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
  }) {
    return _then(_$PublishDraftImpl(
      null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PublishDraftImpl implements _PublishDraft {
  const _$PublishDraftImpl(this.eventId);

  @override
  final String eventId;

  @override
  String toString() {
    return 'EventsEvent.publishDraft(eventId: $eventId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PublishDraftImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, eventId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PublishDraftImplCopyWith<_$PublishDraftImpl> get copyWith =>
      __$$PublishDraftImplCopyWithImpl<_$PublishDraftImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchEvents,
    required TResult Function() loadMoreEvents,
    required TResult Function(String eventId) toggleBookmark,
    required TResult Function(String eventId) toggleRegister,
    required TResult Function(String eventId) markAsDraft,
    required TResult Function(String eventId) publishDraft,
  }) {
    return publishDraft(eventId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchEvents,
    TResult? Function()? loadMoreEvents,
    TResult? Function(String eventId)? toggleBookmark,
    TResult? Function(String eventId)? toggleRegister,
    TResult? Function(String eventId)? markAsDraft,
    TResult? Function(String eventId)? publishDraft,
  }) {
    return publishDraft?.call(eventId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchEvents,
    TResult Function()? loadMoreEvents,
    TResult Function(String eventId)? toggleBookmark,
    TResult Function(String eventId)? toggleRegister,
    TResult Function(String eventId)? markAsDraft,
    TResult Function(String eventId)? publishDraft,
    required TResult orElse(),
  }) {
    if (publishDraft != null) {
      return publishDraft(eventId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchEvents value) fetchEvents,
    required TResult Function(_LoadMoreEvents value) loadMoreEvents,
    required TResult Function(_ToggleBookmark value) toggleBookmark,
    required TResult Function(_ToggleRegister value) toggleRegister,
    required TResult Function(_MarkAsDraft value) markAsDraft,
    required TResult Function(_PublishDraft value) publishDraft,
  }) {
    return publishDraft(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchEvents value)? fetchEvents,
    TResult? Function(_LoadMoreEvents value)? loadMoreEvents,
    TResult? Function(_ToggleBookmark value)? toggleBookmark,
    TResult? Function(_ToggleRegister value)? toggleRegister,
    TResult? Function(_MarkAsDraft value)? markAsDraft,
    TResult? Function(_PublishDraft value)? publishDraft,
  }) {
    return publishDraft?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchEvents value)? fetchEvents,
    TResult Function(_LoadMoreEvents value)? loadMoreEvents,
    TResult Function(_ToggleBookmark value)? toggleBookmark,
    TResult Function(_ToggleRegister value)? toggleRegister,
    TResult Function(_MarkAsDraft value)? markAsDraft,
    TResult Function(_PublishDraft value)? publishDraft,
    required TResult orElse(),
  }) {
    if (publishDraft != null) {
      return publishDraft(this);
    }
    return orElse();
  }
}

abstract class _PublishDraft implements EventsEvent {
  const factory _PublishDraft(final String eventId) = _$PublishDraftImpl;

  String get eventId;
  @JsonKey(ignore: true)
  _$$PublishDraftImplCopyWith<_$PublishDraftImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
