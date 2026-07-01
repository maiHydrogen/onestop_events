import 'package:flutter/material.dart';
import 'package:onestop_events/src/domain/models/event_model.dart';
import 'package:onestop_ui/index.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class EventFeedbackSheet extends StatelessWidget {
  final EventModel event;

  const EventFeedbackSheet({super.key, required this.event});

  static void show(BuildContext context, EventModel event) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => EventFeedbackSheet(event: event),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        color: OColor.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: OText(
                    text: "Event Feedback",
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
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemCount: 10, // Mock feedbacks
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: OColor.gray100,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 16,
                                backgroundColor: OColor.gray300,
                                child: Icon(TablerIcons.user, size: 16),
                              ),
                              const SizedBox(width: 8),
                              OText(
                                text: "Anonymous",
                                style: OTextStyle.bodyMedium.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: List.generate(5, (i) {
                              return Icon(
                                i < 4 ? TablerIcons.star_filled : TablerIcons.star,
                                size: 16,
                                color: Colors.orange,
                              );
                            }),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      OText(
                        text: "This event was really well organized. Loved the guest speaker session!",
                        style: OTextStyle.bodyMedium.copyWith(color: OColor.gray700),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
