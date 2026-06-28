import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:onestop_ui/index.dart';

import '../blocs/admin/admin_bloc.dart';

class AdminUploadPage extends StatefulWidget {
  const AdminUploadPage({super.key});

  @override
  State<AdminUploadPage> createState() => _AdminUploadPageState();
}

class _AdminUploadPageState extends State<AdminUploadPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _venueController = TextEditingController();
  final _imageUrlController = TextEditingController();

  DateTime? _startTime;
  DateTime? _endTime;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _venueController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  Future<void> _pickDateTime(bool isStart) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 1)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date == null) return;

    if (!mounted) return;
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time == null) return;

    setState(() {
      final pickedDateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
      if (isStart) {
        _startTime = pickedDateTime;
      } else {
        _endTime = pickedDateTime;
      }
    });
  }

  void _submitForm() {
    context.read<AdminBloc>().add(
          AdminEvent.updateForm(
            title: _titleController.text,
            description: _descriptionController.text,
            venue: _venueController.text,
            imageUrl: _imageUrlController.text.isNotEmpty ? _imageUrlController.text : null,
            startTime: _startTime,
            endTime: _endTime,
          ),
        );

    context.read<AdminBloc>().add(const AdminEvent.submitEvent());
  }

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
      body: BlocConsumer<AdminBloc, AdminState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text("Event created successfully!"),
                  backgroundColor: OColor.green600,
                ),
              );
              context.pop();
            },
            failure: (error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(error),
                  backgroundColor: OColor.red500,
                ),
              );
            },
          );
        },
        builder: (context, state) {
          final isLoading = state.maybeWhen(
            validating: () => true,
            orElse: () => false,
          );

          return SingleChildScrollView(
            padding: EdgeInsets.all(OSpacing.m),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    color: OColor.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(OCornerRadius.m),
                      side: BorderSide(color: OColor.gray200, width: 1),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(OSpacing.m),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OText(
                            text: "Event Details",
                            style: OTextStyle.labelLarge.copyWith(
                              color: OColor.gray800,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: OSpacing.m),

                          _buildLabel("Event Title *"),
                          TextFormField(
                            controller: _titleController,
                            style: const TextStyle(fontSize: 14),
                            decoration: _buildInputDecoration("Enter event title"),
                          ),
                          const SizedBox(height: OSpacing.m),

                          _buildLabel("Description *"),
                          TextFormField(
                            controller: _descriptionController,
                            maxLines: 4,
                            style: const TextStyle(fontSize: 14),
                            decoration: _buildInputDecoration("Enter event description"),
                          ),
                          const SizedBox(height: OSpacing.m),

                          _buildLabel("Venue *"),
                          TextFormField(
                            controller: _venueController,
                            style: const TextStyle(fontSize: 14),
                            decoration: _buildInputDecoration("Enter event location/venue"),
                          ),
                          const SizedBox(height: OSpacing.m),

                          _buildLabel("Image URL (optional)"),
                          TextFormField(
                            controller: _imageUrlController,
                            style: const TextStyle(fontSize: 14),
                            decoration: _buildInputDecoration("Enter image web address"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: OSpacing.m),

                  Card(
                    color: OColor.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(OCornerRadius.m),
                      side: BorderSide(color: OColor.gray200, width: 1),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(OSpacing.m),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OText(
                            text: "Schedule *",
                            style: OTextStyle.labelLarge.copyWith(
                              color: OColor.gray800,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: OSpacing.m),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildLabel("Start Time"),
                                  OText(
                                    text: _startTime != null
                                        ? _startTime!.toString().substring(0, 16)
                                        : "Not selected",
                                    style: OTextStyle.bodyMedium.copyWith(color: OColor.gray600),
                                  ),
                                ],
                              ),
                              TertiaryButton(
                                label: "Select",
                                onPressed: () => _pickDateTime(true),
                                leadingIcon: TablerIcons.calendar,
                                iconColor: OColor.green600,
                              ),
                            ],
                          ),
                          const SizedBox(height: OSpacing.m),
                          Divider(color: OColor.gray200),
                          const SizedBox(height: OSpacing.m),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildLabel("End Time"),
                                  OText(
                                    text: _endTime != null
                                        ? _endTime!.toString().substring(0, 16)
                                        : "Not selected",
                                    style: OTextStyle.bodyMedium.copyWith(color: OColor.gray600),
                                  ),
                                ],
                              ),
                              TertiaryButton(
                                label: "Select",
                                onPressed: () => _pickDateTime(false),
                                leadingIcon: TablerIcons.calendar,
                                iconColor: OColor.green600,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: OSpacing.xl),

                  GestureDetector(
                    onTap: isLoading ? null : _submitForm,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: OSpacing.s),
                      decoration: BoxDecoration(
                        color: isLoading ? OColor.gray400 : OColor.green600,
                        borderRadius: BorderRadius.circular(OCornerRadius.m),
                      ),
                      child: Center(
                        child: isLoading
                            ? SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: OColor.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : OText(
                                text: "Upload Event",
                                style: OTextStyle.labelMedium.copyWith(color: OColor.white),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: OSpacing.xxs),
      child: OText(
        text: text,
        style: OTextStyle.labelSmall.copyWith(
          color: OColor.gray800,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: OColor.gray100,
      contentPadding: EdgeInsets.symmetric(horizontal: OSpacing.s, vertical: OSpacing.xs),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(OCornerRadius.m),
        borderSide: BorderSide.none,
      ),
    );
  }
}
