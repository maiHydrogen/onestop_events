import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:onestop_ui/index.dart';

import '../blocs/events/events_bloc.dart';
import '../../widgets/event_details_sheet.dart';
import '../../widgets/paginated_list_view.dart';

class AllEventsPage extends StatefulWidget {
  const AllEventsPage({super.key});

  @override
  State<AllEventsPage> createState() => _AllEventsPageState();
}

class _AllEventsPageState extends State<AllEventsPage> {
  bool _isCalendarView = false;
  late TextEditingController _searchController;
  String _searchQuery = "";
  DateTime _selectedCalendarDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
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
    return Scaffold(
      backgroundColor: OColor.gray100,
      appBar: AppBar(
        title: OText(
          text: "All Events",
          style: OTextStyle.headingSmall.copyWith(color: OColor.gray800),
        ),
        backgroundColor: OColor.white,
        iconTheme: IconThemeData(color: OColor.gray800),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
                _isCalendarView ? TablerIcons.list : TablerIcons.calendar),
            onPressed: () {
              setState(() {
                _isCalendarView = !_isCalendarView;
              });
            },
          ),
        ],
      ),
      body: BlocConsumer<EventsBloc, EventsState>(
        listenWhen: (previous, current) {
          final prevError = previous.maybeWhen(
            loaded: (_, __, ___, ____, err) => err,
            error: (err) => err,
            orElse: () => null,
          );
          final currError = current.maybeWhen(
            loaded: (_, __, ___, ____, err) => err,
            error: (err) => err,
            orElse: () => null,
          );
          return currError != null && currError != prevError;
        },
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
            initial: () => Center(child: CircularProgressIndicator(color: OColor.green600)),
            loading: () => Center(child: CircularProgressIndicator(color: OColor.green600)),
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
              final filteredEvents = events.where((e) {
                if (_isCalendarView) {
                  return e.startTime.year == _selectedCalendarDate.year &&
                         e.startTime.month == _selectedCalendarDate.month &&
                         e.startTime.day == _selectedCalendarDate.day;
                }
                return e.title
                        .toLowerCase()
                        .contains(_searchQuery.toLowerCase()) ||
                    e.description
                        .toLowerCase()
                        .contains(_searchQuery.toLowerCase());
              }).toList();

              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    color: OColor.white,
                    child: Column(
                      children: [
                        OSearchBar(controller: _searchController),
                        const SizedBox(height: 12),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              _buildFilterChip("Type", true),
                              const SizedBox(width: 8),
                              _buildFilterChip("Organiser", true),
                              const SizedBox(width: 8),
                              _buildFilterChip("Tech", false, onClose: () {}),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                  if (_isCalendarView)
                    Container(
                      padding: const EdgeInsets.all(16),
                      color: OColor.white,
                      child: OCalendar(
                        dateSelected: (date) {
                          setState(() {
                            _selectedCalendarDate = date;
                          });
                        },
                      ),
                    ),
                  Expanded(
                    child: filteredEvents.isEmpty
                        ? Center(
                            child: OText(
                              text: 'No events found.',
                              style: OTextStyle.bodyMedium
                                  .copyWith(color: OColor.gray500),
                            ),
                          )
                        : PaginatedListView(
                                itemCount: filteredEvents.length,
                                isLoadingMore: isLoadingMore,
                                hasReachedMax: hasReachedMax,
                                padding: const EdgeInsets.all(16),
                                onLoadMore: () => context
                                    .read<EventsBloc>()
                                    .add(const EventsEvent.loadMoreEvents()),
                                itemBuilder: (context, index) {
                                  final event = filteredEvents[index];
                                  final previousEvent = index > 0 ? filteredEvents[index - 1] : null;
                                  
                                  bool showHeader = false;
                                  String headerText = "";
                                  
                                  if (previousEvent == null || previousEvent.startTime.day != event.startTime.day || previousEvent.startTime.month != event.startTime.month) {
                                    showHeader = true;
                                    final now = DateTime.now();
                                    final tomorrow = now.add(const Duration(days: 1));
                                    
                                    if (event.startTime.year == now.year && event.startTime.month == now.month && event.startTime.day == now.day) {
                                      headerText = "Today";
                                    } else if (event.startTime.year == tomorrow.year && event.startTime.month == tomorrow.month && event.startTime.day == tomorrow.day) {
                                      headerText = "Tomorrow";
                                    } else {
                                      final String suffix;
                                      final day = event.startTime.day;
                                      if (day % 10 == 1 && day != 11) suffix = 'st';
                                      else if (day % 10 == 2 && day != 12) suffix = 'nd';
                                      else if (day % 10 == 3 && day != 13) suffix = 'rd';
                                      else suffix = 'th';
                                      
                                      const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
                                      headerText = "$day$suffix ${months[event.startTime.month - 1]}";
                                    }
                                  }
                                  
                                  final String formattedTime =
                                      "${event.startTime.hour.toString().padLeft(2, '0')}:${event.startTime.minute.toString().padLeft(2, '0')}";
                                  final String formattedDate =
                                      "${event.startTime.day.toString().padLeft(2, '0')}/${event.startTime.month.toString().padLeft(2, '0')}/${event.startTime.year}";
                                  final String formattedEnd =
                                      "${event.endTime.hour.toString().padLeft(2, '0')}:${event.endTime.minute.toString().padLeft(2, '0')}";

                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      if (showHeader)
                                        Padding(
                                          padding: const EdgeInsets.only(top: 8, bottom: 12),
                                          child: OText(
                                            text: headerText,
                                            style: OTextStyle.headingSmall.copyWith(color: OColor.gray800),
                                          ),
                                        ),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 16),
                                        child: OEventListingCard.large(
                                      hostImageUrl:
                                          "https://dummyimage.com/100x100/000/fff&text=SWC",
                                      hostName:
                                          "Students Web Committee (SWC)",
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
                                      ),
                                    ],
                                  );
                                },
                              ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isDropdown, {VoidCallback? onClose}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: OColor.gray200,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          OText(text: label, style: OTextStyle.labelMedium.copyWith(color: OColor.gray800)),
          const SizedBox(width: 4),
          Icon(isDropdown ? TablerIcons.chevron_down : TablerIcons.x, size: 16, color: OColor.gray800),
        ],
      ),
    );
  }
}
