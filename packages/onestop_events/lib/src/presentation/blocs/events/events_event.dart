part of 'events_bloc.dart';

@freezed
class EventsEvent with _$EventsEvent {
  const factory EventsEvent.fetchEvents() = _FetchEvents;
  const factory EventsEvent.toggleBookmark(String eventId) = _ToggleBookmark;
}