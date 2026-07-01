import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:onestop_ui/index.dart';

import '../blocs/admin/admin_bloc.dart';

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

