import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:onestop_events/src/widgets/event_buttons.dart';
import 'package:onestop_events/src/widgets/events_header.dart';
import 'package:onestop_ui/index.dart';

import '../../widgets/horizontal_lists_builder.dart';
import '../../widgets/event_details_sheet.dart';
import '../../widgets/paginated_list_view.dart';
import '../blocs/events/events_bloc.dart';
import '../../core/di/injection_container.dart';
import '../../core/models/admin_flag.dart';

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

  void _showErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: OSnackbar(
            type: SnackbarType.negative,
            message: message,
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: OColor.gray100,
        body: BlocConsumer<EventsBloc, EventsState>(
          listener: (context, state) {
            state.whenOrNull(
              error: (message) => _showErrorSnackbar(context, message),
              loaded: (events, page, hasReachedMax, isLoadingMore, loadMoreError) {
                if (loadMoreError != null) {
                  _showErrorSnackbar(context, loadMoreError);
                }
              },
            );
          },
          builder: (context, state) {
            return state.when(
              initial: () => const Center(
                child: CircularProgressIndicator(),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (message) => Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(TablerIcons.wifi_off, color: OColor.gray400, size: 48),
                    const SizedBox(height: 16),
                    OText(
                      text: message,
                      style: OTextStyle.bodyLarge.copyWith(color: OColor.gray600),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () => context
                          .read<EventsBloc>()
                          .add(const EventsEvent.fetchEvents()),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        decoration: BoxDecoration(
                          color: OColor.green600,
                          borderRadius: BorderRadius.circular(OCornerRadius.m),
                        ),
                        child: OText(
                          text: 'Retry',
                          style: OTextStyle.labelMedium.copyWith(color: OColor.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              loaded: (events, currentPage, hasReachedMax, isLoadingMore, loadMoreError) {
                final now = DateTime.now();
                final futureEvents =
                    events.where((e) => e.endTime.isAfter(now)).toList();
                final pastEvents =
                    events.where((e) => e.endTime.isBefore(now)).toList();

                final todayEvents = futureEvents.where((e) {
                  return e.startTime.year == now.year &&
                      e.startTime.month == now.month &&
                      e.startTime.day == now.day;
                }).toList();

                final todaySectionEvents =
                    todayEvents.isNotEmpty ? todayEvents : futureEvents;
                final trendingSectionEvents =
                    futureEvents.where((e) => e.isBookmarked).toList().isNotEmpty
                        ? futureEvents.where((e) => e.isBookmarked).toList()
                        : futureEvents;
                final attendedEvents = pastEvents;

                // Filter for search
                final filteredEvents = events.where((event) {
                  return event.title
                          .toLowerCase()
                          .contains(_searchQuery.toLowerCase()) ||
                      event.description
                          .toLowerCase()
                          .contains(_searchQuery.toLowerCase());
                }).toList();

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
                          OSearchBar(controller: _searchController),
                          const SizedBox(height: OSpacing.xs),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(
                              horizontal: OSpacing.xs,
                            ),
                            child: ListenableBuilder(
                              listenable: sl<AdminFlag>(),
                              builder: (context, _) {
                                final isAdmin = sl<AdminFlag>().isAdmin;
                                return Row(
                                  children: [
                                    AllEventsButton(
                                      onPressed: () {
                                        context.push('/all-events');
                                      },
                                      eventNumber: events.length.toString(),
                                    ),
                                    const SizedBox(width: OSpacing.s),
                                    SavedEventsButton(
                                      onPressed: () {
                                        context.push('/saved-events');
                                      },
                                    ),
                                    if (isAdmin) ...[
                                      const SizedBox(width: OSpacing.s),
                                      TertiaryButton(
                                        label: "Upload",
                                        onPressed: () =>
                                            context.push('/admin-upload'),
                                        leadingIcon: TablerIcons.plus,
                                        iconColor: OColor.green600,
                                      ),
                                    ],
                                  ],
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: OSpacing.m),
                        ],
                      ),
                    ),

                    if (_searchQuery.isEmpty) ...[
                      // --- HAPPENING TODAY ---
                      const SliverToBoxAdapter(
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
                        child: buildHorizontalList(
                            context, trendingSectionEvents),
                      ),

                      // --- RECENTLY ATTENDED ---
                      const SliverToBoxAdapter(
                        child: EventsHeaderSmall(
                          heading: 'Recently Attended',
                          icon: TablerIcons.history,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: buildHorizontalList(context, attendedEvents),
                      ),
                    ],

                    // --- EXPLORE / PAGINATED LIST ---
                    SliverToBoxAdapter(
                      child: EventsHeaderSmall(
                        heading: _searchQuery.isEmpty
                            ? 'Explore'
                            : 'Search Results',
                        icon: _searchQuery.isEmpty
                            ? TablerIcons.compass
                            : TablerIcons.search,
                      ),
                    ),

                    if (filteredEvents.isEmpty)
                      const SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Center(child: Text('No events found.')),
                        ),
                      )
                    else
                      SliverToBoxAdapter(
                        child: SizedBox(
                          // Constrain height so CustomScrollView doesn't conflict
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: PaginatedListView(
                            itemCount: filteredEvents.length,
                            isLoadingMore: isLoadingMore,
                            hasReachedMax: hasReachedMax,
                            padding: const EdgeInsets.all(OSpacing.l),
                            onLoadMore: () => context
                                .read<EventsBloc>()
                                .add(const EventsEvent.loadMoreEvents()),
                            itemBuilder: (context, index) {
                              final event = filteredEvents[index];
                              final String formattedTime =
                                  "${event.startTime.hour.toString().padLeft(2, '0')}:${event.startTime.minute.toString().padLeft(2, '0')}";
                              final String formattedDate =
                                  "${event.startTime.day.toString().padLeft(2, '0')}/${event.startTime.month.toString().padLeft(2, '0')}/${event.startTime.year}";
                              final String formattedEnd =
                                  "${event.endTime.hour.toString().padLeft(2, '0')}:${event.endTime.minute.toString().padLeft(2, '0')}";

                              return Padding(
                                padding: const EdgeInsets.only(bottom: OSpacing.xs),
                                child: OEventListingCard.large(
                                  hostImageUrl:
                                      "https://dummyimage.com/100x100/000/fff&text=SWC",
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
                                  eventImageUrl: event.imageUrl ??
                                      'https://dummyimage.com/400x200/000/fff&text=Event',
                                  isSaved: event.isBookmarked,
                                  onTap: () {
                                    EventDetailsSheet.show(context, event);
                                  },
                                ),
                              );
                            },
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
