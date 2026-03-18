import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/event_model.dart';
import '../../../domain/repositories/i_events_repo.dart';

part 'events_state.dart';
part 'events_event.dart';
part 'events_bloc.freezed.dart'; // Required for code generation

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final IEventsRepository _repository;

  EventsBloc({required IEventsRepository repository})
      : _repository = repository,
        super(const EventsState.initial()) {

    // Register the event handlers
    on<_FetchEvents>(_onFetchEvents);
    on<_ToggleBookmark>(_onToggleBookmark);
  }

  Future<void> _onFetchEvents(
      _FetchEvents event,
      Emitter<EventsState> emit,
      ) async {
    emit(const EventsState.loading());
    try {
      final events = await _repository.getEvents();
      emit(EventsState.loaded(events));
    } catch (e) {
      emit(EventsState.error('Failed to fetch events: ${e.toString()}'));
    }
  }

  Future<void> _onToggleBookmark(
      _ToggleBookmark event,
      Emitter<EventsState> emit,
      ) async {
    // We only want to process bookmarks if the events are currently loaded
    if (state is _Loaded) {
      final currentState = state as _Loaded;

      try {
        // 1. Optimistic UI Update:
        // We instantly update the state so the user sees the bookmark toggle immediately,
        // making the app feel incredibly fast.
        final updatedEvents = currentState.events.map((e) {
          if (e.id == event.eventId) {
            return e.copyWith(isBookmarked: !e.isBookmarked);
          }
          return e;
        }).toList();

        emit(EventsState.loaded(updatedEvents));

        // 2. Perform the actual repository task
        await _repository.toggleBookmark(event.eventId);

      } catch (e) {
        // If the repository fails, we revert to the old state and show an error
        emit(EventsState.error('Failed to update bookmark'));
        emit(EventsState.loaded(currentState.events)); // Revert
      }
    }
  }
}