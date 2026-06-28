// navigation_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_bloc.freezed.dart';
// Note: We don't need 'part navigation_event.dart' if everything is in one file,
// but if they are separate, keep the part statements.

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationState(events: true, clubs: false)) {
    // Now this matches the Freezed class perfectly!
    on<NavigationChanged>((event, emit) {
      emit(NavigationState(
        events: event.tab == NavigationTab.events,
        clubs: event.tab == NavigationTab.clubs,
      ));
    });
  }
}

@freezed
class NavigationEvent with _$NavigationEvent {
  // Changed '_Changed' to 'NavigationChanged'
  const factory NavigationEvent.changed(NavigationTab tab) = NavigationChanged;
}

@freezed
class NavigationState with _$NavigationState {
  const factory NavigationState({
    required bool events,
    required bool clubs,
  }) = _NavigationState;
}

enum NavigationTab { events, clubs }