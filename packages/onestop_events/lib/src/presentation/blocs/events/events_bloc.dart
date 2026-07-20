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
    on<_ToggleRegister>(_onToggleRegister);
    on<_MarkAsDraft>(_onMarkAsDraft);
    on<_PublishDraft>(_onPublishDraft);
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

    // Emit same state but signal we are loading more, clearing any previous error
    emit(currentState.copyWith(isLoadingMore: true, loadMoreError: null));
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
        loadMoreError: null,
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
      // Revert based on the LATEST state to avoid discarding pages loaded in the meantime
      if (state is _Loaded) {
        final latestState = state as _Loaded;
        final revertedEvents = latestState.events.map((e) {
          if (e.id == event.eventId) {
            return e.copyWith(isBookmarked: !e.isBookmarked);
          }
          return e;
        }).toList();
        emit(latestState.copyWith(
          events: revertedEvents,
          loadMoreError: 'Failed to update bookmark.',
        ));
        emit(latestState.copyWith(
          events: revertedEvents,
          loadMoreError: null,
        ));
      }
    }
  }

  Future<void> _onToggleRegister(
    _ToggleRegister event,
    Emitter<EventsState> emit,
  ) async {
    if (state is! _Loaded) return;
    final currentState = state as _Loaded;

    final updatedEvents = currentState.events.map((e) {
      if (e.id == event.eventId) {
        return e.copyWith(isRegistered: !e.isRegistered);
      }
      return e;
    }).toList();
    
    emit(currentState.copyWith(events: updatedEvents));
    // In a real app, call _repository.toggleRegister(event.eventId);
  }

  Future<void> _onMarkAsDraft(
    _MarkAsDraft event,
    Emitter<EventsState> emit,
  ) async {
    if (state is! _Loaded) return;
    final currentState = state as _Loaded;

    final updatedEvents = currentState.events.map((e) {
      if (e.id == event.eventId) {
        return e.copyWith(isDraft: true);
      }
      return e;
    }).toList();
    
    emit(currentState.copyWith(events: updatedEvents));
    // In a real app, call _repository.markAsDraft(event.eventId);
  }

  Future<void> _onPublishDraft(
    _PublishDraft event,
    Emitter<EventsState> emit,
  ) async {
    if (state is! _Loaded) return;
    final currentState = state as _Loaded;

    final updatedEvents = currentState.events.map((e) {
      if (e.id == event.eventId) {
        return e.copyWith(isDraft: false);
      }
      return e;
    }).toList();
    
    emit(currentState.copyWith(events: updatedEvents));
    // In a real app, call _repository.publishDraft(event.eventId);
  }
}