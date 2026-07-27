part of 'events_bloc.dart';

@freezed
class EventsState with _$EventsState {
  const factory EventsState.initial() = _Initial;
  const factory EventsState.loading() = _Loading;
  const factory EventsState.loaded({
    required List<EventModel> events,
    required int currentPage,
    @Default(false) bool hasReachedMax,
    @Default(false) bool isLoadingMore,
    // Transient error field for snackbar signals (null = no error)
    String? loadMoreError,
  }) = _Loaded;
  const factory EventsState.error(String message) = _Error;
}