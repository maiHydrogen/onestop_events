part of 'clubs_bloc.dart';

@freezed
class ClubsEvent with _$ClubsEvent {
  const factory ClubsEvent.fetchClubs() = _FetchClubs;
  const factory ClubsEvent.loadMoreClubs() = _LoadMoreClubs;
}
