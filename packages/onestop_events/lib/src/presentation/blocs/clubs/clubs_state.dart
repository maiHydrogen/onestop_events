part of 'clubs_bloc.dart';

@freezed
class ClubsState with _$ClubsState {
  const factory ClubsState.initial() = _Initial;
  const factory ClubsState.loading() = _Loading;
  const factory ClubsState.loaded({
    required List<ClubModel> clubs,
    required int currentPage,
    @Default(false) bool hasReachedMax,
    @Default(false) bool isLoadingMore,
    // Transient error field for snackbar signals
    String? loadMoreError,
  }) = _Loaded;
  const factory ClubsState.error(String message) = _Error;
}
