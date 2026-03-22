import '../../domain/models/event_model.dart';
import '../../domain/repositories/i_events_repo.dart';

class MockEventsRepository implements IEventsRepository {
  // We keep a private mutable list in memory to simulate a database for Phase 1
  final List<EventModel> _mockEvents = [
    EventModel(
      id: '1',
      title: 'Alcheringa 2026 Pro Shows',
      description: 'The biggest cultural festival of North East India is back! Join us for an unforgettable night.',
      startTime: DateTime.now().add(const Duration(days: 2)),
      endTime: DateTime.now().add(const Duration(days: 2, hours: 5)),
      venue: 'Main Sports Board Ground, IITG',
      imageUrl: 'https://dummyimage.com/400x200/000/fff&text=Alcheringa',
      isBookmarked: false,
    ),
    EventModel(
      id: '2',
      title: 'Techniche Hackathon',
      description: 'A 48-hour hackathon to solve real-world problems. Great prizes to be won.',
      startTime: DateTime.now().add(const Duration(days: 5)),
      endTime: DateTime.now().add(const Duration(days: 7)),
      venue: 'Core 1, IITG',
      imageUrl: 'https://dummyimage.com/400x200/000/fff&text=Techniche',
      isBookmarked: true,
    ),
  ];

  @override
  Future<List<EventModel>> getEvents() async {
    // Simulate a network delay of 2 seconds so you can test your loading UI
    await Future.delayed(const Duration(seconds: 2));

    // Return a copy of the list
    return List.unmodifiable(_mockEvents);
  }

  @override
  Future<void> toggleBookmark(String eventId) async {
    // Simulate a fast network request
    await Future.delayed(const Duration(milliseconds: 500));

    final index = _mockEvents.indexWhere((event) => event.id == eventId);
    if (index != -1) {
      final event = _mockEvents[index];
      // Because EventModel is immutable (thanks to Freezed), we use .copyWith()
      _mockEvents[index] = event.copyWith(isBookmarked: !event.isBookmarked);
    } else {
      throw Exception('Event not found');
    }
  }
}