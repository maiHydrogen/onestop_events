import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:onestop_ui/index.dart';

import '../blocs/events/events_bloc.dart';
import '../../widgets/event_details_sheet.dart';

class DraftsPage extends StatelessWidget {
  const DraftsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OColor.gray100,
      appBar: AppBar(
        title: OText(
          text: "Drafts",
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
              final draftEvents = events.where((e) => e.isDraft).toList();

              if (draftEvents.isEmpty) {
                return Center(
                  child: OText(
                    text: "No drafts found.",
                    style: OTextStyle.bodyLarge.copyWith(color: OColor.gray500),
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: draftEvents.length,
                itemBuilder: (context, index) {
                  final event = draftEvents[index];
                  final String formattedTime = "${event.startTime.hour.toString().padLeft(2, '0')}:${event.startTime.minute.toString().padLeft(2, '0')}";
                  final String formattedDate = "${event.startTime.day.toString().padLeft(2, '0')}/${event.startTime.month.toString().padLeft(2, '0')}/${event.startTime.year}";
                  final String formattedEnd = "${event.endTime.hour.toString().padLeft(2, '0')}:${event.endTime.minute.toString().padLeft(2, '0')}";

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: OColor.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: OColor.gray200),
                      ),
                      child: Column(
                        children: [
                          OEventListingCard.large(
                            hostImageUrl: "https://dummyimage.com/100x100/000/fff&text=SWC",
                            hostName: "Students Web Committee (SWC)",
                            views: 0,
                            attendance: 0,
                            tag1: "DRAFT",
                            tag2: "UNPUBLISHED",
                            tagIcon1: TablerIcons.file,
                            tagIcon2: TablerIcons.cloud_off,
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
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                            child: Row(
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () {
                                      // Edit logic
                                    },
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor: OColor.green600,
                                      side: BorderSide(color: OColor.green600),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                      padding: const EdgeInsets.symmetric(vertical: 12),
                                    ),
                                    child: const Text("Edit"),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      context.read<EventsBloc>().add(EventsEvent.publishDraft(event.id));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: OColor.green600,
                                      foregroundColor: OColor.white,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                      padding: const EdgeInsets.symmetric(vertical: 12),
                                    ),
                                    child: const Text("Publish"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
