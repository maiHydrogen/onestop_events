import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/club_model.dart';
import '../../../domain/repositories/i_clubs_repo.dart';

part 'clubs_event.dart';
part 'clubs_state.dart';
part 'clubs_bloc.freezed.dart';

class ClubsBloc extends Bloc<ClubsEvent, ClubsState> {
  final IClubsRepository _clubsRepository;

  ClubsBloc({required IClubsRepository clubsRepository})
      : _clubsRepository = clubsRepository,
        super(const ClubsState.initial()) {
    on<_FetchClubs>(_onFetchClubs);
  }

  Future<void> _onFetchClubs(
    _FetchClubs event,
    Emitter<ClubsState> emit,
  ) async {
    emit(const ClubsState.loading());
    try {
      final clubs = await _clubsRepository.getClubs();
      emit(ClubsState.loaded(clubs));
    } catch (e) {
      emit(ClubsState.error('Failed to fetch clubs: ${e.toString()}'));
    }
  }
}
