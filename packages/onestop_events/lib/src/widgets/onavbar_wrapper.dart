import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:onestop_ui/index.dart';
import '../presentation/blocs/navigation/navigation_bloc.dart';
import '../core/models/admin_flag.dart';
import '../core/di/injection_container.dart';

class ONavBarWrapper extends StatelessWidget {
  final Widget child;
  const ONavBarWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // Listen to state to highlight the correct tab
    final navState = context.watch<NavigationBloc>().state;

    return ListenableBuilder(
      listenable: sl<AdminFlag>(),
      builder: (context, _) {
        final isAdmin = sl<AdminFlag>().isAdmin;

        // Determine which tab should be visually selected matching ONavBar labels
        String selectedTab = "Events";
        if (navState.clubs) selectedTab = "Clubs";
        if (navState.manage) selectedTab = "Manage";

        final labels = ["Home", "Events", "Clubs"];
        final icons = [
          TablerIcons.arrow_narrow_left,
          TablerIcons.calendar_event,
          TablerIcons.confetti,
        ];

        if (isAdmin) {
          labels.add("Manage");
          icons.add(TablerIcons.user);
        }

        return Scaffold(
          // The child is automatically swapped between EventsPage and ClubsPage by GoRouter!
          body: child,
          bottomNavigationBar: ONavBar(
            key: ValueKey(selectedTab),
            initialSelectedTab: selectedTab,
            labels: labels,
            icons: icons,
            height: isAdmin ? 86 : 70,
            onTabItemSelected: (int index) {
              if (index == 0) {
                // Tap "Back" -> placeholder for host app to implement exit
                context.pop();
              } else if (index == 1 && !navState.events) {
                context.read<NavigationBloc>().add(const NavigationEvent.changed(NavigationTab.events));
                context.go('/events');
              } else if (index == 2 && !navState.clubs) {
                context.read<NavigationBloc>().add(const NavigationEvent.changed(NavigationTab.clubs));
                context.go('/clubs');
              } else if (index == 3 && isAdmin && !navState.manage) {
                context.read<NavigationBloc>().add(const NavigationEvent.changed(NavigationTab.manage));
                context.go('/manage');
              }
            },
          ),
        );
      },
    );
  }
}