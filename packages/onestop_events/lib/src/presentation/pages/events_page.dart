import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:onestop_events/src/widgets/event_buttons.dart';
import 'package:onestop_events/src/widgets/events_header.dart';
import 'package:onestop_ui/index.dart';

import '../blocs/events/events_bloc.dart';

class EventsFeedPage extends StatelessWidget {
  const EventsFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: OColor.gray100,
        // BlocBuilder listens to state changes and rebuilds this widget tree
        body: Column(
          children: [
            const EventsHeader(date: "Monday, 16th January", header: 'Events',),
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
            const SizedBox(height: OSpacing.m),
            const EventsHeaderSmall(heading: 'Happening Today', icon: TablerIcons.calendar,),
          ],
        ),
        /*BlocBuilder<EventsBloc, EventsState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (message) => Center(
                child: OText(
                  text: message,
                  style: OTextStyle.bodyLarge.copyWith(color: OColor.blue200),
                ),
              ),
              loaded: (events) {
                if (events.isEmpty) {
                  return const Center(child: Text('No upcoming events.'));
                }
      
                // Render the list of events using your custom cards
                return ListView.separated(
                  padding: const EdgeInsets.all(OSpacing.l),
                  itemCount: events.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: OSpacing.xs),
                  itemBuilder: (context, index) {
                    final event = events[index];
      
                    return OEventListingCard.medium(
                      title: event.title,
                      date: event.startTime
                          .toString(), // Format this nicely later using intl package
                      location: event.venue,
                      type: EventCardType.user,
                      startTime: '',
                      eventImageUrl: event.imageUrl ?? '',
                    );
                  },
                );
              },
            );
          },
        ),*/
      ),
    );
  }
}
