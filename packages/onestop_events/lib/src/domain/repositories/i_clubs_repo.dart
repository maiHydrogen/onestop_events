import '../models/club_model.dart';

abstract class IClubsRepository {
  /// Fetches the list of all clubs.
  Future<List<ClubModel>> getClubs();
}
