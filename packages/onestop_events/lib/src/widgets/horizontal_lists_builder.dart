import 'package:flutter/material.dart';
import 'package:onestop_events/src/domain/models/event_model.dart';
import 'package:onestop_ui/index.dart';
// --- HELPER METHOD FOR HORIZONTAL LISTS ---
// This keeps your slivers clean and reusable.

Widget buildHorizontalList(List<EventModel> events) {
  return SizedBox(
    height: 280, // CRITICAL: Horizontal lists must have a constrained height
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
        // Wrap the card in a SizedBox so it doesn't stretch infinitely horizontally
        return SizedBox(
          width: 300, // Fixed width for horizontal cards
          child: OEventListingCard.medium(
            title: event.title,
            date: event.startTime.toString(),
            location: event.venue,
            type: EventCardType.user,
            startTime: '',
            eventImageUrl: event.imageUrl ?? '',
          ),
        );
      },
    ),
  );
}