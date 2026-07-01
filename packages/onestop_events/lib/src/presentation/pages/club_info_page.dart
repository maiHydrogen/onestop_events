import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:onestop_ui/index.dart';

class ClubInfoPage extends StatefulWidget {
  const ClubInfoPage({super.key});

  @override
  State<ClubInfoPage> createState() => _ClubInfoPageState();
}

class _ClubInfoPageState extends State<ClubInfoPage> {
  final _nameController = TextEditingController(text: "Students' Web Committee");
  final _descController = TextEditingController(text: "SWC is a team of enthusiasts working on core software products for the campus community.");
  final _logoUrlController = TextEditingController(text: "https://dummyimage.com/100x100/000/fff&text=SWC");
  String _selectedCategory = "Technical";

  final List<Map<String, String>> _pocs = [
    {
      "name": "Alice Smith",
      "role": "Secretary",
      "phone": "+91 9876543210",
      "email": "alice@swc.iitg.ac.in",
      "imageUrl": "https://dummyimage.com/100x100/000/fff&text=Alice"
    }
  ];

  final List<Map<String, String>> _members = [
    {
      "name": "Bob Jones",
      "role": "Core Member",
      "imageUrl": "https://dummyimage.com/100x100/000/fff&text=Bob"
    },
    {
      "name": "Charlie Brown",
      "role": "Designer",
      "imageUrl": "https://dummyimage.com/100x100/000/fff&text=Charlie"
    }
  ];

  final List<String> _categories = [
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
    _nameController.dispose();
    _descController.dispose();
    _logoUrlController.dispose();
    super.dispose();
  }

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
              TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: "Name")),
              const SizedBox(height: 12),
              TextField(controller: roleCtrl, decoration: const InputDecoration(labelText: "Role")),
              const SizedBox(height: 12),
              TextField(controller: phoneCtrl, decoration: const InputDecoration(labelText: "Phone")),
              const SizedBox(height: 12),
              TextField(controller: emailCtrl, decoration: const InputDecoration(labelText: "Email")),
              const SizedBox(height: 12),
              TextField(controller: imgCtrl, decoration: const InputDecoration(labelText: "Photo URL (Optional)")),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text("Cancel", style: TextStyle(color: OColor.gray500))),
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

  void _showAddMemberDialog() {
    final nameCtrl = TextEditingController();
    final roleCtrl = TextEditingController();
    final imgCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: OText(text: "Add Team Member", style: OTextStyle.headingSmall.copyWith(fontWeight: FontWeight.bold)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: "Member Name")),
            const SizedBox(height: 12),
            TextField(controller: roleCtrl, decoration: const InputDecoration(labelText: "Role (e.g. Web Dev)")),
            const SizedBox(height: 12),
            TextField(controller: imgCtrl, decoration: const InputDecoration(labelText: "Photo URL (Optional)")),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text("Cancel", style: TextStyle(color: OColor.gray500))),
          ElevatedButton(
            onPressed: () {
              if (nameCtrl.text.isNotEmpty && roleCtrl.text.isNotEmpty) {
                setState(() {
                  _members.add({
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OColor.gray100,
      appBar: AppBar(
        title: OText(
          text: "Edit Club Info",
          style: OTextStyle.headingSmall.copyWith(color: OColor.gray800),
        ),
        backgroundColor: OColor.white,
        iconTheme: IconThemeData(color: OColor.gray800),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section 1: Basic
            _buildSectionHeader("Basic Details"),
            const SizedBox(height: 16),
            _buildLabel("Club Name *"),
            TextFormField(
              controller: _nameController,
              decoration: _buildInputDecoration("Enter club name"),
            ),
            const SizedBox(height: 16),
            _buildLabel("Category/Board *"),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: OColor.gray100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedCategory,
                  isExpanded: true,
                  items: _categories.map((c) {
                    return DropdownMenuItem<String>(
                      value: c,
                      child: Text(c),
                    );
                  }).toList(),
                  onChanged: (val) {
                    if (val != null) {
                      setState(() {
                        _selectedCategory = val;
                      });
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildLabel("Club Description"),
            TextFormField(
              controller: _descController,
              maxLines: 4,
              decoration: _buildInputDecoration("Enter club activities, info, achievements..."),
            ),
            const SizedBox(height: 16),
            _buildLabel("Club Logo URL"),
            TextFormField(
              controller: _logoUrlController,
              decoration: _buildInputDecoration("Enter logo image link"),
            ),
            const SizedBox(height: 32),

            // Section 2: POCs
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSectionHeader("Points of Contact"),
                TextButton.icon(
                  onPressed: _showAddPocDialog,
                  icon: const Icon(TablerIcons.plus, size: 16),
                  label: const Text("Add POC"),
                  style: TextButton.styleFrom(foregroundColor: OColor.green600),
                ),
              ],
            ),
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
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: OColor.gray200),
                  ),
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: CircleAvatar(backgroundImage: NetworkImage(img)),
                    title: Text(poc["name"] ?? "", style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text("${poc["role"] ?? ""} · ${poc["phone"] ?? ""}"),
                    trailing: IconButton(
                      icon: const Icon(TablerIcons.trash, color: Colors.red, size: 18),
                      onPressed: () => setState(() => _pocs.removeAt(idx)),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 32),

            // Section 3: Members
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSectionHeader("Team Members"),
                TextButton.icon(
                  onPressed: _showAddMemberDialog,
                  icon: const Icon(TablerIcons.plus, size: 16),
                  label: const Text("Add Member"),
                  style: TextButton.styleFrom(foregroundColor: OColor.green600),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _members.length,
              itemBuilder: (ctx, idx) {
                final mem = _members[idx];
                final img = mem["imageUrl"] != null && mem["imageUrl"]!.isNotEmpty
                    ? mem["imageUrl"]!
                    : "https://dummyimage.com/100x100/000/fff&text=Member";
                return Card(
                  color: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: OColor.gray200),
                  ),
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: CircleAvatar(backgroundImage: NetworkImage(img)),
                    title: Text(mem["name"] ?? "", style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(mem["role"] ?? ""),
                    trailing: IconButton(
                      icon: const Icon(TablerIcons.trash, color: Colors.red, size: 18),
                      onPressed: () => setState(() => _members.removeAt(idx)),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 40),

            // Save Button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text("Club Info saved successfully!"),
                      backgroundColor: OColor.green600,
                    ),
                  );
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: OColor.green600,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Save Changes", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String text) {
    return Text(
      text,
      style: OTextStyle.headingSmall.copyWith(fontWeight: FontWeight.bold, color: OColor.gray800),
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
}
