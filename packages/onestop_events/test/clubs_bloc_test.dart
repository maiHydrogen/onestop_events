import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:onestop_events/src/domain/models/club_model.dart';
import 'package:onestop_events/src/domain/repositories/i_clubs_repo.dart';
import 'package:onestop_events/src/presentation/blocs/clubs/clubs_bloc.dart';

class MockClubsRepository extends Mock implements IClubsRepository {}

void main() {
  late IClubsRepository repository;
  late ClubsBloc bloc;

  final tClubs = [
    const ClubModel(
      id: 'c1',
      name: 'Coding Club',
      description: 'The coding club description',
      category: ClubCategory.technical,
    ),
  ];

  setUp(() {
    repository = MockClubsRepository();
    bloc = ClubsBloc(clubsRepository: repository);
  });

  tearDown(() {
    bloc.close();
  });

  test('initial state should be ClubsState.initial()', () {
    expect(bloc.state, const ClubsState.initial());
  });

  blocTest<ClubsBloc, ClubsState>(
    'emits [Loading, Loaded] when fetchClubs is added and successful',
    build: () {
      when(() => repository.getClubs()).thenAnswer((_) async => tClubs);
      return bloc;
    },
    act: (bloc) => bloc.add(const ClubsEvent.fetchClubs()),
    expect: () => [
      const ClubsState.loading(),
      ClubsState.loaded(tClubs),
    ],
    verify: (_) {
      verify(() => repository.getClubs()).called(1);
    },
  );

  blocTest<ClubsBloc, ClubsState>(
    'emits [Loading, Error] when fetchClubs fails',
    build: () {
      when(() => repository.getClubs()).thenThrow(Exception('clubs error'));
      return bloc;
    },
    act: (bloc) => bloc.add(const ClubsEvent.fetchClubs()),
    expect: () => [
      const ClubsState.loading(),
      const ClubsState.error('Failed to fetch clubs: Exception: clubs error'),
    ],
  );
}
