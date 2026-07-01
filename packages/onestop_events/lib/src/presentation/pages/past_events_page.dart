import 'package:flutter/material.dart';
import 'package:onestop_ui/index.dart';

class PastEventsPage extends StatelessWidget {
  const PastEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OColor.gray100,
      appBar: AppBar(
        title: OText(
          text: "Past Events",
          style: OTextStyle.headingSmall.copyWith(color: OColor.gray800),
        ),
        backgroundColor: OColor.white,
        iconTheme: IconThemeData(color: OColor.gray800),
        elevation: 0,
      ),
      body: Center(
        child: OText(
          text: "No past events to show.",
          style: OTextStyle.bodyLarge.copyWith(color: OColor.gray500),
        ),
      ),
    );
  }
}

