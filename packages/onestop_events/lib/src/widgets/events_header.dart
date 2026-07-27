import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:onestop_ui/index.dart';
import '../core/di/injection_container.dart';
import '../core/models/admin_flag.dart';

class EventsHeader extends StatefulWidget {
  final String header;
  final String date;
  const EventsHeader({super.key,required this.header, this.date=''});

  @override
  State<EventsHeader> createState() => _EventsHeaderState();
}

class _EventsHeaderState extends State<EventsHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(OSpacing.xs),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            textBaseline: TextBaseline.alphabetic,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              OText(
                text: widget.header,
                style: OTextStyle.headingLarge.copyWith(color: OColor.gray800),
              ),
              const SizedBox(width: OSpacing.s),
              OText(
                text: widget.date,
                style: OTextStyle.headingSmall.copyWith(color: OColor.green600),
              ),
            ],
          ),
          ListenableBuilder(
            listenable: sl<AdminFlag>(),
            builder: (context, _) {
              final isAdmin = sl<AdminFlag>().isAdmin;
              return IconButton(
                icon: Icon(
                  isAdmin ? TablerIcons.shield_check : TablerIcons.shield,
                  color: isAdmin ? OColor.green600 : OColor.gray400,
                ),
                tooltip: isAdmin ? "Switch to User Mode" : "Switch to Admin Mode",
                onPressed: () {
                  sl<AdminFlag>().setAdmin(!isAdmin);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class EventsHeaderSmall extends StatefulWidget {
  final String heading;
  final IconData icon;
  final String? buttonLabel;
  final IconData? buttonIcon;
  final VoidCallback? onPressed;
  const EventsHeaderSmall({
    super.key,
    required this.heading,
    required this.icon,
    this.buttonLabel,
    this.buttonIcon,
    this.onPressed,
  });

  @override
  State<EventsHeaderSmall> createState() => _EventsHeaderSmallState();
}

class _EventsHeaderSmallState extends State<EventsHeaderSmall> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(OSpacing.xs),
      child: Row(
        textBaseline: TextBaseline.alphabetic,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              Icon(widget.icon, size: 24, color: OColor.gray800),
              const SizedBox(width: OSpacing.xs),
              OText(
                text: widget.heading,
                style: OTextStyle.headingSmall.copyWith(color: OColor.gray800),
              ),
            ],
          ),
          if(widget.buttonLabel != null)
          TertiaryButton(
            label: widget.buttonLabel!,
            onPressed: widget.onPressed!,
            leadingIcon: widget.buttonIcon,
            iconColor: OColor.green600,
          ),
        ],
      ),
    );
  }
}
