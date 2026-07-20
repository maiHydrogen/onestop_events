import 'package:flutter/material.dart';
import 'package:onestop_ui/index.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class PastEventsPage extends StatelessWidget {
  const PastEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OColor.gray100,
      appBar: AppBar(
        title: OText(
          text: "Events Attended",
          style: OTextStyle.headingSmall.copyWith(color: OColor.gray800),
        ),
        backgroundColor: OColor.white,
        iconTheme: IconThemeData(color: OColor.gray800),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildAttendedEventCard(
            context,
            "Alcheringa 2026",
            "Cultural Fest",
            "12th Mar",
            isFeedbackSubmitted: false,
          ),
          const SizedBox(height: 16),
          _buildAttendedEventCard(
            context,
            "Hackathon 2025",
            "Technical Board",
            "15th Jan",
            isFeedbackSubmitted: true,
            feedbackText: "Great event, learned a lot about Flutter and Firebase. Will definitely participate again!",
          ),
        ],
      ),
    );
  }

  Widget _buildAttendedEventCard(BuildContext context, String title, String host, String date, {required bool isFeedbackSubmitted, String? feedbackText}) {
    return Container(
      decoration: BoxDecoration(
        color: OColor.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: OColor.gray200),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: OColor.gray100,
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: NetworkImage("https://dummyimage.com/100x100/000/fff&text=Event"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OText(text: title, style: OTextStyle.headingSmall.copyWith(fontWeight: FontWeight.bold)),
                    OText(text: host, style: OTextStyle.bodySmall.copyWith(color: OColor.gray500)),
                  ],
                ),
              ),
              OText(text: date, style: OTextStyle.labelMedium.copyWith(color: OColor.gray500)),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(height: 1),
          const SizedBox(height: 16),
          if (!isFeedbackSubmitted) ...[
            OText(text: "ENJOYED THE EVENT?", style: OTextStyle.labelMedium.copyWith(color: OColor.gray500, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: OColor.green600,
                  side: BorderSide(color: OColor.green600),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text("Submit a Feedback"),
              ),
            ),
          ] else ...[
            OText(text: "YOUR FEEDBACK", style: OTextStyle.labelMedium.copyWith(color: OColor.gray500, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: OColor.gray100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(TablerIcons.quote, size: 20, color: OColor.gray400),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OText(
                      text: feedbackText ?? "",
                      style: OTextStyle.bodyMedium.copyWith(fontStyle: FontStyle.italic, color: OColor.gray600),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
