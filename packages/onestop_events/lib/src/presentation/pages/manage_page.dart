import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:onestop_ui/index.dart';

class ManagePage extends StatelessWidget {
  const ManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: OColor.gray100,
        appBar: AppBar(
          title: OText(
            text: "Manage Events",
            style: OTextStyle.headingSmall.copyWith(color: OColor.gray800),
          ),
          backgroundColor: OColor.white,
          elevation: 0,
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildManageCard(
              context: context,
              title: "Upload Event",
              description: "Create a new event from scratch",
              icon: TablerIcons.upload,
              route: "/admin-upload",
            ),
            const SizedBox(height: 16),
            _buildManageCard(
              context: context,
              title: "Drafts",
              description: "View and edit your saved drafts",
              icon: TablerIcons.file_text,
              route: "/manage/drafts",
            ),
            const SizedBox(height: 16),
            _buildManageCard(
              context: context,
              title: "Past Events",
              description: "View previously hosted events",
              icon: TablerIcons.history,
              route: "/manage/past-events",
            ),
            const SizedBox(height: 16),
            _buildManageCard(
              context: context,
              title: "Club Info",
              description: "Add or edit club information",
              icon: TablerIcons.users,
              route: "/manage/club-info",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildManageCard({
    required BuildContext context,
    required String title,
    required String description,
    required IconData icon,
    required String route,
  }) {
    return GestureDetector(
      onTap: () => context.push(route),
      child: Card(
        color: OColor.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(OCornerRadius.m),
          side: BorderSide(color: OColor.gray200, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: OColor.green100,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: OColor.green600, size: 28),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OText(
                      text: title,
                      style: OTextStyle.headingSmall.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    OText(
                      text: description,
                      style: OTextStyle.bodyMedium.copyWith(color: OColor.gray600),
                    ),
                  ],
                ),
              ),
              Icon(TablerIcons.chevron_right, color: OColor.gray400),
            ],
          ),
        ),
      ),
    );
  }
}

