part of 'events_bloc.dart';

@freezed
class EventsEvent with _$EventsEvent {
  const factory EventsEvent.fetchEvents() = _FetchEvents;
  const factory EventsEvent.loadMoreEvents() = _LoadMoreEvents;
  const factory EventsEvent.toggleBookmark(String eventId) = _ToggleBookmark;
  const factory EventsEvent.toggleRegister(String eventId) = _ToggleRegister;
  const factory EventsEvent.markAsDraft(String eventId) = _MarkAsDraft;
  const factory EventsEvent.publishDraft(String eventId) = _PublishDraft;
}