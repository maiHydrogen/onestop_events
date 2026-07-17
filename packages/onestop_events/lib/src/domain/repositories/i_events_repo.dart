import '../models/event_model.dart';
import '../models/feedback_model.dart';

abstract class IEventsRepository {
  /// Fetches a paginated list of events.
  /// [page] starts at 1. [limit] controls items per page.
  Future<List<EventModel>> getEvents({int page = 1, int limit = 10});

  /// Fetches a single event by its unique ID.
  Future<EventModel> getEventById(String eventId);

  /// Toggles the bookmarked status of a specific event.
  Future<void> toggleBookmark(String eventId);

  /// Creates a new event. Admin only.
  Future<EventModel> createEvent(EventModel event);

  /// Updates an existing event. Admin only.
  Future<EventModel> updateEvent(EventModel event);

  /// Deletes an event by ID. Admin only.
  Future<void> deleteEvent(String eventId);

  /// Submits user feedback for a concluded event.
  Future<void> submitFeedback(FeedbackModel feedback);
}