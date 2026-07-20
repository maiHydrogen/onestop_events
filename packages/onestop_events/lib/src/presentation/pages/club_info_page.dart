import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:onestop_ui/index.dart';

class ClubInfoPage extends StatefulWidget {
  const ClubInfoPage({super.key});

  @override
  State<ClubInfoPage> createState() => _ClubInfoPageState();
}

class _ClubInfoPageState extends State<ClubInfoPage> {
  int _currentStep = 0;

  // Step 1: Banner
  String? _bannerImageUrl;

  // Step 2: Details
  final _nameController = TextEditingController(text: "Students' Web Committee");
  final _locationController = TextEditingController(text: "SAC, Ground Floor, Left Side");
  final _descController = TextEditingController(
      text: "SWC is a team of enthusiasts working on core software products for the campus community.");
  final _joinController = TextEditingController();

  final List<Map<String, String>> _team = [
    {
      "name": "Alice Smith",
      "role": "Secretary",
      "imageUrl": "https://dummyimage.com/100x100/000/fff&text=Alice"
    }
  ];

  final List<Map<String, String>> _achievements = [
    {
      "title": "Best Technical Club",
      "year": "2024",
    }
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _descController.dispose();
    _joinController.dispose();
    super.dispose();
  }

  void _showAddMemberDialog() {
    final nameCtrl = TextEditingController();
    final roleCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: OColor.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: OText(
          text: "Add Team Member",
          style: OTextStyle.headingSmall.copyWith(color: OColor.gray800),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDialogField(nameCtrl, "Member Name"),
            const SizedBox(height: 12),
            _buildDialogField(roleCtrl, "Role (e.g. Web Dev)"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text("Cancel", style: TextStyle(color: OColor.gray600)),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameCtrl.text.isNotEmpty && roleCtrl.text.isNotEmpty) {
                setState(() {
                  _team.add({
                    "name": nameCtrl.text,
                    "role": roleCtrl.text,
                    "imageUrl": "https://dummyimage.com/100x100/000/fff&text=${nameCtrl.text[0]}",
                  });
                });
                Navigator.pop(ctx);
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: OColor.green600, foregroundColor: OColor.white),
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  void _showAddAchievementDialog() {
    final titleCtrl = TextEditingController();
    final yearCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: OColor.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: OText(
          text: "Add Achievement",
          style: OTextStyle.headingSmall.copyWith(color: OColor.gray800),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDialogField(titleCtrl, "Achievement Title"),
            const SizedBox(height: 12),
            _buildDialogField(yearCtrl, "Year (e.g. 2024)"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text("Cancel", style: TextStyle(color: OColor.gray600)),
          ),
          ElevatedButton(
            onPressed: () {
              if (titleCtrl.text.isNotEmpty && yearCtrl.text.isNotEmpty) {
                setState(() {
                  _achievements.add({
                    "title": titleCtrl.text,
                    "year": yearCtrl.text,
                  });
                });
                Navigator.pop(ctx);
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: OColor.green600, foregroundColor: OColor.white),
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  Widget _buildDialogField(TextEditingController ctrl, String label) {
    return TextField(
      controller: ctrl,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: OColor.gray100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OColor.gray100,
      body: Column(
        children: [
          // Header with back button + title + progress steps
          _buildHeader(),
          const Divider(height: 1, color: Color(0xFFE9E9EA)),
          // Body Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 100),
              child: _currentStep == 0 ? _buildStep1Banner() : _buildStep2Details(),
            ),
          ),
          // Sticky Bottom Buttons
          _buildStickyBar(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: OColor.white,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                      ),
                      child: Icon(TablerIcons.arrow_left, size: 24, color: OColor.gray800),
                    ),
                  ),
                  const Spacer(),
                  OText(
                    text: "Add Club Details",
                    style: OTextStyle.labelLarge.copyWith(color: OColor.gray800),
                  ),
                  const Spacer(),
                  const SizedBox(width: 40), // balance the back button
                ],
              ),
            ),
            // Progress Steps
            Padding(
              padding: const EdgeInsets.fromLTRB(60, 0, 60, 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildStepNode(0, "BANNER"),
                  Expanded(child: _buildProgressLine(completed: _currentStep >= 1)),
                  _buildStepNode(1, "DETAILS"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepNode(int step, String label) {
    final isCompleted = _currentStep > step;
    final isActive = _currentStep == step;

    return Column(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (isActive || isCompleted) ? OColor.green600 : OColor.gray200,
          ),
          child: Center(
            child: isCompleted
                ? const Icon(TablerIcons.check, size: 14, color: Colors.white)
                : Text(
                    "${step + 1}",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: (isActive || isCompleted) ? OColor.white : OColor.gray800,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: (isActive || isCompleted) ? OColor.gray800 : OColor.gray500,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildProgressLine({required bool completed}) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
        height: 2,
        decoration: BoxDecoration(
          color: completed ? OColor.green600 : OColor.gray200,
          borderRadius: BorderRadius.circular(1),
        ),
      ),
    );
  }

  // ─── Step 1: Banner ────────────────────────────────────────────────────────

  Widget _buildStep1Banner() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OText(
          text: "Upload logo of the club",
          style: OTextStyle.headingSmall.copyWith(color: OColor.gray800),
        ),
        const SizedBox(height: 4),
        OText(
          text: "Dimensions for the banner are 1080px by 1080px.",
          style: OTextStyle.bodySmall.copyWith(color: OColor.gray600),
        ),
        const SizedBox(height: 24),

        if (_bannerImageUrl != null)
          _buildImageUploadedRow()
        else
          _buildAddPhotoButton(),
      ],
    );
  }

  Widget _buildImageUploadedRow() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: OColor.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: OColor.gray200),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              _bannerImageUrl!,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 40,
                height: 40,
                color: OColor.gray200,
                child: Icon(TablerIcons.photo, color: OColor.gray500),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: OText(
              text: "Banner uploaded",
              style: OTextStyle.labelSmall.copyWith(color: OColor.gray800),
            ),
          ),
          GestureDetector(
            onTap: () => setState(() => _bannerImageUrl = null),
            child: Icon(TablerIcons.x, size: 24, color: OColor.gray600),
          ),
        ],
      ),
    );
  }

  Widget _buildAddPhotoButton() {
    return GestureDetector(
      onTap: _showBannerUrlInput,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: OColor.gray300),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(TablerIcons.plus, size: 16, color: OColor.green600),
            const SizedBox(width: 4),
            OText(
              text: "Add Photo",
              style: OTextStyle.labelSmall.copyWith(color: OColor.green600),
            ),
          ],
        ),
      ),
    );
  }

  void _showBannerUrlInput() {
    final ctrl = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: OColor.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: OText(text: "Add Banner URL", style: OTextStyle.headingSmall),
        content: _buildDialogField(ctrl, "Paste image URL here"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text("Cancel", style: TextStyle(color: OColor.gray600)),
          ),
          ElevatedButton(
            onPressed: () {
              if (ctrl.text.isNotEmpty) {
                setState(() => _bannerImageUrl = ctrl.text);
                Navigator.pop(ctx);
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: OColor.green600, foregroundColor: OColor.white),
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  // ─── Step 2: Details ───────────────────────────────────────────────────────

  Widget _buildStep2Details() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OText(
          text: "Enter Details",
          style: OTextStyle.headingSmall.copyWith(color: OColor.gray800),
        ),
        const SizedBox(height: 4),
        OText(
          text: "Every field is mandatory, make sure to double check your entries.",
          style: OTextStyle.bodySmall.copyWith(color: OColor.gray600),
        ),
        const SizedBox(height: 32),

        // Club Name (disabled – pre-filled)
        _buildFieldLabel("Club Name"),
        _buildTextField(_nameController, "Club Name", enabled: false),
        const SizedBox(height: 24),

        // Club Room Location (disabled – pre-filled)
        _buildFieldLabel("Club Room Location"),
        _buildTextField(
          _locationController,
          "e.g. New SAC, Ground Floor, Left Side – Tech Board Room",
          maxLines: 3,
          enabled: false,
        ),
        const SizedBox(height: 24),

        // Club Description
        _buildFieldLabel("Club Description"),
        _buildTextField(
          _descController,
          "Core 1, Library entrance, etc",
          maxLines: 4,
        ),
        const SizedBox(height: 32),

        // Add Team
        _buildSubSectionHeader(
          title: "Add Team",
          subtitle:
              "These members can be contacted by people for any queries or doubts about the club.",
        ),
        const SizedBox(height: 16),
        ..._team.map((m) => _buildPersonCard(
              name: m["name"]!,
              subtitle: m["role"]!,
              imageUrl: m["imageUrl"]!,
              onRemove: () => setState(() => _team.remove(m)),
            )),
        _buildAddButton("Add Team Member", onTap: _showAddMemberDialog),
        const SizedBox(height: 32),

        // Add Achievement
        _buildSubSectionHeader(
          title: "Add Achievement",
          subtitle: "Showcase your club's notable achievements and awards.",
        ),
        const SizedBox(height: 16),
        ..._achievements.map((a) => _buildAchievementCard(
              title: a["title"]!,
              year: a["year"]!,
              onRemove: () => setState(() => _achievements.remove(a)),
            )),
        _buildAddButton("Add Achievement", onTap: _showAddAchievementDialog),
        const SizedBox(height: 32),

        // How to Join
        _buildFieldLabel("How to Join?"),
        _buildTextField(
          _joinController,
          "Describe the joining process, tests, interviews, etc.",
          maxLines: 4,
        ),
      ],
    );
  }

  Widget _buildFieldLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: OText(
        text: text,
        style: OTextStyle.labelMedium.copyWith(color: OColor.gray800),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController ctrl,
    String hint, {
    int maxLines = 1,
    bool enabled = true,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: enabled ? OColor.white : OColor.gray100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: OColor.gray200),
      ),
      child: TextField(
        controller: ctrl,
        enabled: enabled,
        maxLines: maxLines,
        style: OTextStyle.bodySmall.copyWith(
          color: enabled ? OColor.gray800 : OColor.gray400,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: OTextStyle.bodySmall.copyWith(color: OColor.gray600),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(12),
        ),
      ),
    );
  }

  Widget _buildSubSectionHeader({required String title, required String subtitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OText(text: title, style: OTextStyle.labelMedium.copyWith(color: OColor.gray800)),
        const SizedBox(height: 4),
        OText(
          text: subtitle,
          style: OTextStyle.bodySmall.copyWith(color: OColor.gray600),
        ),
      ],
    );
  }

  Widget _buildPersonCard({
    required String name,
    required String subtitle,
    required String imageUrl,
    required VoidCallback onRemove,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: OColor.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: OColor.gray200),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(imageUrl),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OText(
                    text: name,
                    style: OTextStyle.labelSmall.copyWith(color: OColor.gray800),
                  ),
                  const SizedBox(height: 2),
                  OText(
                    text: subtitle,
                    style: OTextStyle.bodySmall.copyWith(color: OColor.gray600, fontSize: 12),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: onRemove,
              child: Icon(TablerIcons.x, size: 24, color: OColor.gray600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAchievementCard({
    required String title,
    required String year,
    required VoidCallback onRemove,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: OColor.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: OColor.gray200),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: OColor.gray100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(TablerIcons.medal, size: 32, color: OColor.green600),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OText(
                    text: title,
                    style: OTextStyle.labelSmall.copyWith(color: OColor.gray800),
                  ),
                  const SizedBox(height: 2),
                  OText(
                    text: year,
                    style: OTextStyle.bodySmall.copyWith(color: OColor.gray600, fontSize: 12),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: onRemove,
              child: Icon(TablerIcons.x, size: 24, color: OColor.gray600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddButton(String label, {required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: OColor.gray300),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(TablerIcons.plus, size: 16, color: OColor.green600),
            const SizedBox(width: 4),
            OText(
              text: label,
              style: OTextStyle.labelSmall.copyWith(color: OColor.green600),
            ),
          ],
        ),
      ),
    );
  }

  // ─── Sticky Bottom Bar ─────────────────────────────────────────────────────

  Widget _buildStickyBar() {
    return Container(
      color: OColor.white,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
      decoration: BoxDecoration(
        color: OColor.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            offset: const Offset(0, -4),
            blurRadius: 16,
          ),
        ],
      ),
      child: Row(
        children: [
          // Cancel / Back
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (_currentStep == 0) {
                  Navigator.pop(context);
                } else {
                  setState(() => _currentStep--);
                }
              },
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  border: Border.all(color: OColor.gray300),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _currentStep == 0 ? TablerIcons.x : TablerIcons.arrow_left,
                      size: 24,
                      color: OColor.green600,
                    ),
                    const SizedBox(width: 8),
                    OText(
                      text: _currentStep == 0 ? "Cancel" : "Back",
                      style: OTextStyle.labelMedium.copyWith(color: OColor.green600),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Next / Done
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (_currentStep == 0) {
                  setState(() => _currentStep = 1);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      content: OSnackbar(
                        type: SnackbarType.positive,
                        message: "Club info saved successfully!",
                      ),
                    ),
                  );
                  Navigator.pop(context);
                }
              },
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  color: _currentStep == 0 ? OColor.green200 : OColor.green600,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OText(
                      text: _currentStep == 0 ? "Next" : "Done",
                      style: OTextStyle.labelMedium.copyWith(color: OColor.white),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      _currentStep == 0 ? TablerIcons.arrow_right : TablerIcons.check,
                      size: 24,
                      color: OColor.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
