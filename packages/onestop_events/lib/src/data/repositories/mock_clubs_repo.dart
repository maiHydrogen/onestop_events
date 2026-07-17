import '../../domain/models/club_model.dart';
import '../../domain/repositories/i_clubs_repo.dart';

class MockClubsRepository implements IClubsRepository {
  // Expanded mock clubs covering all board categories.
  final List<ClubModel> _allClubs = [
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
    const ClubModel(
      id: 'c6',
      name: 'Robotics Club',
      description: 'Building autonomous robots and competing in national-level robotics challenges.',
      category: ClubCategory.technical,
      logoUrl: 'https://dummyimage.com/100x100/000/fff&text=Robotics',
    ),
    const ClubModel(
      id: 'c7',
      name: 'Music Club',
      description: 'For all music lovers — Western, Indian classical, and fusion genres.',
      category: ClubCategory.cultural,
      logoUrl: 'https://dummyimage.com/100x100/000/fff&text=Music',
    ),
    const ClubModel(
      id: 'c8',
      name: 'Basketball Club',
      description: 'Training, friendly matches, and inter-college basketball tournaments.',
      category: ClubCategory.sports,
      logoUrl: 'https://dummyimage.com/100x100/000/fff&text=Basketball',
    ),
    const ClubModel(
      id: 'c9',
      name: 'Photography Club',
      description: 'Capturing moments and telling stories through the lens at IITG.',
      category: ClubCategory.cultural,
      logoUrl: 'https://dummyimage.com/100x100/000/fff&text=Photo',
    ),
    const ClubModel(
      id: 'c10',
      name: 'AI & ML Club',
      description: 'Exploring machine learning, deep learning, and AI research at IITG.',
      category: ClubCategory.technical,
      logoUrl: 'https://dummyimage.com/100x100/000/fff&text=AI+ML',
    ),
  ];

  @override
  Future<List<ClubModel>> getClubs({int page = 1, int limit = 20}) async {
    // Simulate a network delay
    await Future.delayed(const Duration(milliseconds: 1200));

    final start = (page - 1) * limit;
    if (start >= _allClubs.length) return [];

    final end = (start + limit).clamp(0, _allClubs.length);
    return List.unmodifiable(_allClubs.sublist(start, end));
  }

  @override
  Future<ClubModel> getClubById(String clubId) async {
    await Future.delayed(const Duration(milliseconds: 400));
    return _allClubs.firstWhere(
      (c) => c.id == clubId,
      orElse: () => throw Exception('Club not found: $clubId'),
    );
  }

  @override
  Future<ClubModel> updateClubInfo(ClubModel club) async {
    await Future.delayed(const Duration(seconds: 1));
    final index = _allClubs.indexWhere((c) => c.id == club.id);
    if (index != -1) {
      _allClubs[index] = club;
      return club;
    } else {
      throw Exception('Club not found: ${club.id}');
    }
  }
}
