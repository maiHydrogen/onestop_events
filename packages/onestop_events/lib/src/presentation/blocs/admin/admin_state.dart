part of 'admin_bloc.dart';

@freezed
class AdminState with _$AdminState {
  const factory AdminState.idle({
    @Default('') String title,
    @Default('') String description,
    DateTime? startTime,
    DateTime? endTime,
    @Default('') String venue,
    String? imageUrl,
  }) = _Idle;

  const factory AdminState.validating() = _Validating;
  const factory AdminState.success() = _Success;
  const factory AdminState.failure(String error) = _Failure;
}
