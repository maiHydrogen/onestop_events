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
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
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
                  // Image and CTAs
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: AspectRatio(
                      aspectRatio: 358 / 201,
                      child: Image.network(
                        event.imageUrl ?? 'https://dummyimage.com/400x200/000/fff&text=Event',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  if (!isAdmin)
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              context.read<EventsBloc>().add(EventsEvent.toggleRegister(event.id));
                            },
                            icon: const Icon(TablerIcons.edit, size: 16),
                            label: Text(event.isRegistered ? "Registered" : "Register"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: event.isRegistered ? OColor.white : OColor.green600,
                              foregroundColor: event.isRegistered ? OColor.green600 : OColor.white,
                              side: event.isRegistered ? BorderSide(color: OColor.green600) : BorderSide.none,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {
                              context.read<EventsBloc>().add(EventsEvent.toggleBookmark(event.id));
                            },
                            icon: const Icon(TablerIcons.heart_plus, size: 16),
                            label: Text(event.isBookmarked ? "Interested" : "I'm Interested"),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: OColor.green600,
                              side: BorderSide(color: OColor.gray300),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (!isAdmin) const SizedBox(height: 16),
                  
                  // Feedback row
                  if (event.endTime.isBefore(DateTime.now())) ...[
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
                  ],

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
                      _buildTag("TAG 1", OColor.blue600),
                      const SizedBox(width: 8),
                      _buildTag("TAG 2", OColor.green600),
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
                      Icon(TablerIcons.clock, size: 20, color: OColor.gray500),
                      const SizedBox(width: 8),
                      Expanded(
                        child: OText(text: formattedDate, style: OTextStyle.bodyMedium),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  
                  // Special Guest (Conditional)
                  OText(text: "Special Guest", style: OTextStyle.bodySmall.copyWith(fontWeight: FontWeight.w500, color: OColor.gray600)),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 90,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildPersonCard("Nikhil Kamat", "Co Founder, Zerodha"),
                        _buildPersonCard("Nikhil Kamat", "Co Founder, Zerodha"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Description
                  OText(text: "Description", style: OTextStyle.bodySmall.copyWith(fontWeight: FontWeight.w500, color: OColor.gray600)),
                  const SizedBox(height: 4),
                  OText(text: event.description, style: OTextStyle.bodyMedium.copyWith(color: OColor.gray800)),
                  const SizedBox(height: 24),
                  
                  // Posted By
                  const Divider(),
                  const SizedBox(height: 12),
                  OText(text: "Posted By", style: OTextStyle.bodySmall.copyWith(fontWeight: FontWeight.w500, color: OColor.gray600)),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: OColor.gray300,
                        child: Icon(TablerIcons.users, color: OColor.white),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OText(text: "Students' Web Committee", style: OTextStyle.bodySmall.copyWith(fontWeight: FontWeight.w500, color: OColor.gray800)),
                          OText(text: "Club, Technical Board", style: OTextStyle.bodySmall.copyWith(fontSize: 12, color: OColor.gray600)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  
                  // POCs
                  OText(text: "POCs", style: OTextStyle.bodySmall.copyWith(fontWeight: FontWeight.w500, color: OColor.gray600)),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 90,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildPersonCard("Ayush Bahuguna", "Events Head"),
                        _buildPersonCard("Ayush Bahuguna", "Events Head"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: OColor.gray100,
        borderRadius: BorderRadius.circular(9999),
      ),
      child: Text(
        text,
        style: OTextStyle.bodySmall.copyWith(fontSize: 12, fontWeight: FontWeight.w500, color: color),
      ),
    );
  }

  Widget _buildPersonCard(String name, String role) {
    return Container(
      width: 70,
      margin: const EdgeInsets.only(right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: OColor.blue100,
            child: Icon(TablerIcons.user, color: OColor.blue600),
          ),
          const SizedBox(height: 8),
          Text(name, style: OTextStyle.bodySmall.copyWith(fontWeight: FontWeight.w500, color: OColor.gray800), maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
          Text(role, style: OTextStyle.bodySmall.copyWith(fontSize: 12, color: OColor.gray600), maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
