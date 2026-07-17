import 'package:get_it/get_it.dart';

import '../../domain/repositories/i_events_repo.dart';
import '../../domain/repositories/i_clubs_repo.dart';
import '../../domain/repositories/i_admin_repo.dart';
import '../../data/repositories/mock_events_repo.dart';
import '../../data/repositories/mock_clubs_repo.dart';
import '../../data/repositories/mock_admin_repo.dart';
import '../../presentation/blocs/events/events_bloc.dart';
import '../../presentation/blocs/navigation/navigation_bloc.dart';
import '../../presentation/blocs/clubs/clubs_bloc.dart';
import '../../presentation/blocs/admin/admin_bloc.dart';
import '../models/admin_flag.dart';

final sl = GetIt.instance; // sl stands for Service Locator

/// Initializes the onestop_events package.
///
/// Call this from your app's `main()` before `runApp()`.
///
/// **For integration with the host app:**
/// Pass your own implementations of [IEventsRepository], [IClubsRepository],
/// and [IAdminRepository] to replace the built-in mock repositories.
/// These implementations should use the host app's authenticated HTTP client.
///
/// Example:
/// ```dart
/// await initEventsPackage(
///   eventsRepository: MyApiEventsRepository(dio: myAuthenticatedDio),
///   clubsRepository: MyApiClubsRepository(dio: myAuthenticatedDio),
///   adminRepository: MyApiAdminRepository(dio: myAuthenticatedDio),
/// );
/// ```
///
/// If no implementations are provided, the package defaults to mock data
/// suitable for development and testing.
Future<void> initEventsPackage({
  IEventsRepository? eventsRepository,
  IClubsRepository? clubsRepository,
  IAdminRepository? adminRepository,
}) async {
  // ---------------------------------------------------------------------------
  // 1. Data Layer (Repositories)
  // ---------------------------------------------------------------------------
  // Bind each interface to either the host-app-provided implementation
  // or the built-in mock as a fallback.
  sl.registerLazySingleton<IEventsRepository>(
    () => eventsRepository ?? MockEventsRepository(),
  );

  sl.registerLazySingleton<IClubsRepository>(
    () => clubsRepository ?? MockClubsRepository(),
  );

  sl.registerLazySingleton<IAdminRepository>(
    () => adminRepository ?? MockAdminRepository(),
  );

  sl.registerLazySingleton<AdminFlag>(
    () => AdminFlag(),
  );

  // ---------------------------------------------------------------------------
  // 2. Presentation Layer (BLoCs)
  // ---------------------------------------------------------------------------
  // Registered as factories so each navigation produces a fresh BLoC instance.
  sl.registerFactory(() => NavigationBloc());
  sl.registerFactory(
    () => EventsBloc(repository: sl<IEventsRepository>()),
  );
  sl.registerFactory(
    () => ClubsBloc(clubsRepository: sl<IClubsRepository>()),
  );
  sl.registerFactory(() => AdminBloc());

  // ---------------------------------------------------------------------------
  // 3. Core / External (Hive, Dio, etc.)
  // ---------------------------------------------------------------------------
  // The host app is responsible for initializing and passing its HTTP client
  // via the repository constructors above. No network setup is done here.
}