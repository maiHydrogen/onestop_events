import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:onestop_ui/index.dart';

class AddEventWizard extends StatefulWidget {
  const AddEventWizard({super.key});

  @override
  State<AddEventWizard> createState() => _AddEventWizardState();
}

class _AddEventWizardState extends State<AddEventWizard> {
  int _currentStep = 0;
  final int _totalSteps = 6;

  // Form Controllers & State
  final _titleController = TextEditingController();
  final _venueController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _selectedBoard = "Technical";

  DateTime? _startDate;
  TimeOfDay? _startTime;
  DateTime? _endDate;
  TimeOfDay? _endTime;
  String _selectedDuration = "1 Hr";
  bool _isCustomDuration = false;
  final _customDurationController = TextEditingController();

  final List<String> _rules = [];
  final _ruleInputController = TextEditingController();

  final List<Map<String, String>> _achievements = [];
  final List<Map<String, String>> _specialGuests = [];
  final List<Map<String, String>> _pocs = [];

  final List<String> _boards = [
    "Welfare",
    "Technical",
    "Cultural",
    "Sports",
    "Hostel Affairs",
    "SAIL",
    "SWC",
    "Academic"
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _venueController.dispose();
    _imageUrlController.dispose();
    _descriptionController.dispose();
    _customDurationController.dispose();
    _ruleInputController.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (_currentStep < _totalSteps - 1) {
      setState(() {
        _currentStep++;
      });
    }
  }

  void _prevStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  // Dialog to Add Achievement
  void _showAddAchievementDialog() {
    final titleCtrl = TextEditingController();
    final descCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: OText(text: "Add Achievement", style: OTextStyle.headingSmall.copyWith(fontWeight: FontWeight.bold)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleCtrl,
              decoration: const InputDecoration(labelText: "Achievement Title (e.g. Winner Prize)"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: descCtrl,
              decoration: const InputDecoration(labelText: "Description/Value (e.g. 5,000 INR)"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text("Cancel", style: TextStyle(color: OColor.gray500)),
          ),
          ElevatedButton(
            onPressed: () {
              if (titleCtrl.text.isNotEmpty && descCtrl.text.isNotEmpty) {
                setState(() {
                  _achievements.add({
                    "title": titleCtrl.text,
                    "description": descCtrl.text,
                  });
                });
                Navigator.pop(ctx);
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: OColor.green600, foregroundColor: Colors.white),
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  // Dialog to Add Special Guest
  void _showAddGuestDialog() {
    final nameCtrl = TextEditingController();
    final roleCtrl = TextEditingController();
    final imgCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: OText(text: "Add Special Guest", style: OTextStyle.headingSmall.copyWith(fontWeight: FontWeight.bold)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(labelText: "Guest Name"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: roleCtrl,
              decoration: const InputDecoration(labelText: "Designation/Role"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: imgCtrl,
              decoration: const InputDecoration(labelText: "Photo URL (Optional)"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text("Cancel", style: TextStyle(color: OColor.gray500)),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameCtrl.text.isNotEmpty && roleCtrl.text.isNotEmpty) {
                setState(() {
                  _specialGuests.add({
                    "name": nameCtrl.text,
                    "role": roleCtrl.text,
                    "imageUrl": imgCtrl.text,
                  });
                });
                Navigator.pop(ctx);
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: OColor.green600, foregroundColor: Colors.white),
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  // Dialog to Add POC
  void _showAddPocDialog() {
    final nameCtrl = TextEditingController();
    final roleCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();
    final emailCtrl = TextEditingController();
    final imgCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: OText(text: "Add POC", style: OTextStyle.headingSmall.copyWith(fontWeight: FontWeight.bold)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: "POC Name"),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: roleCtrl,
                decoration: const InputDecoration(labelText: "Designation (e.g. Coordinator)"),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: phoneCtrl,
                decoration: const InputDecoration(labelText: "Phone Number"),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: emailCtrl,
                decoration: const InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: imgCtrl,
                decoration: const InputDecoration(labelText: "Photo URL (Optional)"),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text("Cancel", style: TextStyle(color: OColor.gray500)),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameCtrl.text.isNotEmpty && roleCtrl.text.isNotEmpty) {
                setState(() {
                  _pocs.add({
                    "name": nameCtrl.text,
                    "role": roleCtrl.text,
                    "phone": phoneCtrl.text,
                    "email": emailCtrl.text,
                    "imageUrl": imgCtrl.text,
                  });
                });
                Navigator.pop(ctx);
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: OColor.green600, foregroundColor: Colors.white),
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  Future<void> _pickDate(bool isStart) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 30)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  Future<void> _pickTime(bool isStart) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _startTime = picked;
        } else {
          _endTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1. Step Progress Indicator
        _buildStepIndicator(),
        const Divider(height: 1),

        // 2. Step content
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: _buildCurrentStepContent(),
          ),
        ),

        // 3. Navigation Controls
        _buildNavigationControls(),
      ],
    );
  }

  Widget _buildStepIndicator() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(_totalSteps, (index) {
          final isCompleted = index < _currentStep;
          final isActive = index == _currentStep;

          return Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: isCompleted
                        ? OColor.green600
                        : isActive
                            ? OColor.green600
                            : OColor.gray200,
                    child: isCompleted
                        ? const Icon(TablerIcons.check, size: 16, color: Colors.white)
                        : Text(
                            "${index + 1}",
                            style: TextStyle(
                              color: isActive || isCompleted ? Colors.white : OColor.gray600,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _getStepTitle(index),
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                      color: isActive
                          ? OColor.green600
                          : isCompleted
                              ? OColor.green700
                              : OColor.gray500,
                    ),
                  ),
                ],
              ),
              if (index < _totalSteps - 1)
                Container(
                  width: MediaQuery.of(context).size.width * 0.04,
                  height: 2,
                  color: isCompleted ? OColor.green600 : OColor.gray200,
                  margin: const EdgeInsets.only(bottom: 12, left: 4, right: 4),
                ),
            ],
          );
        }),
      ),
    );
  }

  String _getStepTitle(int index) {
    switch (index) {
      case 0:
        return "Basic";
      case 1:
        return "Schedule";
      case 2:
        return "Details";
      case 3:
        return "Guests";
      case 4:
        return "POCs";
      case 5:
        return "Preview";
      default:
        return "";
    }
  }

  Widget _buildCurrentStepContent() {
    switch (_currentStep) {
      case 0:
        return _buildStep1Basic();
      case 1:
        return _buildStep2Schedule();
      case 2:
        return _buildStep3Details();
      case 3:
        return _buildStep4Guests();
      case 4:
        return _buildStep5POCs();
      case 5:
        return _buildStep6Preview();
      default:
        return const SizedBox();
    }
  }

  Widget _buildStep1Basic() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OText(text: "Step 1: Basic Event Details", style: OTextStyle.headingSmall.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        _buildLabel("Event Title *"),
        TextFormField(
          controller: _titleController,
          decoration: _buildInputDecoration("Enter event name"),
        ),
        const SizedBox(height: 16),
        _buildLabel("Hosting Board/Club *"),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: OColor.gray100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedBoard,
              isExpanded: true,
              items: _boards.map((b) {
                return DropdownMenuItem<String>(
                  value: b,
                  child: Text(b),
                );
              }).toList(),
              onChanged: (val) {
                if (val != null) {
                  setState(() {
                    _selectedBoard = val;
                  });
                }
              },
            ),
          ),
        ),
        const SizedBox(height: 16),
        _buildLabel("Venue *"),
        TextFormField(
          controller: _venueController,
          decoration: _buildInputDecoration("Enter building, room or online link"),
        ),
        const SizedBox(height: 16),
        _buildLabel("Cover Image URL"),
        TextFormField(
          controller: _imageUrlController,
          decoration: _buildInputDecoration("Enter image web address"),
        ),
      ],
    );
  }

  Widget _buildStep2Schedule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OText(text: "Step 2: Time & Schedule", style: OTextStyle.headingSmall.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),

        // Start Date/Time Card
        _buildScheduleCard(
          title: "Start Date & Time *",
          dateText: _startDate != null ? "${_startDate!.day}/${_startDate!.month}/${_startDate!.year}" : "Select date",
          timeText: _startTime != null ? _startTime!.format(context) : "Select time",
          onDateTap: () => _pickDate(true),
          onTimeTap: () => _pickTime(true),
        ),
        const SizedBox(height: 16),

        // End Date/Time Card
        _buildScheduleCard(
          title: "End Date & Time *",
          dateText: _endDate != null ? "${_endDate!.day}/${_endDate!.month}/${_endDate!.year}" : "Select date",
          timeText: _endTime != null ? _endTime!.format(context) : "Select time",
          onDateTap: () => _pickDate(false),
          onTimeTap: () => _pickTime(false),
        ),
        const SizedBox(height: 20),

        // Event Duration Section
        OText(text: "Event Duration", style: OTextStyle.labelMedium),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: ["1 Hr", "2 Hrs", "3 Hrs", "Custom"].map((duration) {
            return ChoiceChip(
              label: Text(duration),
              selected: _selectedDuration == duration,
              onSelected: (selected) {
                if (selected) {
                  setState(() {
                    _selectedDuration = duration;
                    _isCustomDuration = duration == "Custom";
                  });
                }
              },
              selectedColor: OColor.green100,
              checkmarkColor: OColor.green600,
              labelStyle: TextStyle(
                color: _selectedDuration == duration ? OColor.green600 : OColor.gray600,
              ),
              backgroundColor: OColor.gray100,
            );
          }).toList(),
        ),
        if (_isCustomDuration) ...[
          const SizedBox(height: 12),
          TextFormField(
            controller: _customDurationController,
            decoration: _buildInputDecoration("Enter custom duration text (e.g. 3 Days)"),
          ),
        ],
      ],
    );
  }

  Widget _buildStep3Details() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OText(text: "Step 3: Description, Rules & Prizes", style: OTextStyle.headingSmall.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        _buildLabel("Event Description *"),
        TextFormField(
          controller: _descriptionController,
          maxLines: 5,
          decoration: _buildInputDecoration("Enter details, overview, eligibility..."),
        ),
        const SizedBox(height: 20),

        // Rules Section
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildLabel("Rules & Guidelines"),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _ruleInputController,
                decoration: _buildInputDecoration("Enter rule and press Add"),
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: Icon(TablerIcons.plus, color: OColor.green600),
              onPressed: () {
                if (_ruleInputController.text.isNotEmpty) {
                  setState(() {
                    _rules.add(_ruleInputController.text);
                    _ruleInputController.clear();
                  });
                }
              },
            ),
          ],
        ),
        if (_rules.isNotEmpty) ...[
          const SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _rules.length,
            itemBuilder: (ctx, idx) => ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(radius: 4, backgroundColor: OColor.green600),
              title: Text(_rules[idx]),
              trailing: IconButton(
                icon: const Icon(TablerIcons.trash, size: 18, color: Colors.red),
                onPressed: () => setState(() => _rules.removeAt(idx)),
              ),
            ),
          ),
        ],
        const SizedBox(height: 24),

        // Achievements Section
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildLabel("Achievements / Prizes"),
            TextButton.icon(
              onPressed: _showAddAchievementDialog,
              icon: const Icon(TablerIcons.plus, size: 16),
              label: const Text("Add Prize"),
              style: TextButton.styleFrom(foregroundColor: OColor.green600),
            ),
          ],
        ),
        if (_achievements.isNotEmpty)
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _achievements.length,
            itemBuilder: (ctx, idx) {
              final ach = _achievements[idx];
              return Card(
                color: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: OColor.gray200),
                ),
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: Icon(TablerIcons.trophy, color: Colors.orange[400]),
                  title: Text(ach["title"] ?? "", style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(ach["description"] ?? ""),
                  trailing: IconButton(
                    icon: const Icon(TablerIcons.trash, size: 18, color: Colors.red),
                    onPressed: () => setState(() => _achievements.removeAt(idx)),
                  ),
                ),
              );
            },
          ),
      ],
    );
  }

  Widget _buildStep4Guests() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OText(text: "Step 4: Special Guests", style: OTextStyle.headingSmall.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text("Highlight speakers, executives or judges.", style: TextStyle(color: OColor.gray500)),
        const SizedBox(height: 20),
        Center(
          child: ElevatedButton.icon(
            onPressed: _showAddGuestDialog,
            icon: const Icon(TablerIcons.plus),
            label: const Text("Add Special Guest"),
            style: ElevatedButton.styleFrom(
              backgroundColor: OColor.green600,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ),
        const SizedBox(height: 24),
        if (_specialGuests.isNotEmpty) ...[
          _buildLabel("Added Guests"),
          const SizedBox(height: 8),
          SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _specialGuests.length,
              itemBuilder: (ctx, idx) {
                final guest = _specialGuests[idx];
                final img = guest["imageUrl"] != null && guest["imageUrl"]!.isNotEmpty
                    ? guest["imageUrl"]!
                    : "https://dummyimage.com/100x100/000/fff&text=Guest";

                return Container(
                  width: 140,
                  margin: const EdgeInsets.only(right: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: OColor.gray200),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 36,
                        backgroundImage: NetworkImage(img),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        guest["name"] ?? "",
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        guest["role"] ?? "",
                        style: TextStyle(color: OColor.gray500, fontSize: 10),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => setState(() => _specialGuests.removeAt(idx)),
                        child: const Icon(TablerIcons.trash, size: 16, color: Colors.red),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildStep5POCs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OText(text: "Step 5: Points of Contact (POCs)", style: OTextStyle.headingSmall.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text("Provide contact details of event organizers.", style: TextStyle(color: OColor.gray500)),
        const SizedBox(height: 20),
        Center(
          child: ElevatedButton.icon(
            onPressed: _showAddPocDialog,
            icon: const Icon(TablerIcons.plus),
            label: const Text("Add Contact Person"),
            style: ElevatedButton.styleFrom(
              backgroundColor: OColor.green600,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ),
        const SizedBox(height: 24),
        if (_pocs.isNotEmpty) ...[
          _buildLabel("Contact List"),
          const SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _pocs.length,
            itemBuilder: (ctx, idx) {
              final poc = _pocs[idx];
              final img = poc["imageUrl"] != null && poc["imageUrl"]!.isNotEmpty
                  ? poc["imageUrl"]!
                  : "https://dummyimage.com/100x100/000/fff&text=POC";

              return Card(
                color: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: OColor.gray200),
                ),
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(img),
                  ),
                  title: Text(poc["name"] ?? "", style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text("${poc["role"] ?? ""} · ${poc["phone"] ?? ""}"),
                  trailing: IconButton(
                    icon: const Icon(TablerIcons.trash, color: Colors.red),
                    onPressed: () => setState(() => _pocs.removeAt(idx)),
                  ),
                ),
              );
            },
          ),
        ],
      ],
    );
  }

  Widget _buildStep6Preview() {
    final title = _titleController.text.isNotEmpty ? _titleController.text : "Untitled Event";
    final venue = _venueController.text.isNotEmpty ? _venueController.text : "No venue specified";
    final desc = _descriptionController.text.isNotEmpty ? _descriptionController.text : "No description provided.";
    final coverImg = _imageUrlController.text.isNotEmpty ? _imageUrlController.text : "https://dummyimage.com/400x200/000/fff&text=Preview";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OText(text: "Step 6: Preview & Publish", style: OTextStyle.headingSmall.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text("Confirm if everything looks correct.", style: TextStyle(color: OColor.gray500)),
        const SizedBox(height: 20),

        // Event Card Style Preview
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: OColor.gray200),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.network(
                  coverImg,
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: OColor.blue100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        _selectedBoard.toUpperCase(),
                        style: TextStyle(color: OColor.blue600, fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 8),
                    OText(text: title, style: OTextStyle.headingSmall.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(TablerIcons.map_pin, size: 16, color: OColor.gray500),
                        const SizedBox(width: 4),
                        Expanded(child: Text(venue, style: TextStyle(color: OColor.gray600))),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(TablerIcons.calendar, size: 16, color: OColor.gray500),
                        const SizedBox(width: 4),
                        Text(
                          _isCustomDuration && _customDurationController.text.isNotEmpty
                              ? _customDurationController.text
                              : "${_startDate?.day ?? ''}/${_startDate?.month ?? ''} - ${_endDate?.day ?? ''}/${_endDate?.month ?? ''}",
                          style: TextStyle(color: OColor.gray600),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Divider(),
                    const SizedBox(height: 8),
                    Text(desc, maxLines: 3, overflow: TextOverflow.ellipsis, style: TextStyle(color: OColor.gray700)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: OColor.gray100,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }

  Widget _buildScheduleCard({
    required String title,
    required String dateText,
    required String timeText,
    required VoidCallback onDateTap,
    required VoidCallback onTimeTap,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: OColor.gray200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLabel(title),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: onDateTap,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      color: OColor.gray100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(dateText, style: TextStyle(color: OColor.gray700)),
                        Icon(TablerIcons.calendar, color: OColor.gray500),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: InkWell(
                  onTap: onTimeTap,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      color: OColor.gray100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(timeText, style: TextStyle(color: OColor.gray700)),
                        Icon(TablerIcons.clock, color: OColor.gray500),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationControls() {
    final isLastStep = _currentStep == _totalSteps - 1;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: const Offset(0, -4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (_currentStep > 0)
            OutlinedButton(
              onPressed: _prevStep,
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                side: BorderSide(color: OColor.green600),
                foregroundColor: OColor.green600,
              ),
              child: const Text("Back"),
            )
          else
            const SizedBox(),
          ElevatedButton(
            onPressed: isLastStep ? () => Navigator.pop(context) : _nextStep,
            style: ElevatedButton.styleFrom(
              backgroundColor: OColor.green600,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: Text(isLastStep ? "Publish Event" : "Next"),
          ),
        ],
      ),
    );
  }
}
