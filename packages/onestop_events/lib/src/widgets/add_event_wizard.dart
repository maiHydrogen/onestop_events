import 'package:flutter/material.dart';
import 'package:onestop_ui/index.dart';

class AddEventWizard extends StatefulWidget {
  const AddEventWizard({super.key});

  @override
  State<AddEventWizard> createState() => _AddEventWizardState();
}

class _AddEventWizardState extends State<AddEventWizard> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      type: StepperType.horizontal,
      currentStep: _currentStep,
      onStepContinue: () {
        if (_currentStep < 2) {
          setState(() => _currentStep += 1);
        } else {
          // Final submit
          Navigator.pop(context);
        }
      },
      onStepCancel: () {
        if (_currentStep > 0) {
          setState(() => _currentStep -= 1);
        } else {
          Navigator.pop(context);
        }
      },
      steps: [
        Step(
          title: const Text('Details'),
          content: Column(
            children: [
              TextFormField(decoration: const InputDecoration(labelText: 'Event Title')),
              TextFormField(decoration: const InputDecoration(labelText: 'Description')),
            ],
          ),
          isActive: _currentStep >= 0,
        ),
        Step(
          title: const Text('Time & Venue'),
          content: Column(
            children: [
              TextFormField(decoration: const InputDecoration(labelText: 'Venue')),
              TextFormField(decoration: const InputDecoration(labelText: 'Date & Time')),
            ],
          ),
          isActive: _currentStep >= 1,
        ),
        Step(
          title: const Text('Extra Info'),
          content: Column(
            children: [
              TextFormField(decoration: const InputDecoration(labelText: 'Tags (comma separated)')),
              TextFormField(decoration: const InputDecoration(labelText: 'POCs')),
            ],
          ),
          isActive: _currentStep >= 2,
        ),
      ],
    );
  }
}
