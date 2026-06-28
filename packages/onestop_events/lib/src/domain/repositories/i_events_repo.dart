import '../models/event_model.dart';

abstract class IEventsRepository {
  /// Fetches the list of all upcoming events.
  Future<List<EventModel>> getEvents();

  /// Toggles the bookmarked status of a specific event.
  Future<void> toggleBookmark(String eventId);
}