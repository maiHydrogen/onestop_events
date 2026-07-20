import '../../domain/models/event_model.dart';
import '../../domain/models/feedback_model.dart';
import '../../domain/repositories/i_events_repo.dart';

class MockEventsRepository implements IEventsRepository {
  // Comprehensive list of mock events with both past and future dates.
  final List<EventModel> _allEvents = [
    EventModel(
      id: '1',
      title: 'Alcheringa 2026 Pro Shows',
      description:
          'The biggest cultural festival of North East India is back! Join us for an unforgettable night.',
      startTime: DateTime.now().add(const Duration(days: 2)),
      endTime: DateTime.now().add(const Duration(days: 2, hours: 5)),
      venue: 'Main Sports Board Ground, IITG',
      imageUrl: 'https://dummyimage.com/400x200/000/fff&text=Alcheringa',
      isBookmarked: false,
    ),
    EventModel(
      id: '2',
      title: 'Techniche Hackathon',
      description:
          'A 48-hour hackathon to solve real-world problems. Great prizes to be won.',
      startTime: DateTime.now().add(const Duration(days: 5)),
      endTime: DateTime.now().add(const Duration(days: 7)),
      venue: 'Core 1, IITG',
      imageUrl: 'https://dummyimage.com/400x200/000/fff&text=Techniche',
      isBookmarked: true,
    ),
    EventModel(
      id: '3',
      title: 'Guest Lecture – AI in Healthcare',
      description:
          'An insightful talk by Dr. Priya Sharma on the cutting-edge applications of AI in medical diagnostics.',
      startTime: DateTime.now().add(const Duration(days: 1)),
      endTime: DateTime.now().add(const Duration(days: 1, hours: 2)),
      venue: 'Lecture Hall 2, IITG',
      imageUrl: 'https://dummyimage.com/400x200/000/fff&text=AI+Talk',
      isBookmarked: true,
    ),
    EventModel(
      id: '4',
      title: 'Coding Contest – CodeRush',
      description:
          'Test your competitive programming skills in this 3-hour speed coding challenge.',
      startTime: DateTime.now().add(const Duration(days: 10)),
      endTime: DateTime.now().add(const Duration(days: 10, hours: 3)),
      venue: 'Computer Center, IITG',
      imageUrl: 'https://dummyimage.com/400x200/000/fff&text=CodeRush',
      isBookmarked: false,
    ),
    EventModel(
      id: '5',
      title: 'Photography Workshop',
      description:
          'Learn the basics of DSLR photography and photo editing from experienced student photographers.',
      startTime: DateTime.now().add(const Duration(days: 3)),
      endTime: DateTime.now().add(const Duration(days: 3, hours: 4)),
      venue: 'Seminar Hall A, IITG',
      imageUrl: 'https://dummyimage.com/400x200/000/fff&text=Photography',
      isBookmarked: false,
    ),
    EventModel(
      id: '6',
      title: 'Inter-Hostel Cricket Tournament',
      description:
          'The annual inter-hostel cricket match. Exciting final between Barak and Umiam.',
      startTime: DateTime.now().subtract(const Duration(days: 3)),
      endTime: DateTime.now().subtract(const Duration(hours: 60)),
      venue: 'Subansiri Ground, IITG',
      imageUrl: 'https://dummyimage.com/400x200/000/fff&text=Cricket',
      isBookmarked: false,
    ),
    EventModel(
      id: '7',
      title: 'Introduction to Flutter and Web Dev',
      description:
          'A hands-on workshop to learn Flutter basics and building responsive web apps.',
      startTime: DateTime.now().subtract(const Duration(days: 6)),
      endTime: DateTime.now().subtract(const Duration(hours: 140)),
      venue: 'EPH Seminar Hall, IITG',
      imageUrl: 'https://dummyimage.com/400x200/000/fff&text=Workshop',
      isBookmarked: false,
    ),
    EventModel(
      id: '8',
      title: 'Annual Cultural Night',
      description:
          'A night of performances by student clubs — music, dance, standup, and more.',
      startTime: DateTime.now().subtract(const Duration(days: 10)),
      endTime: DateTime.now().subtract(const Duration(hours: 230)),
      venue: 'Open Air Theatre, IITG',
      imageUrl: 'https://dummyimage.com/400x200/000/fff&text=Cultural+Night',
      isBookmarked: true,
    ),
    EventModel(
      id: '9',
      title: 'Robotics Workshop',
      description:
          'Build and program your first robot using Arduino in this beginner-friendly workshop.',
      startTime: DateTime.now().add(const Duration(days: 15)),
      endTime: DateTime.now().add(const Duration(days: 15, hours: 6)),
      venue: 'Electronics Lab, IITG',
      imageUrl: 'https://dummyimage.com/400x200/000/fff&text=Robotics',
      isBookmarked: false,
    ),
    EventModel(
      id: '10',
      title: 'Entrepreneurship Summit',
      description:
          'Connect with alumni entrepreneurs and investors. Pitch your startup ideas.',
      startTime: DateTime.now().add(const Duration(days: 20)),
      endTime: DateTime.now().add(const Duration(days: 20, hours: 8)),
      venue: 'Conference Hall, IITG',
      imageUrl: 'https://dummyimage.com/400x200/000/fff&text=E-Summit',
      isBookmarked: true,
    ),
    EventModel(
      id: '11',
      title: 'Football League Finals',
      description:
          'Watch the thrilling finals of the Inter-Hall Football League. Come support your hostel!',
      startTime: DateTime.now().add(const Duration(days: 4)),
      endTime: DateTime.now().add(const Duration(days: 4, hours: 2)),
      venue: 'Football Ground, IITG',
      imageUrl: 'https://dummyimage.com/400x200/000/fff&text=Football',
      isBookmarked: false,
    ),
    EventModel(
      id: '12',
      title: 'Design Sprint – UI/UX Bootcamp',
      description:
          'A two-day intensive bootcamp on user research, wireframing, and prototyping with Figma.',
      startTime: DateTime.now().add(const Duration(days: 8)),
      endTime: DateTime.now().add(const Duration(days: 9, hours: 6)),
      venue: 'Design Lab, IITG',
      imageUrl: 'https://dummyimage.com/400x200/000/fff&text=Design+Sprint',
      isBookmarked: false,
    ),
  ];

  @override
  Future<List<EventModel>> getEvents({int page = 1, int limit = 10}) async {
    // Validate pagination parameters to prevent RangeError/Index bounds crashes
    final sanitizedPage = page < 1 ? 1 : page;
    final sanitizedLimit = limit < 1 ? 10 : limit;

    // Simulate a realistic network delay
    await Future.delayed(const Duration(seconds: 1));

    final start = (sanitizedPage - 1) * sanitizedLimit;
    if (start >= _allEvents.length) return [];

    final end = (start + sanitizedLimit).clamp(0, _allEvents.length);
    return List.unmodifiable(_allEvents.sublist(start, end));
  }

  @override
  Future<EventModel> getEventById(String eventId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _allEvents.firstWhere(
      (e) => e.id == eventId,
      orElse: () => throw Exception('Event not found: $eventId'),
    );
  }

  @override
  Future<void> toggleBookmark(String eventId) async {
    await Future.delayed(const Duration(milliseconds: 400));
    final index = _allEvents.indexWhere((event) => event.id == eventId);
    if (index != -1) {
      final event = _allEvents[index];
      _allEvents[index] = event.copyWith(isBookmarked: !event.isBookmarked);
    } else {
      throw Exception('Event not found: $eventId');
    }
  }

  @override
  Future<EventModel> createEvent(EventModel event) async {
    // Check for duplicate ID
    final duplicateExists = _allEvents.any((e) => e.id == event.id);
    if (duplicateExists) {
      throw Exception('Duplicate ID: Event with ID ${event.id} already exists.');
    }

    await Future.delayed(const Duration(seconds: 1));
    _allEvents.add(event);
    return event;
  }

  @override
  Future<EventModel> updateEvent(EventModel event) async {
    await Future.delayed(const Duration(seconds: 1));
    final index = _allEvents.indexWhere((e) => e.id == event.id);
    if (index != -1) {
      _allEvents[index] = event;
      return event;
    } else {
      throw Exception('Event not found: ${event.id}');
    }
  }

  @override
  Future<void> deleteEvent(String eventId) async {
    await Future.delayed(const Duration(milliseconds: 600));
    final initialLength = _allEvents.length;
    _allEvents.removeWhere((e) => e.id == eventId);
    if (_allEvents.length == initialLength) {
      throw Exception('Event not found: $eventId');
    }
  }

  @override
  Future<void> submitFeedback(FeedbackModel feedback) async {
    await Future.delayed(const Duration(milliseconds: 800));
    // In a real implementation, this would POST to the API.
    // Here we just simulate success.
  }
}