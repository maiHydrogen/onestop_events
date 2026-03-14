# Project Plan and Checklist

Project structure will be as follows -

```
lib/
├── src/
│   ├── core/
│   │   ├── di/ (get_it setup)
│   │   ├── router/ (go_router with custom nav)
│   │   └── constants/
│   ├── data/
│   │   ├── models/ (EventModel, ClubModel – use freezed)
│   │   ├── repositories/ (EventRepository, ClubRepository)
│   │   └── datasources/ (firestore_datasource)
│   ├── domain/
│   │   └── usecases/ (optional – keep simple for now)
│   ├── presentation/
│   │   ├── blocs/
│   │   │   ├── events_bloc/
│   │   │   ├── clubs_bloc/
│   │   │   └── admin_bloc/
│   │   └── pages/
│   │       ├── events_page.dart (uses OEventListingCard)
│   │       └── clubs_page.dart
│   └── widgets/ (custom wrappers if needed)
├── onestop_events.dart (export everything)
└── test/ (writing all the tests)
```

We will be following a two phase plan for this package development, which is as follows -

## Phase 1: Frontend Architecture & Mock Implementation

This phase focuses on structuring the package, defining the data shapes, wiring up the BLoCs with mock data, and painting the UI using the onestop_ui components.

1. Project Setup & Architecture

- [X] Initialize Clean Architecture directory structure (src/core, src/data, src/domain, src/presentation).
- [ ] Add necessary dependencies to pubspec.yaml (flutter_bloc, equatable, get_it, bloc_test, mocktail).
- [ ] Inject the onestop_ui package dependency.
- [ ] Setup Dependency Injection container (e.g., get_it) for managing repositories and BLoCs.

2. Domain Layer (Entities & Models)

- [ ] Define EventModel (id, title, description, date, location, image URL, etc.).
- [ ] Define ClubModel (id, name, category, description, logo URL, etc.).
- [ ] Define FeedbackModel and BookmarkModel.

3. Data Layer (Mock Repositories)

- [ ] Create IEventsRepository and IClubsRepository interfaces.
- [ ] Implement MockEventsRepository returning dummy lists of EventModel and simulating network delays.
- [ ] Implement MockClubsRepository returning dummy technical, cultural, and sports ClubModels.

4. State Management (BLoC Implementation)

- [ ] Create NavigationBloc (States: EventsTab, ClubsTab; Events: GoToEvents, GoToClubs, GoBack).
- [ ] Create EventsBloc (Events: FetchEvents, BookmarkEvent, SubmitFeedback; States: Loading, Loaded, Error).
- [ ] Create ClubsBloc (Events: FetchClubs; States: Loading, Loaded, Error).
- [ ] Create AdminBloc (Events: UpdateForm, SubmitEvent; States: Idle, Validating, Success, Failure).

5. Presentation Layer (UI & Routing)

- [ ] Build BaseScaffold incorporating the NavigationBloc and the ONavBar from onestop_ui (using IndexedStack to preserve state).
- [ ] Build EventsFeedPage using BlocBuilder to map EventsLoaded to a list of OEventListingCards.
- [ ] Build ClubsPage using a TabBar (Technical, Cultural, Sports) populated via ClubsBloc.
- [ ] Build EventDetailsPage for expanded viewing.
- [ ] Build AdminUploadPage with form fields for creating new events.

6. Phase 1 Testing

- [ ] Write unit tests for all BLoCs (bloc_test) using mocked repositories.
- [ ] Write widget tests ensuring EventsFeedPage and ClubsPage render correctly based on BLoC states.

## Phase 2: Backend Development & Real Data Integration

This phase transitions the package from mock data to real network requests, handling edge cases, and final integration with the parent app.

1. Backend API Development (Parallel or Sequential)

- [ ] Design and build database schema for Events, Clubs, Users, and Feedback.
- [ ] Develop REST/GraphQL endpoints for fetching Events and Clubs.
- [ ] Develop endpoints for Bookmarking and submitting Feedback.
- [ ] Develop Admin endpoints for uploading Event data and handling image storage (e.g., AWS S3 or Firebase Storage).

2. Data Layer (Remote Repositories)

- [ ] Add network package (e.g., dio or http).
- [ ] Set up network interceptors for error handling and injecting authentication tokens.
- [ ] Implement RemoteEventsRepository parsing real JSON responses into EventModels.
- [ ] Implement RemoteClubsRepository parsing real JSON responses into ClubModels.

3. Integration & Refinement

- [ ] Update Dependency Injection to provide Remote repositories instead of Mock repositories.
- [ ] Implement robust error handling in UI (e.g., using SnackBar components from onestop_ui on EventsError state).
- [ ] Handle empty states (e.g., "No events happening right now") and pagination (infinite scrolling) if needed.

4. Package Export & App Integration

- [ ] Create a clean barrel file (onestop_events.dart) exporting only the BaseScaffold wrapper and essential configuration methods.
- [ ] Import onestop_events into the parent Onestop app.
- [ ] Connect the parent app's authentication state/token to the onestop_events dependency injection container.
- [ ] Wire the parent app's router to trigger the package's BaseScaffold.

5. Final QA & Testing

- [ ] Write integration tests verifying real API calls (using a staging environment).
- [ ] Conduct manual testing for navigation edge cases (e.g., what happens when the user presses Android hardware back button inside the package).