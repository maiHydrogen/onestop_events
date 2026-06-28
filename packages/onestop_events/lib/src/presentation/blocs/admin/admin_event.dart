part of 'admin_bloc.dart';

@freezed
class AdminEvent with _$AdminEvent {
  const factory AdminEvent.updateForm({
    String? title,
    String? description,
    DateTime? startTime,
    DateTime? endTime,
    String? venue,
    String? imageUrl,
  }) = _UpdateForm;

  const factory AdminEvent.submitEvent() = _SubmitEvent;
}
