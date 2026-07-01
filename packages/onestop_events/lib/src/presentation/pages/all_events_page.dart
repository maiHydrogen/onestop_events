import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:onestop_ui/index.dart';

import '../blocs/events/events_bloc.dart';
import '../../widgets/event_details_sheet.dart';

class AllEventsPage extends StatefulWidget {
  const AllEventsPage({super.key});

  @override
  State<AllEventsPage> createState() => _AllEventsPageState();
}

class _AllEventsPageState extends State<AllEventsPage> {
  bool _isCalendarView = false;
  late TextEditingController _searchController;
  String _searchQuery = "";

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
            icon: Icon(_isCalendarView ? TablerIcons.list : TablerIcons.calendar),
            onPressed: () {
              setState(() {
                _isCalendarView = !_isCalendarView;
              });
            },
          ),
        ],
      ),
      body: BlocBuilder<EventsBloc, EventsState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => Center(child: OText(text: message)),
            loaded: (events) {
              final filteredEvents = events.where((e) {
                return e.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
                    e.description.toLowerCase().contains(_searchQuery.toLowerCase());
              }).toList();

              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    color: OColor.white,
                    child: OSearchBar(controller: _searchController),
                  ),
                  Expanded(
                    child: _isCalendarView
                        ? const Center(child: Text("Calendar View (Placeholder)"))
                        : ListView.builder(
                            padding: const EdgeInsets.all(16),
                            itemCount: filteredEvents.length,
                            itemBuilder: (context, index) {
                              final event = filteredEvents[index];
                              final String formattedTime = "${event.startTime.hour.toString().padLeft(2, '0')}:${event.startTime.minute.toString().padLeft(2, '0')}";
                              final String formattedDate = "${event.startTime.day.toString().padLeft(2, '0')}/${event.startTime.month.toString().padLeft(2, '0')}/${event.startTime.year}";
                              final String formattedEnd = "${event.endTime.hour.toString().padLeft(2, '0')}:${event.endTime.minute.toString().padLeft(2, '0')}";

                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16),
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
}

