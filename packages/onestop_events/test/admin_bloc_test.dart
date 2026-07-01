import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onestop_events/src/presentation/blocs/admin/admin_bloc.dart';

void main() {
  late AdminBloc bloc;

  setUp(() {
    bloc = AdminBloc();
  });

  tearDown(() {
    bloc.close();
  });

  test('initial state should be AdminState.idle() with empty fields', () {
    expect(
      bloc.state,
      const AdminState.idle(
        title: '',
        description: '',
        startTime: null,
        endTime: null,
        venue: '',
        imageUrl: null,
      ),
    );
  });

  blocTest<AdminBloc, AdminState>(
    'updates form fields when updateForm is added',
    build: () => bloc,
    act: (bloc) => bloc.add(AdminEvent.updateForm(
      title: 'New Title',
      venue: 'New Venue',
    )),
    expect: () => [
      const AdminState.idle(
        title: 'New Title',
        description: '',
        startTime: null,
        endTime: null,
        venue: 'New Venue',
        imageUrl: null,
      ),
    ],
  );

  blocTest<AdminBloc, AdminState>(
    'emits [Failure, Idle] when submitEvent is added and fields are empty',
    build: () => bloc,
    act: (bloc) => bloc.add(const AdminEvent.submitEvent()),
    expect: () => [
      const AdminState.failure('Title cannot be empty'),
      const AdminState.idle(),
    ],
  );
}
