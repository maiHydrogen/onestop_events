import 'package:flutter/material.dart';
import 'package:onestop_events/src/widgets/event_buttons.dart';
import 'package:onestop_events/src/widgets/events_header.dart';
import 'package:onestop_ui/index.dart';

class ClubsPage extends StatelessWidget {
  const ClubsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: OColor.gray100,
        // BlocBuilder listens to state changes and rebuilds this widget tree
        body: Column(
          children: [
            const EventsHeader(date: "Monday, 16th January", header: 'Clubs/Fests',),
            const SizedBox(height: OSpacing.xs),
            OSearchBar(controller: TextEditingController()),
            const SizedBox(height: OSpacing.xs),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: OSpacing.xs),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AllEventsButton(onPressed: () {}),
                  SavedEventsButton(onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
