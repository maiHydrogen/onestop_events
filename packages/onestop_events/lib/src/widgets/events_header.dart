import 'package:flutter/material.dart';
import 'package:onestop_ui/index.dart';

class EventsHeader extends StatefulWidget {
  final String date;
  const EventsHeader({super.key, required this.date});

  @override
  State<EventsHeader> createState() => _EventsHeaderState();
}

class _EventsHeaderState extends State<EventsHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(OSpacing.xs),
      child: Row(
        textBaseline: TextBaseline.alphabetic,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          OText(
            text: "Events",
            style: OTextStyle.headingLarge.copyWith(color: OColor.gray800),
          ),
          const SizedBox(width: OSpacing.s),
          OText(
            text: widget.date,
            style: OTextStyle.headingSmall.copyWith(color: OColor.green600),
          ),
        ],
      ),
    );
  }
}
