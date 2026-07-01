import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:onestop_events/src/domain/models/event_model.dart';
import 'package:onestop_events/src/domain/repositories/i_events_repo.dart';
import 'package:onestop_events/src/presentation/blocs/events/events_bloc.dart';

class MockEventsRepository extends Mock implements IEventsRepository {}

void main() {
  late IEventsRepository repository;
  late EventsBloc bloc;

  final tEvents = [
    EventModel(
      id: '1',
      title: 'Test Event 1',
      description: 'Desc 1',
      startTime: DateTime(2026, 1, 1),
      endTime: DateTime(2026, 1, 2),
      venue: 'Venue 1',
      isBookmarked: false,
    ),
  ];

  setUp(() {
    repository = MockEventsRepository();
    bloc = EventsBloc(repository: repository);
  });

  tearDown(() {
    bloc.close();
  });

  test('initial state should be EventsState.initial()', () {
    expect(bloc.state, const EventsState.initial());
  });

  blocTest<EventsBloc, EventsState>(
    'emits [Loading, Loaded] when fetchEvents is added and successful',
    build: () {
      when(() => repository.getEvents()).thenAnswer((_) async => tEvents);
      return bloc;
    },
    act: (bloc) => bloc.add(const EventsEvent.fetchEvents()),
    expect: () => [
      const EventsState.loading(),
      EventsState.loaded(tEvents),
    ],
    verify: (_) {
      verify(() => repository.getEvents()).called(1);
    },
  );

  blocTest<EventsBloc, EventsState>(
    'emits [Loading, Error] when fetchEvents fails',
    build: () {
      when(() => repository.getEvents()).thenThrow(Exception('test error'));
      return bloc;
    },
    act: (bloc) => bloc.add(const EventsEvent.fetchEvents()),
    expect: () => [
      const EventsState.loading(),
      const EventsState.error('Failed to fetch events: Exception: test error'),
    ],
  );
}
