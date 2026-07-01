import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:onestop_events/src/domain/models/event_model.dart';

import 'package:onestop_events/src/widgets/event_buttons.dart';
import 'package:onestop_events/src/widgets/events_header.dart';
import 'package:onestop_ui/index.dart';

import '../../widgets/horizontal_lists_builder.dart';
import '../../widgets/event_details_sheet.dart';
import '../blocs/events/events_bloc.dart';

class EventsFeedPage extends StatefulWidget {
  const EventsFeedPage({super.key});

  @override
  State<EventsFeedPage> createState() => _EventsFeedPageState();
}

class _EventsFeedPageState extends State<EventsFeedPage> {
  late TextEditingController _searchController;
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text;
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: OColor.gray100,
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
                final List<EventModel> filteredEvents = events.where((event) {
                  final matchesSearch = event.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
                      event.description.toLowerCase().contains(_searchQuery.toLowerCase());
                  return matchesSearch;
                }).toList();

                final todayEvents = events.where((e) {
                  final now = DateTime.now();
                  return e.startTime.year == now.year &&
                      e.startTime.month == now.month &&
                      e.startTime.day == now.day;
                }).toList();

                // Fallback today's events if none match exactly today
                final todaySectionEvents = todayEvents.isNotEmpty ? todayEvents : events;

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
                          SizedBox(height: OSpacing.xs),
                          OSearchBar(controller: _searchController),
                          SizedBox(height: OSpacing.xs),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.symmetric(
                              horizontal: OSpacing.xs,
                            ),
                            child: Row(
                              children: [
                                AllEventsButton(
                                  onPressed: () {
                                    context.push('/all-events');
                                  },
                                  eventNumber: events.length.toString(),
                                ),
                                SizedBox(width: OSpacing.s),
                                SavedEventsButton(
                                  onPressed: () {
                                    context.push('/saved-events');
                                  },
                                ),
                                SizedBox(width: OSpacing.s),
                                TertiaryButton(
                                  label: "Upload",
                                  onPressed: () => context.push('/admin-upload'),
                                  leadingIcon: TablerIcons.plus,
                                  iconColor: OColor.green600,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: OSpacing.m),
                        ],
                      ),
                    ),

                      // --- HAPPENING TODAY ---
                      SliverToBoxAdapter(
                        child: EventsHeaderSmall(
                          heading: 'Happening Today',
                          icon: TablerIcons.calendar,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: buildHorizontalList(context, todaySectionEvents),
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
                        // Simulate trending by using a different subset, e.g. top saved
                        child: buildHorizontalList(context, events.where((e) => e.isBookmarked).toList().isNotEmpty ? events.where((e) => e.isBookmarked).toList() : events),
                      ),

                      // --- RECENTLY ATTENDED (Mock) ---
                      SliverToBoxAdapter(
                        child: EventsHeaderSmall(
                          heading: 'Recently Attended',
                          icon: TablerIcons.history,
                        ),
                      ),
                      SliverToBoxAdapter(
                        // In reality, this would map the static JSON. For now, reusing horizontal list for simplicity
                        child: buildHorizontalList(context, events),
                      ),

                    // --- EXPLORE / LIST VIEW ---
                    SliverToBoxAdapter(
                      child: EventsHeaderSmall(
                        heading: 'Explore',
                        icon: TablerIcons.compass,
                      ),
                    ),

                    if (filteredEvents.isEmpty)
                      const SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Center(
                            child: Text('No events found.'),
                          ),
                        ),
                      )
                    else
                      SliverPadding(
                        padding: EdgeInsets.all(OSpacing.l),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              final event = filteredEvents[index];
                              final String formattedTime = "${event.startTime.hour.toString().padLeft(2, '0')}:${event.startTime.minute.toString().padLeft(2, '0')}";
                              final String formattedDate = "${event.startTime.day.toString().padLeft(2, '0')}/${event.startTime.month.toString().padLeft(2, '0')}/${event.startTime.year}";
                              final String formattedEnd = "${event.endTime.hour.toString().padLeft(2, '0')}:${event.endTime.minute.toString().padLeft(2, '0')}";

                              return Padding(
                                padding: EdgeInsets.only(
                                  bottom: OSpacing.xs,
                                ),
                                child: OEventListingCard.large(
                                  hostImageUrl: "https://dummyimage.com/100x100/000/fff&text=SWC",
                                  hostName: "Students Web Committee (SWC)",
                                  views: 142,
                                  attendance: 84,
                                  tag1: "FEST",
                                  tag2: "CULTURAL",
                                  tagIcon1: TablerIcons.confetti,
                                  tagIcon2: TablerIcons.music,
                                  title: event.title,
                                  date: formattedDate,
                                  location: event.venue,
                                  type: EventCardType.user,
                                  startTime: formattedTime,
                                  endtime: formattedEnd,
                                  eventImageUrl: event.imageUrl ?? 'https://dummyimage.com/400x200/000/fff&text=Event',
                                  isSaved: event.isBookmarked,
                                  onTap: () {
                                    EventDetailsSheet.show(context, event);
                                  },
                                ),
                              );
                            },
                            childCount: filteredEvents.length,
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
