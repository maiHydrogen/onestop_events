import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_event.dart';
part 'admin_state.dart';
part 'admin_bloc.freezed.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  AdminBloc() : super(const AdminState.idle()) {
    on<_UpdateForm>(_onUpdateForm);
    on<_SubmitEvent>(_onSubmitEvent);
  }

  void _onUpdateForm(_UpdateForm event, Emitter<AdminState> emit) {
    // If not currently in Idle state, we transition to a fresh Idle state
    final currentIdle = state is _Idle
        ? state as _Idle
        : const _Idle();

    emit(currentIdle.copyWith(
      title: event.title ?? currentIdle.title,
      description: event.description ?? currentIdle.description,
      startTime: event.startTime ?? currentIdle.startTime,
      endTime: event.endTime ?? currentIdle.endTime,
      venue: event.venue ?? currentIdle.venue,
      imageUrl: event.imageUrl ?? currentIdle.imageUrl,
    ));
  }

  Future<void> _onSubmitEvent(
    _SubmitEvent event,
    Emitter<AdminState> emit,
  ) async {
    final currentIdle = state is _Idle ? state as _Idle : const _Idle();

    // 1. Validation
    if (currentIdle.title.trim().isEmpty) {
      emit(const AdminState.failure('Title cannot be empty'));
      emit(currentIdle);
      return;
    }
    if (currentIdle.description.trim().isEmpty) {
      emit(const AdminState.failure('Description cannot be empty'));
      emit(currentIdle);
      return;
    }
    if (currentIdle.venue.trim().isEmpty) {
      emit(const AdminState.failure('Venue cannot be empty'));
      emit(currentIdle);
      return;
    }
    if (currentIdle.startTime == null) {
      emit(const AdminState.failure('Start time must be specified'));
      emit(currentIdle);
      return;
    }
    if (currentIdle.endTime == null) {
      emit(const AdminState.failure('End time must be specified'));
      emit(currentIdle);
      return;
    }
    if (currentIdle.endTime!.isBefore(currentIdle.startTime!)) {
      emit(const AdminState.failure('End time must be after start time'));
      emit(currentIdle);
      return;
    }

    // 2. Submission Simulation
    emit(const AdminState.validating());
    try {
      // Simulate network request latency
      await Future.delayed(const Duration(seconds: 2));
      emit(const AdminState.success());
      // Reset back to empty idle state upon success
      emit(const AdminState.idle());
    } catch (e) {
      emit(AdminState.failure('Submission failed: ${e.toString()}'));
      emit(currentIdle);
    }
  }
}
