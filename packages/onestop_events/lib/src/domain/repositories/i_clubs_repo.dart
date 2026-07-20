import '../models/club_model.dart';

abstract class IClubsRepository {
  /// Fetches a paginated list of clubs.
  /// [page] starts at 1. [limit] controls items per page.
  Future<List<ClubModel>> getClubs({int page = 1, int limit = 20});

  /// Fetches a single club by its unique ID.
  Future<ClubModel> getClubById(String clubId);

  /// Updates club information. Admin only.
  Future<ClubModel> updateClubInfo(ClubModel club);
}
