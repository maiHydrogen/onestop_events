import 'package:flutter/material.dart';
import 'package:onestop_events/src/domain/models/event_model.dart';
import 'package:onestop_ui/index.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation/blocs/events/events_bloc.dart';
import '../core/models/admin_flag.dart';
import '../core/di/injection_container.dart';
import 'event_feedback_sheet.dart';

class EventDetailsSheet extends StatelessWidget {
  final EventModel event;

  const EventDetailsSheet({super.key, required this.event});

  static void show(BuildContext context, EventModel event) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => EventDetailsSheet(event: event),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isAdmin = sl<AdminFlag>().isAdmin;
    final size = MediaQuery.of(context).size;

    final String formattedDate = "${event.startTime.day.toString().padLeft(2, '0')} ${event.startTime.month}, ${event.startTime.hour.toString().padLeft(2, '0')}:${event.startTime.minute.toString().padLeft(2, '0')} - ${event.endTime.hour.toString().padLeft(2, '0')}:${event.endTime.minute.toString().padLeft(2, '0')}";

    return Container(
      height: size.height * 0.9,
      decoration: BoxDecoration(
        color: OColor.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: OText(
                    text: event.title,
                    style: OTextStyle.headingSmall.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  icon: const Icon(TablerIcons.x),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Stats row
                  OText(
                    text: "350 INTERESTED · 800 VIEWS · 37 FEEDBACK",
                    style: OTextStyle.labelMedium.copyWith(color: OColor.gray500),
                  ),
                  const SizedBox(height: 16),
                  
                  // Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      event.imageUrl ?? 'https://dummyimage.com/400x200/000/fff&text=Event',
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Feedback row
                  InkWell(
                    onTap: () {
                      EventFeedbackSheet.show(context, event);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OText(
                          text: "Event Feedback (56)",
                          style: OTextStyle.bodyMedium.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const Icon(TablerIcons.arrow_right, size: 20),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  if (isAdmin) ...[
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(TablerIcons.edit, size: 18),
                            label: const Text("Edit"),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: OColor.green600,
                              side: BorderSide(color: OColor.green600),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(TablerIcons.trash, size: 18),
                            label: const Text("Delete"),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: OColor.red600,
                              side: BorderSide(color: OColor.red600),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                  
                  // Tags
                  Row(
                    children: [
                      _buildTag("TAG 1"),
                      const SizedBox(width: 8),
                      _buildTag("TAG 2"),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // Venue & Time
                  Row(
                    children: [
                      Icon(TablerIcons.map_pin, size: 20, color: OColor.gray500),
                      const SizedBox(width: 8),
                      Expanded(
                        child: OText(text: event.venue, style: OTextStyle.bodyMedium),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(TablerIcons.calendar, size: 20, color: OColor.gray500),
                      const SizedBox(width: 8),
                      Expanded(
                        child: OText(text: formattedDate, style: OTextStyle.bodyMedium),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  
                  // Special Guest (Conditional)
                  OText(text: "Special Guests", style: OTextStyle.headingSmall.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 80,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildPersonCard("Elon Musk", "CEO of SpaceX"),
                        _buildPersonCard("John Doe", "Guest Speaker"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Description
                  OText(text: "Event Description", style: OTextStyle.headingSmall.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  OText(text: event.description, style: OTextStyle.bodyMedium.copyWith(color: OColor.gray600)),
                  const SizedBox(height: 24),
                  
                  // Posted By
                  const Divider(),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: OColor.gray300,
                        child: Icon(TablerIcons.users, color: OColor.white),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OText(text: "Students' Web Committee", style: OTextStyle.bodyMedium.copyWith(fontWeight: FontWeight.bold)),
                          OText(text: "Club, Technical Board", style: OTextStyle.bodySmall.copyWith(color: OColor.gray500)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  
                  // POCs
                  OText(text: "POCs", style: OTextStyle.headingSmall.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 80,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildPersonCard("Alice Smith", "Organizer"),
                        _buildPersonCard("Bob Jones", "Coordinator"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
          
          // Bottom CTA
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: OColor.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  offset: const Offset(0, -4),
                  blurRadius: 10,
                ),
              ],
            ),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.read<EventsBloc>().add(EventsEvent.toggleBookmark(event.id));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: event.isBookmarked ? OColor.white : OColor.green600,
                  foregroundColor: event.isBookmarked ? OColor.green600 : OColor.white,
                  side: BorderSide(color: OColor.green600),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(event.isBookmarked ? "Saved" : "I'm Going"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: OColor.blue100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: OTextStyle.labelMedium.copyWith(color: OColor.blue600),
      ),
    );
  }

  Widget _buildPersonCard(String name, String role) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: OColor.gray200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage('https://dummyimage.com/100x100/000/fff&text=Avatar'),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(name, style: OTextStyle.bodyMedium.copyWith(fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
                Text(role, style: OTextStyle.bodySmall.copyWith(color: OColor.gray500), maxLines: 1, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
