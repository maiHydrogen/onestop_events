import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onestop_events/src/presentation/blocs/events/events_bloc.dart';
import 'package:onestop_events/src/presentation/pages/events_page.dart';

class MockEventsBloc extends Mock implements EventsBloc {}

void main() {
  late EventsBloc eventsBloc;

  setUp(() {
    eventsBloc = MockEventsBloc();
  });

  testWidgets('renders loading indicator when state is loading', (WidgetTester tester) async {
    when(() => eventsBloc.state).thenReturn(const EventsState.loading());
    when(() => eventsBloc.stream).thenAnswer((_) => Stream.value(const EventsState.loading()));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<EventsBloc>.value(
          value: eventsBloc,
          child: const EventsFeedPage(),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
