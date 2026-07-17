import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/event_model.dart';
import '../../../domain/repositories/i_events_repo.dart';

part 'events_state.dart';
part 'events_event.dart';
part 'events_bloc.freezed.dart'; // Required for code generation

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final IEventsRepository _repository;
  static const int _pageSize = 10;

  EventsBloc({required IEventsRepository repository})
      : _repository = repository,
        super(const EventsState.initial()) {
    on<_FetchEvents>(_onFetchEvents);
    on<_LoadMoreEvents>(_onLoadMoreEvents);
    on<_ToggleBookmark>(_onToggleBookmark);
  }

  Future<void> _onFetchEvents(
    _FetchEvents event,
    Emitter<EventsState> emit,
  ) async {
    emit(const EventsState.loading());
    try {
      final events = await _repository.getEvents(page: 1, limit: _pageSize);
      final hasReachedMax = events.length < _pageSize;
      emit(EventsState.loaded(
        events: events,
        currentPage: 1,
        hasReachedMax: hasReachedMax,
      ));
    } catch (e) {
      emit(EventsState.error('Failed to fetch events: ${e.toString()}'));
    }
  }

  Future<void> _onLoadMoreEvents(
    _LoadMoreEvents event,
    Emitter<EventsState> emit,
  ) async {
    if (state is! _Loaded) return;
    final currentState = state as _Loaded;
    if (currentState.hasReachedMax) return;

    // Emit same state but signal we are loading more
    emit(currentState.copyWith(isLoadingMore: true));
    try {
      final nextPage = currentState.currentPage + 1;
      final newEvents =
          await _repository.getEvents(page: nextPage, limit: _pageSize);
      final hasReachedMax = newEvents.length < _pageSize;
      emit(currentState.copyWith(
        events: [...currentState.events, ...newEvents],
        currentPage: nextPage,
        hasReachedMax: hasReachedMax,
        isLoadingMore: false,
      ));
    } catch (e) {
      // On error, reset isLoadingMore and emit an error message signal
      emit(currentState.copyWith(
        isLoadingMore: false,
        loadMoreError: 'Failed to load more events.',
      ));
    }
  }

  Future<void> _onToggleBookmark(
    _ToggleBookmark event,
    Emitter<EventsState> emit,
  ) async {
    if (state is! _Loaded) return;
    final currentState = state as _Loaded;

    try {
      // Optimistic UI Update
      final updatedEvents = currentState.events.map((e) {
        if (e.id == event.eventId) {
          return e.copyWith(isBookmarked: !e.isBookmarked);
        }
        return e;
      }).toList();
      emit(currentState.copyWith(events: updatedEvents, loadMoreError: null));

      // Perform the actual repository task
      await _repository.toggleBookmark(event.eventId);
    } catch (e) {
      // Revert to old state and signal error
      emit(currentState.copyWith(loadMoreError: 'Failed to update bookmark.'));
      emit(currentState.copyWith(loadMoreError: null)); // clear signal
    }
  }
}