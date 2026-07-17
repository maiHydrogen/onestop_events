# onestop_events

A Flutter package that provides a fully featured events feed, clubs discovery, and admin management experience for the Onestop IITG App.

---

## Getting Started

Read the `project_plan.md` file in the repo before starting anything.

## Additional Info
- Please go through the repo first and always refer to the `dev` branch for the latest updates.
- For a demo of each widget, run `main.dart` in the demo app at the project root.
- The package is inside the `packages/` directory of the parent project. The parent project contains only a demo app for development purposes.
- Please refer to comments available (if any) and use `Ctrl + Click` on each widget to navigate to its definition.

## Need Help?
If you experience any issue in this repo or require some other component please raise an issue or contact us — we will try to address it as soon as possible.

---

## Integration Guide (For the Main App Team)

This section explains how to integrate the `onestop_events` package into the main Onestop Flutter app.

### 1. Add the Dependency

In your main app's `pubspec.yaml`, add the package as a path or git dependency:

```yaml
dependencies:
  onestop_events:
    path: ../path/to/onestop_events/packages/onestop_events
    # OR via git:
    # git:
    #   url: https://github.com/swciitg/onestop_events.git
    #   path: packages/onestop_events
    #   ref: main
```

---

### 2. Implement the Repository Interfaces

The package does **not** make HTTP calls directly. You must implement the repository interfaces using your app's authenticated `Dio` (or `http`) client.

There are three interfaces to implement, all located in `lib/src/domain/repositories/`:

- `IEventsRepository` — for fetching, creating, updating, and deleting events.
- `IClubsRepository` — for fetching and updating clubs.
- `IAdminRepository` — for fetching admin-specific data (drafts, past events).

**Example — implementing `IEventsRepository`:**

```dart
import 'package:dio/dio.dart';
import 'package:onestop_events/src/domain/models/event_model.dart';
import 'package:onestop_events/src/domain/models/feedback_model.dart';
import 'package:onestop_events/src/domain/repositories/i_events_repo.dart';

class ApiEventsRepository implements IEventsRepository {
  final Dio _dio; // Your authenticated Dio instance

  ApiEventsRepository({required Dio dio}) : _dio = dio;

  @override
  Future<List<EventModel>> getEvents({int page = 1, int limit = 10}) async {
    final response = await _dio.get(
      '/api/events',
      queryParameters: {'page': page, 'limit': limit},
    );
    return (response.data['data'] as List)
        .map((json) => EventModel.fromJson(json))
        .toList();
  }

  @override
  Future<EventModel> getEventById(String eventId) async {
    final response = await _dio.get('/api/events/$eventId');
    return EventModel.fromJson(response.data);
  }

  @override
  Future<void> toggleBookmark(String eventId) async {
    await _dio.post('/api/events/$eventId/bookmark');
  }

  @override
  Future<EventModel> createEvent(EventModel event) async {
    final response = await _dio.post('/api/events', data: event.toJson());
    return EventModel.fromJson(response.data);
  }

  @override
  Future<EventModel> updateEvent(EventModel event) async {
    final response = await _dio.put('/api/events/${event.id}', data: event.toJson());
    return EventModel.fromJson(response.data);
  }

  @override
  Future<void> deleteEvent(String eventId) async {
    await _dio.delete('/api/events/$eventId');
  }

  @override
  Future<void> submitFeedback(FeedbackModel feedback) async {
    await _dio.post('/api/events/${feedback.eventId}/feedback', data: feedback.toJson());
  }
}
```

Implement `IClubsRepository` and `IAdminRepository` similarly.

---

### 3. Initialize the Package in `main.dart`

Call `initEventsPackage()` **before** `runApp()`, passing your repository implementations:

```dart
import 'package:onestop_events/onestop_events.dart';
import 'package:onestop_events/src/domain/repositories/i_events_repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set up your authenticated Dio instance
  final authenticatedDio = Dio(BaseOptions(
    baseUrl: 'https://api.onestop.iitg.ac.in',
    headers: {'Authorization': 'Bearer ${userToken}'},
  ));

  // Initialize the events package with your API repositories
  await initEventsPackage(
    eventsRepository: ApiEventsRepository(dio: authenticatedDio),
    clubsRepository: ApiClubsRepository(dio: authenticatedDio),
    adminRepository: ApiAdminRepository(dio: authenticatedDio),
  );

  runApp(const MyApp());
}
```

> **Note:** If no repositories are provided, the package defaults to mock data for development and testing.

---

### 4. Mount the Package Router

The package uses `go_router` internally. In your main app's router configuration, redirect to the package's entry point:

```dart
import 'package:onestop_events/src/core/router/app_router.dart';

// Option A: Use the package's router directly as your app's router
MaterialApp.router(
  routerConfig: AppRouter.router,
);

// Option B: Redirect a route in your existing router to the package
GoRoute(
  path: '/events',
  builder: (context, state) => const ONavBarWrapper(child: EventsFeedPage()),
),
```

---

### 5. Set Admin Status

To enable the admin panel, call `setAdmin(true)` after verifying the user's role:

```dart
import 'package:onestop_events/src/core/di/injection_container.dart';
import 'package:onestop_events/src/core/models/admin_flag.dart';

// After verifying the user is an admin:
sl<AdminFlag>().setAdmin(true);
```

---

## Screenshots