import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:onestop_events/src/domain/models/event_model.dart';

import 'package:onestop_events/src/widgets/event_buttons.dart';
import 'package:onestop_events/src/widgets/events_header.dart';
import 'package:onestop_ui/index.dart';

import '../../widgets/horizontal_lists_builder.dart';
import '../blocs/events/events_bloc.dart';

class EventsFeedPage extends StatelessWidget {
  const EventsFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: OColor.gray100,
        // 1. Wrap the entire body in the BlocBuilder so ALL sections have access to the data
        body: BlocBuilder<EventsBloc, EventsState>(
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
                  return const Center(child: Text('No events found.'));
                }

                // 2. Use CustomScrollView to handle mixed horizontal/vertical scrolling
                return CustomScrollView(
                  slivers: [
                    // --- STATIC TOP SECTION ---
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          const EventsHeader(
                            date: "Monday, 16th January",
                            header: 'Events',
                          ),
                          const SizedBox(height: OSpacing.xs),
                          OSearchBar(controller: TextEditingController()),
                          const SizedBox(height: OSpacing.xs),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: OSpacing.xs,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AllEventsButton(onPressed: () {}),
                                SavedEventsButton(onPressed: () {}),
                              ],
                            ),
                          ),
                          const SizedBox(height: OSpacing.m),
                        ],
                      ),
                    ),

                    // --- HAPPENING TODAY ---
                    const SliverToBoxAdapter(
                      child: EventsHeaderSmall(
                        heading: 'Happening Today',
                        icon: TablerIcons.calendar,
                      ),
                    ),
                    SliverToBoxAdapter(
                      // We pass a subset of events here (e.g., filter by today's date in a real app)
                      child: buildHorizontalList(events),
                    ),

                    // --- TRENDING EVENTS ---
                    SliverToBoxAdapter(
                      child: EventsHeaderSmall(
                        heading: 'Trending Events',
                        icon: TablerIcons.flame,
                        buttonLabel: "Learn More",
                        onPressed: () {},
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: buildHorizontalList(
                        events,
                      ), // Replace with trending filtered list
                    ),

                    // --- YOUR INTERESTS ---
                    SliverToBoxAdapter(
                      child: EventsHeaderSmall(
                        heading: 'Your Interests',
                        icon: TablerIcons.user,
                        buttonIcon: TablerIcons.settings,
                        buttonLabel: "Personalize",
                        onPressed: () {},
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: buildHorizontalList(
                        events,
                      ), // Replace with interests filtered list
                    ),

                    // --- EXPLORE (VERTICAL LIST) ---
                    const SliverToBoxAdapter(
                      child: EventsHeaderSmall(
                        heading: 'Explore',
                        icon: TablerIcons.compass,
                      ),
                    ),

                    // 3. The main vertical list uses SliverList instead of ListView
                    SliverPadding(
                      padding: const EdgeInsets.all(OSpacing.l),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final event = events[index];
                            return Padding(
                              padding: const EdgeInsets.only(
                                bottom: OSpacing.xs,
                              ),
                              child: OEventListingCard.large(hostImageUrl: "",
                                hostName: "Swc",
                                views: 2,
                                attendance: 300,
                                tag1: "label1",
                                tag2: "label2",
                                tagIcon1: TablerIcons.arrow_rotary_first_left,
                                tagIcon2: TablerIcons.arrow_rotary_first_left,
                                title: event.title,
                                date: event.startTime.toString(),
                                location: event.venue,
                                type: EventCardType.user,
                                startTime:
                                    '', // Fill this in based on your model
                                eventImageUrl: event.imageUrl ?? '',
                              ),
                            );
                          },
                          childCount: events.length, // Number of explore events
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
