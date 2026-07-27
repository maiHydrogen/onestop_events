import 'package:flutter/material.dart';
import 'package:onestop_ui/index.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class AllEventsButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String eventNumber;
  const AllEventsButton({
    super.key,
    required this.onPressed,
    this.eventNumber = '0',
  });

  @override
  State<AllEventsButton> createState() => _AllEventsButtonState();
}

class _AllEventsButtonState extends State<AllEventsButton> {
  bool _isPressed = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) {
        setState(() => _isPressed = true);
        widget.onPressed;
      },
      onTapUp: (_) {
        setState(() => _isPressed = false);
      },
      child: Container(
        decoration: BoxDecoration(
          color: _isPressed ? OColor.gray200 : OColor.white,
          borderRadius: BorderRadius.circular(OCornerRadius.m),
          border: Border.all(color: OColor.gray200),
        ),
        padding: const EdgeInsets.all(OSpacing.s),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(TablerIcons.list_details, color: OColor.green600, size: 16,),
            const SizedBox(width: OSpacing.xs),
            OText(
              text: "All Events",
              style: OTextStyle.labelMedium.copyWith(color: OColor.gray800),
            ),
            const SizedBox(width: OSpacing.xs),
            OTag(type: TagType.accentColor, label: widget.eventNumber),
          ],
        ),
      ),
    );
  }
}

class SavedEventsButton extends StatefulWidget {
  final VoidCallback? onPressed;
  const SavedEventsButton({super.key, required this.onPressed});

  @override
  State<SavedEventsButton> createState() => _SavedEventsButtonState();
}

class _SavedEventsButtonState extends State<SavedEventsButton> {
  bool _isPressed = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) {
        setState(() => _isPressed = true);
        widget.onPressed;
      },
      onTapUp: (_) {
        setState(() => _isPressed = false);
      },
      child: Container(
        decoration: BoxDecoration(
          color: _isPressed ? OColor.gray200 : OColor.white,
          borderRadius: BorderRadius.circular(OCornerRadius.m),
          border: Border.all(color: OColor.gray200),
        ),
        padding: const EdgeInsets.all(OSpacing.s),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(TablerIcons.heart_plus, color: OColor.green600,size: 16,),
            const SizedBox(width: OSpacing.xs),
            OText(
              text: "Saved Events",
              style: OTextStyle.labelMedium.copyWith(color: OColor.gray800),
            ),
          ],
        ),
      ),
    );
  }
}
