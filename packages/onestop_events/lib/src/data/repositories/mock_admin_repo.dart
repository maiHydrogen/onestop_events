import '../../domain/models/event_model.dart';
import '../../domain/repositories/i_admin_repo.dart';

class MockAdminRepository implements IAdminRepository {
  final List<EventModel> _drafts = [
    EventModel(
      id: 'draft-1',
      title: 'Upcoming Tech Talk (Draft)',
      description: 'A draft for a planned tech talk on cloud computing. Not yet published.',
      startTime: DateTime.now().add(const Duration(days: 14)),
      endTime: DateTime.now().add(const Duration(days: 14, hours: 2)),
      venue: 'Seminar Hall B, IITG',
      imageUrl: 'https://dummyimage.com/400x200/000/fff&text=Draft',
      isBookmarked: false,
    ),
    EventModel(
      id: 'draft-2',
      title: 'Annual Sports Day (Draft)',
      description: 'Planning for the annual sports day event. Awaiting venue confirmation.',
      startTime: DateTime.now().add(const Duration(days: 30)),
      endTime: DateTime.now().add(const Duration(days: 30, hours: 8)),
      venue: 'TBD',
      imageUrl: 'https://dummyimage.com/400x200/000/fff&text=Sports+Draft',
      isBookmarked: false,
    ),
  ];

  final List<EventModel> _pastEvents = [
    EventModel(
      id: 'past-1',
      title: 'Open Source Contribution Drive',
      description: 'A session on contributing to popular open source projects on GitHub.',
      startTime: DateTime.now().subtract(const Duration(days: 15)),
      endTime: DateTime.now().subtract(const Duration(days: 14, hours: 20)),
      venue: 'Computer Center, IITG',
      imageUrl: 'https://dummyimage.com/400x200/000/fff&text=Open+Source',
      isBookmarked: false,
    ),
    EventModel(
      id: 'past-2',
      title: 'Cybersecurity Workshop',
      description: 'Hands-on ethical hacking and cybersecurity fundamentals.',
      startTime: DateTime.now().subtract(const Duration(days: 20)),
      endTime: DateTime.now().subtract(const Duration(days: 19, hours: 20)),
      venue: 'Electronics Lab, IITG',
      imageUrl: 'https://dummyimage.com/400x200/000/fff&text=Cybersecurity',
      isBookmarked: false,
    ),
  ];

  @override
  Future<List<EventModel>> getDrafts({int page = 1, int limit = 10}) async {
    final sanitizedPage = page < 1 ? 1 : page;
    final sanitizedLimit = limit < 1 ? 10 : limit;

    await Future.delayed(const Duration(milliseconds: 800));
    final start = (sanitizedPage - 1) * sanitizedLimit;
    if (start >= _drafts.length) return [];
    final end = (start + sanitizedLimit).clamp(0, _drafts.length);
    return List.unmodifiable(_drafts.sublist(start, end));
  }

  @override
  Future<List<EventModel>> getPastEvents({int page = 1, int limit = 10}) async {
    final sanitizedPage = page < 1 ? 1 : page;
    final sanitizedLimit = limit < 1 ? 10 : limit;

    await Future.delayed(const Duration(milliseconds: 800));
    final start = (sanitizedPage - 1) * sanitizedLimit;
    if (start >= _pastEvents.length) return [];
    final end = (start + sanitizedLimit).clamp(0, _pastEvents.length);
    return List.unmodifiable(_pastEvents.sublist(start, end));
  }
}
