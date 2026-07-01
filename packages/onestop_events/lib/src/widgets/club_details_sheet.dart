import 'package:flutter/material.dart';
import 'package:onestop_events/src/domain/models/club_model.dart';
import 'package:onestop_ui/index.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class ClubDetailsSheet extends StatelessWidget {
  final ClubModel club;

  const ClubDetailsSheet({super.key, required this.club});

  static void show(BuildContext context, ClubModel club) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ClubDetailsSheet(club: club),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
        color: OColor.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          // Header with logo
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundImage: club.logoUrl != null ? NetworkImage(club.logoUrl!) : null,
                  backgroundColor: OColor.gray300,
                  child: club.logoUrl == null
                      ? Icon(TablerIcons.users, color: OColor.gray600, size: 32)
                      : null,
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
                  OText(
                    text: club.name,
                    style: OTextStyle.headingMedium.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: OColor.blue100,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      club.category.toString().split('.').last.toUpperCase(),
                      style: OTextStyle.labelSmall.copyWith(color: OColor.blue600),
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  OText(text: "About", style: OTextStyle.headingSmall.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  OText(
                    text: club.description,
                    style: OTextStyle.bodyMedium.copyWith(color: OColor.gray600),
                  ),
                  const SizedBox(height: 24),
                  
                  // Past Events mock
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OText(text: "Past Events", style: OTextStyle.headingSmall.copyWith(fontWeight: FontWeight.bold)),
                      TextButton(
                        onPressed: () {},
                        child: Text("View All", style: TextStyle(color: OColor.green600)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 200,
                          margin: const EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            color: OColor.gray100,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(child: OText(text: "Past Event ${index + 1}")),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  OText(text: "POCs", style: OTextStyle.headingSmall.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundColor: OColor.gray300,
                      child: Icon(TablerIcons.user, color: OColor.white),
                    ),
                    title: OText(text: "John Doe", style: OTextStyle.bodyMedium.copyWith(fontWeight: FontWeight.bold)),
                    subtitle: OText(text: "Secretary", style: OTextStyle.bodySmall.copyWith(color: OColor.gray500)),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(icon: Icon(TablerIcons.phone, color: OColor.gray600), onPressed: () {}),
                        IconButton(icon: Icon(TablerIcons.mail, color: OColor.gray600), onPressed: () {}),
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
}
