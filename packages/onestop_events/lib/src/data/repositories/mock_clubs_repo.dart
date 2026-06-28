import '../../domain/models/club_model.dart';
import '../../domain/repositories/i_clubs_repo.dart';

class MockClubsRepository implements IClubsRepository {
  // Hardcoded list of clubs representing sports, cultural, and technical categories.
  final List<ClubModel> _mockClubs = [
    const ClubModel(
      id: 'c1',
      name: 'Coding Club',
      description: 'The hub for all programming and software development enthusiasts at IIT Guwahati.',
      category: ClubCategory.technical,
      logoUrl: 'https://dummyimage.com/100x100/000/fff&text=Coding',
    ),
    const ClubModel(
      id: 'c2',
      name: 'Cadence Club',
      description: 'The official dance club of IIT Guwahati, bringing energy and rhythm to life.',
      category: ClubCategory.cultural,
      logoUrl: 'https://dummyimage.com/100x100/000/fff&text=Cadence',
    ),
    const ClubModel(
      id: 'c3',
      name: 'Athletics Club',
      description: 'Promoting track and field activities and physical fitness across campus.',
      category: ClubCategory.sports,
      logoUrl: 'https://dummyimage.com/100x100/000/fff&text=Athletics',
    ),
    const ClubModel(
      id: 'c4',
      name: 'Aeromodelling Club',
      description: 'Design, build, and fly model aircraft at IIT Guwahati.',
      category: ClubCategory.technical,
      logoUrl: 'https://dummyimage.com/100x100/000/fff&text=Aero',
    ),
    const ClubModel(
      id: 'c5',
      name: 'Xpressions Club',
      description: 'The dramatics and theater club of IIT Guwahati.',
      category: ClubCategory.cultural,
      logoUrl: 'https://dummyimage.com/100x100/000/fff&text=Xpressions',
    ),
  ];

  @override
  Future<List<ClubModel>> getClubs() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 1500));
    return List.unmodifiable(_mockClubs);
  }
}
