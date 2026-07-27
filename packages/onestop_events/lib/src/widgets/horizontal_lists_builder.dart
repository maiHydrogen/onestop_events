import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onestop_events/src/domain/models/event_model.dart';
import 'package:onestop_ui/index.dart';

Widget buildHorizontalList(BuildContext context, List<EventModel> events) {
  return SizedBox(
    height: 310, // Increased height to prevent medium event card vertical overflows
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(
        horizontal: OSpacing.l,
        vertical: OSpacing.xs,
      ),
      itemCount: events.length,
      separatorBuilder: (context, index) => const SizedBox(width: OSpacing.m),
      itemBuilder: (context, index) {
        final event = events[index];
        
        final String formattedTime = "${event.startTime.hour.toString().padLeft(2, '0')}:${event.startTime.minute.toString().padLeft(2, '0')}";
        final String formattedDate = "${event.startTime.day.toString().padLeft(2, '0')}/${event.startTime.month.toString().padLeft(2, '0')}/${event.startTime.year}";
        final String formattedEnd = "${event.endTime.hour.toString().padLeft(2, '0')}:${event.endTime.minute.toString().padLeft(2, '0')}";

        return SizedBox(
          width: 210, // Matches expected width for medium card
          child: OEventListingCard.medium(
            title: event.title,
            date: formattedDate,
            location: event.venue,
            type: EventCardType.user,
            startTime: formattedTime,
            endtime: formattedEnd,
            eventImageUrl: event.imageUrl ?? 'https://dummyimage.com/400x200/000/fff&text=Event',
            isSaved: event.isBookmarked,
            attendance: 42,
            onTap: () {
              context.push('/event-details', extra: event);
            },
          ),
        );
      },
    ),
  );
}
