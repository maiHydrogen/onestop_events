import 'package:flutter/material.dart';
import 'package:onestop_ui/index.dart';

import '../../widgets/add_event_wizard.dart';

class AdminUploadPage extends StatelessWidget {
  const AdminUploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OColor.gray100,
      appBar: AppBar(
        title: OText(
          text: "Upload Event",
          style: OTextStyle.headingSmall.copyWith(color: OColor.gray800),
        ),
        backgroundColor: OColor.white,
        iconTheme: IconThemeData(color: OColor.gray800),
        elevation: 0,
      ),
      body: const AddEventWizard(),
    );
  }
}

