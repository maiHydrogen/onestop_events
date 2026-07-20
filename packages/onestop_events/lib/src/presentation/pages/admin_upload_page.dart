import 'package:flutter/material.dart';
import 'package:onestop_ui/index.dart';

import '../../widgets/add_event_wizard.dart';

class AdminUploadPage extends StatelessWidget {
  const AdminUploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OColor.gray100,
      body: SafeArea(child: const AddEventWizard()),
    );
  }
}
