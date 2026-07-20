import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:onestop_ui/index.dart';

import '../blocs/events/events_bloc.dart';
import '../../widgets/event_details_sheet.dart';

class SavedEventsPage extends StatelessWidget {
  const SavedEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OColor.gray100,
      appBar: AppBar(
        title: OText(
          text: "Saved Events",
          style: OTextStyle.headingSmall.copyWith(color: OColor.gray800),
        ),
        backgroundColor: OColor.white,
        iconTheme: IconThemeData(color: OColor.gray800),
        elevation: 0,
      ),
      body: BlocBuilder<EventsBloc, EventsState>(
        builder: (context, state) {
          return state.when(
            initial: () => Center(child: CircularProgressIndicator(color: OColor.green600)),
            loading: () => Center(child: CircularProgressIndicator(color: OColor.green600)),
            error: (message) => Center(child: OText(text: message)),
            loaded: (events, currentPage, hasReachedMax, isLoadingMore, loadMoreError) {
              final savedEvents = events.where((e) => e.isBookmarked).toList();

              if (savedEvents.isEmpty) {
                return const Center(child: Text("No saved events yet."));
              }

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: savedEvents.length,
                itemBuilder: (context, index) {
                  final event = savedEvents[index];
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
              );
            },
          );
        },
      ),
    );
  }
}

