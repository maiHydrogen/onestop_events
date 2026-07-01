part of 'clubs_bloc.dart';

@freezed
class ClubsState with _$ClubsState {
  const factory ClubsState.initial() = _Initial;
  const factory ClubsState.loading() = _Loading;
  const factory ClubsState.loaded(List<ClubModel> clubs) = _Loaded;
  const factory ClubsState.error(String message) = _Error;
}
