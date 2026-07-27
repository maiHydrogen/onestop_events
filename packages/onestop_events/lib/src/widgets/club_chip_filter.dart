import 'package:flutter/material.dart';
import 'package:onestop_ui/index.dart';

class ClubChipFilter extends StatelessWidget {
  final List<String> labels;
  final String selectedLabel;
  final ValueChanged<String> onSelected;

  const ClubChipFilter({
    super.key,
    required this.labels,
    required this.selectedLabel,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: OSpacing.xs),
      child: Row(
        children: labels.map((label) {
          final isSelected = label == selectedLabel;
          return Padding(
            padding: const EdgeInsets.only(right: OSpacing.xs),
            child: ChoiceChip(
              label: Text(label),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  onSelected(label);
                }
              },
              backgroundColor: OColor.white,
              selectedColor: OColor.green600,
              labelStyle: OTextStyle.bodyMedium.copyWith(
                color: isSelected ? OColor.white : OColor.gray600,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0),
                side: BorderSide(
                  color: isSelected ? OColor.green600 : OColor.gray300,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
