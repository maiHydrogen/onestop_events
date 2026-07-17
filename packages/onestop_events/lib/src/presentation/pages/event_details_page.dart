import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:onestop_events/src/domain/models/event_model.dart';
import 'package:onestop_ui/index.dart';

import '../blocs/events/events_bloc.dart';

class EventDetailsPage extends StatefulWidget {
  final EventModel event;

  const EventDetailsPage({super.key, required this.event});

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  double _rating = 0;
  final TextEditingController _feedbackController = TextEditingController();

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OColor.gray100,
      appBar: AppBar(
        title: OText(
          text: "Event Details",
          style: OTextStyle.headingSmall.copyWith(color: OColor.gray800),
        ),
        backgroundColor: OColor.white,
        iconTheme: IconThemeData(color: OColor.gray800),
        elevation: 0,
      ),
      body: BlocBuilder<EventsBloc, EventsState>(
        builder: (context, state) {
          // Sync with latest block state to show toggle instantly
          final latestEvent = state.maybeWhen(
            loaded: (events, currentPage, hasReachedMax, isLoadingMore, loadMoreError) =>
                events.firstWhere(
              (e) => e.id == widget.event.id,
              orElse: () => widget.event,
            ),
            orElse: () => widget.event,
          );

          final String formattedTime = "${latestEvent.startTime.hour.toString().padLeft(2, '0')}:${latestEvent.startTime.minute.toString().padLeft(2, '0')}";
          final String formattedDate = "${latestEvent.startTime.day.toString().padLeft(2, '0')}/${latestEvent.startTime.month.toString().padLeft(2, '0')}/${latestEvent.startTime.year}";
          final String formattedEnd = "${latestEvent.endTime.hour.toString().padLeft(2, '0')}:${latestEvent.endTime.minute.toString().padLeft(2, '0')}";

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Event image header
                Container(
                  height: 220,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: OColor.gray400,
                    image: DecorationImage(
                      image: NetworkImage(latestEvent.imageUrl ?? 'https://dummyimage.com/600x300/000/fff&text=Event'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Main Info Card
                Card(
                  color: OColor.white,
                  elevation: 0,
                  margin: const EdgeInsets.all(OSpacing.m),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(OCornerRadius.m),
                    side: BorderSide(color: OColor.gray200, width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(OSpacing.m),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OText(
                          text: latestEvent.title,
                          style: OTextStyle.headingMedium.copyWith(
                            color: OColor.gray800,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: OSpacing.s),
                        Row(
                          children: [
                            Icon(TablerIcons.calendar_event, color: OColor.gray600, size: 20),
                            const SizedBox(width: OSpacing.s),
                            OText(
                              text: "$formattedDate, $formattedTime - $formattedEnd",
                              style: OTextStyle.bodyMedium.copyWith(color: OColor.gray600),
                            ),
                          ],
                        ),
                        const SizedBox(height: OSpacing.xs),
                        Row(
                          children: [
                            Icon(TablerIcons.map_pin, color: OColor.gray600, size: 20),
                            const SizedBox(width: OSpacing.s),
                            OText(
                              text: latestEvent.venue,
                              style: OTextStyle.bodyMedium.copyWith(color: OColor.gray600),
                            ),
                          ],
                        ),
                        const SizedBox(height: OSpacing.m),
                        Divider(color: OColor.gray200),
                        const SizedBox(height: OSpacing.m),
                        OText(
                          text: "About Event",
                          style: OTextStyle.labelLarge.copyWith(
                            color: OColor.gray800,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: OSpacing.s),
                        OText(
                          text: latestEvent.description,
                          style: OTextStyle.bodyMedium.copyWith(color: OColor.gray600),
                        ),
                        const SizedBox(height: OSpacing.l),

                        // Bookmark Action Button
                        GestureDetector(
                          onTap: () {
                            context.read<EventsBloc>().add(
                                  EventsEvent.toggleBookmark(latestEvent.id),
                                );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: OSpacing.s),
                            decoration: BoxDecoration(
                              color: latestEvent.isBookmarked ? OColor.red500 : OColor.green600,
                              borderRadius: BorderRadius.circular(OCornerRadius.m),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  latestEvent.isBookmarked ? TablerIcons.heart_off : TablerIcons.heart,
                                  color: OColor.white,
                                  size: 20,
                                ),
                                const SizedBox(width: OSpacing.s),
                                OText(
                                  text: latestEvent.isBookmarked ? "Saved (Remove)" : "Save Event",
                                  style: OTextStyle.labelMedium.copyWith(color: OColor.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Feedback submission Card
                Card(
                  color: OColor.white,
                  elevation: 0,
                  margin: const EdgeInsets.only(left: OSpacing.m, right: OSpacing.m, bottom: OSpacing.m),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(OCornerRadius.m),
                    side: BorderSide(color: OColor.gray200, width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(OSpacing.m),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OText(
                          text: "Event Feedback",
                          style: OTextStyle.labelLarge.copyWith(
                            color: OColor.gray800,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: OSpacing.xs),
                        OText(
                          text: "Share your experience about this event.",
                          style: OTextStyle.bodySmall.copyWith(color: OColor.gray600),
                        ),
                        const SizedBox(height: OSpacing.m),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (index) {
                            final double starIndex = index + 1.0;
                            return IconButton(
                              icon: Icon(
                                starIndex <= _rating
                                    ? TablerIcons.star_filled
                                    : TablerIcons.star,
                                color: Colors.amber,
                                size: 28,
                              ),
                              onPressed: () {
                                setState(() {
                                  _rating = starIndex;
                                });
                              },
                            );
                          }),
                        ),
                        const SizedBox(height: OSpacing.s),
                        TextField(
                          controller: _feedbackController,
                          maxLines: 3,
                          style: const TextStyle(fontSize: 14),
                          decoration: InputDecoration(
                            hintText: "Tell us more details (optional)...",
                            filled: true,
                            fillColor: OColor.gray100,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(OCornerRadius.m),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: OSpacing.m),
                        GestureDetector(
                          onTap: () {
                            if (_rating == 0) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text('Please select a star rating.'),
                                  backgroundColor: OColor.red500,
                                ),
                              );
                              return;
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('Thank you! Feedback submitted successfully.'),
                                backgroundColor: OColor.green600,
                              ),
                            );
                            _feedbackController.clear();
                            setState(() {
                              _rating = 0;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: OSpacing.s),
                            decoration: BoxDecoration(
                              color: OColor.blue600,
                              borderRadius: BorderRadius.circular(OCornerRadius.m),
                            ),
                            child: Center(
                              child: OText(
                                text: "Submit Feedback",
                                style: OTextStyle.labelMedium.copyWith(color: OColor.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
