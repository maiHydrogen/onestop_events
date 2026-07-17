import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/club_model.dart';
import '../../../domain/repositories/i_clubs_repo.dart';

part 'clubs_event.dart';
part 'clubs_state.dart';
part 'clubs_bloc.freezed.dart';

class ClubsBloc extends Bloc<ClubsEvent, ClubsState> {
  final IClubsRepository _clubsRepository;
  static const int _pageSize = 20;

  ClubsBloc({required IClubsRepository clubsRepository})
      : _clubsRepository = clubsRepository,
        super(const ClubsState.initial()) {
    on<_FetchClubs>(_onFetchClubs);
    on<_LoadMoreClubs>(_onLoadMoreClubs);
  }

  Future<void> _onFetchClubs(
    _FetchClubs event,
    Emitter<ClubsState> emit,
  ) async {
    emit(const ClubsState.loading());
    try {
      final clubs = await _clubsRepository.getClubs(page: 1, limit: _pageSize);
      final hasReachedMax = clubs.length < _pageSize;
      emit(ClubsState.loaded(
        clubs: clubs,
        currentPage: 1,
        hasReachedMax: hasReachedMax,
      ));
    } catch (e) {
      emit(ClubsState.error('Failed to fetch clubs: ${e.toString()}'));
    }
  }

  Future<void> _onLoadMoreClubs(
    _LoadMoreClubs event,
    Emitter<ClubsState> emit,
  ) async {
    if (state is! _Loaded) return;
    final currentState = state as _Loaded;
    if (currentState.hasReachedMax) return;

    emit(currentState.copyWith(isLoadingMore: true));
    try {
      final nextPage = currentState.currentPage + 1;
      final newClubs =
          await _clubsRepository.getClubs(page: nextPage, limit: _pageSize);
      final hasReachedMax = newClubs.length < _pageSize;
      emit(currentState.copyWith(
        clubs: [...currentState.clubs, ...newClubs],
        currentPage: nextPage,
        hasReachedMax: hasReachedMax,
        isLoadingMore: false,
      ));
    } catch (e) {
      emit(currentState.copyWith(
        isLoadingMore: false,
        loadMoreError: 'Failed to load more clubs.',
      ));
    }
  }
}
