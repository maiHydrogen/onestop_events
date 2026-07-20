import '../models/event_model.dart';

abstract class IAdminRepository {
  /// Fetches draft events for the admin's club.
  Future<List<EventModel>> getDrafts({int page = 1, int limit = 10});

  /// Fetches past (concluded) events for the admin's club.
  Future<List<EventModel>> getPastEvents({int page = 1, int limit = 10});
}
