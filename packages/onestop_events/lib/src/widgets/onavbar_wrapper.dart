import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:onestop_ui/index.dart';
import '../presentation/blocs/navigation/navigation_bloc.dart';

class ONavBarWrapper extends StatelessWidget {
  final Widget child;
  const ONavBarWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // Listen to state to highlight the correct tab
    final navState = context.watch<NavigationBloc>().state;

    // Determine which tab should be visually selected
    // Assuming ONavBar uses string indices: '0' for Back, '1' for Events, '2' for Clubs
    String selectedTab = navState.events ? '1' : '2';

    return Scaffold(
      // The child is automatically swapped between EventsPage and ClubsPage by GoRouter!
      body: child,
      bottomNavigationBar: ONavBar(
        initialSelectedTab: "Events",
        labels: const ["Home","Events", "Clubs/Fest"],
        icons: const [
          TablerIcons.arrow_narrow_left,
          TablerIcons.calendar_event,
          TablerIcons.confetti,
        ],
        onTabItemSelected: (int index) {
          if (index == 0) {
            // Tap "Back" -> Exit the package completely
            context.pop();
          }
          else if (index == 1 && !navState.events) {
            // Tap "Events" -> Update state & navigate
            context.read<NavigationBloc>().add(const NavigationEvent.changed(NavigationTab.events));
            context.go('/events');
          }
          else if (index == 2 && !navState.clubs) {
            // Tap "Clubs" -> Update state & navigate
            context.read<NavigationBloc>().add(const NavigationEvent.changed(NavigationTab.clubs));
            context.go('/clubs');
          }
        },// Adjust based on ONavBar's exact API
      ),
    );
  }
}