import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:onestop_events/src/domain/models/club_model.dart';
import 'package:onestop_events/src/widgets/events_header.dart';
import 'package:onestop_ui/index.dart';

import '../blocs/clubs/clubs_bloc.dart';

class ClubsPage extends StatefulWidget {
  const ClubsPage({super.key});

  @override
  State<ClubsPage> createState() => _ClubsPageState();
}

class _ClubsPageState extends State<ClubsPage> {
  late TextEditingController _searchController;
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text;
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: OColor.gray100,
          body: BlocBuilder<ClubsBloc, ClubsState>(
            builder: (context, state) {
              return state.when(
                initial: () => const Center(child: CircularProgressIndicator()),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (message) => Center(
                  child: OText(
                    text: message,
                    style: OTextStyle.bodyLarge.copyWith(color: OColor.blue200),
                  ),
                ),
                loaded: (clubs) {
                  return Column(
                    children: [
                      const EventsHeader(header: 'Clubs/Fests'),
                      const SizedBox(height: OSpacing.xs),
                      OSearchBar(controller: _searchController),
                      const SizedBox(height: OSpacing.xs),
                      TabBar(
                        indicatorColor: OColor.green600,
                        labelColor: OColor.green600,
                        unselectedLabelColor: OColor.gray600,
                        tabs: const [
                          Tab(text: "Technical"),
                          Tab(text: "Cultural"),
                          Tab(text: "Sports"),
                        ],
                      ),
                      const SizedBox(height: OSpacing.s),
                      Expanded(
                        child: TabBarView(
                          children: [
                            _buildClubsList(clubs, ClubCategory.technical),
                            _buildClubsList(clubs, ClubCategory.cultural),
                            _buildClubsList(clubs, ClubCategory.sports),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildClubsList(List<ClubModel> clubs, ClubCategory category) {
    final filtered = clubs.where((club) {
      final matchesCategory = club.category == category;
      final matchesSearch = club.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          club.description.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();

    if (filtered.isEmpty) {
      return const Center(
        child: Text('No clubs found in this category.'),
      );
    }

    return ListView.builder(
      itemCount: filtered.length,
      padding: const EdgeInsets.symmetric(vertical: OSpacing.xs),
      itemBuilder: (context, index) {
        final club = filtered[index];
        return Card(
          color: OColor.white,
          elevation: 0,
          margin: const EdgeInsets.symmetric(
            horizontal: OSpacing.m,
            vertical: OSpacing.xs,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(OCornerRadius.m),
            side: BorderSide(color: OColor.gray200, width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(OSpacing.m),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: club.logoUrl != null ? NetworkImage(club.logoUrl!) : null,
                  backgroundColor: OColor.gray300,
                  child: club.logoUrl == null
                      ? Icon(TablerIcons.users, color: OColor.gray600)
                      : null,
                ),
                const SizedBox(width: OSpacing.m),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OText(
                        text: club.name,
                        style: OTextStyle.bodyLarge.copyWith(
                          color: OColor.gray800,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: OSpacing.xxs),
                      OText(
                        text: club.description,
                        style: OTextStyle.bodySmall.copyWith(color: OColor.gray600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
