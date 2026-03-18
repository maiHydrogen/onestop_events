import 'package:get_it/get_it.dart';

// Import your BLoCs and Repositories here as you create them
// import '../../presentation/blocs/events/events_bloc.dart';
import '../../domain/repositories/i_events_repo.dart';
import '../../data/repositories/mock_events_repo.dart';
import '../../presentation/bloc/events/events_bloc.dart';

final sl = GetIt.instance; // sl stands for Service Locator

Future<void> initEventsPackage() async {
  // ---------------------------------------------------------------------------
  // 1. Presentation Layer (BLoCs)
  // ---------------------------------------------------------------------------
  // We register BLoCs as Factories. This means every time we call sl<EventsBloc>(),
  // get_it provides a fresh instance. This is standard for BLoCs so you don't 
  // accidentally carry over old state when navigating away and coming back.
  sl.registerFactory(
        () => EventsBloc(repository: sl()),
  );
  /*
  
  sl.registerFactory(
    () => ClubsBloc(clubsRepository: sl()),
  );
  */

  // ---------------------------------------------------------------------------
  // 2. Domain & Data Layer (Repositories)
  // ---------------------------------------------------------------------------
  // Repositories are registered as Lazy Singletons. It creates exactly one 
  // instance of the repository the first time it is requested, and reuses it.
  // Notice how we bind the Interface (IEventsRepository) to the Implementation (MockEventsRepository).
  sl.registerLazySingleton<IEventsRepository>(
        () => MockEventsRepository(),
  );
  /*
  sl.registerLazySingleton<IClubsRepository>(
    () => MockClubsRepository(),
  );
  */

  // ---------------------------------------------------------------------------
  // 3. Core / External (Hive, Dio, etc.)
  // ---------------------------------------------------------------------------
  // Later in Phase 2, you will register Dio here. 
  // For now, if you are setting up Hive boxes for caching, you can open them here.
}