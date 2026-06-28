import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onestop_events/src/presentation/blocs/navigation/navigation_bloc.dart';
import 'package:onestop_events/src/presentation/pages/clubs_page.dart';
import 'package:onestop_events/src/presentation/pages/events_page.dart';
import 'package:onestop_events/src/presentation/pages/event_details_page.dart';
import 'package:onestop_events/src/presentation/pages/admin_upload_page.dart';
import 'package:onestop_events/src/domain/models/event_model.dart';
import '../../presentation/blocs/events/events_bloc.dart';
import '../../presentation/blocs/clubs/clubs_bloc.dart';
import '../../presentation/blocs/admin/admin_bloc.dart';
import '../../widgets/onavbar_wrapper.dart';
import '../di/injection_container.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/events',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          // Provide all package-level BLoCs here
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => sl<NavigationBloc>(),
              ),
              BlocProvider(
                // Fetch events as soon as the package is opened
                create: (_) => sl<EventsBloc>()..add(const EventsEvent.fetchEvents()),
              ),
              BlocProvider(
                // Fetch clubs as soon as the package is opened
                create: (_) => sl<ClubsBloc>()..add(const ClubsEvent.fetchClubs()),
              ),
              BlocProvider(
                create: (_) => sl<AdminBloc>(),
              ),
            ],
            child: ONavBarWrapper(child: child),
          );
        },
        routes: [
          GoRoute(
            path: '/events',
            builder: (context, state) => const EventsFeedPage(),
          ),
          GoRoute(
            path: '/clubs',
            builder: (context, state) => const ClubsPage(),
          ),
          GoRoute(
            path: '/event-details',
            builder: (context, state) {
              final event = state.extra as EventModel;
              return EventDetailsPage(event: event);
            },
          ),
          GoRoute(
            path: '/admin-upload',
            builder: (context, state) => const AdminUploadPage(),
          ),
        ],
      ),
    ],
  );
}