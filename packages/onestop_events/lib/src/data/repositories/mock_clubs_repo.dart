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
    const ClubModel(
      id: 'c11',
      name: 'Youth Red Cross Welfare',
      description: 'Welfare activities, blood donation drives, and disaster relief management.',
      category: ClubCategory.welfare,
      logoUrl: 'https://dummyimage.com/100x100/000/fff&text=Welfare',
    ),
    const ClubModel(
      id: 'c12',
      name: 'Hostel Affairs Board',
      description: 'Coordinating student accommodation, mess facilities, and inter-hostel events.',
      category: ClubCategory.hostelAffairs,
      logoUrl: 'https://dummyimage.com/100x100/000/fff&text=HAB',
    ),
    const ClubModel(
      id: 'c13',
      name: 'Student Alumni Interaction Linkage (SAIL)',
      description: 'Promoting interaction between alumni and students of IITG.',
      category: ClubCategory.sail,
      logoUrl: 'https://dummyimage.com/100x100/000/fff&text=SAIL',
    ),
    const ClubModel(
      id: 'c14',
      name: 'Students Web Committee (SWC)',
      description: 'Developing and maintaining web applications for the campus community.',
      category: ClubCategory.swc,
      logoUrl: 'https://dummyimage.com/100x100/000/fff&text=SWC',
    ),
    const ClubModel(
      id: 'c15',
      name: 'Academic Affairs Board',
      description: 'Handling academic representation, curriculum feedback, and peer tutoring programs.',
      category: ClubCategory.academic,
      logoUrl: 'https://dummyimage.com/100x100/000/fff&text=AAB',
    ),
  ];

  @override
  Future<List<ClubModel>> getClubs({int page = 1, int limit = 20}) async {
    // Validate pagination parameters to prevent RangeError/Index bounds crashes
    final sanitizedPage = page < 1 ? 1 : page;
    final sanitizedLimit = limit < 1 ? 20 : limit;

    // Simulate a network delay
    await Future.delayed(const Duration(milliseconds: 1200));

    final start = (sanitizedPage - 1) * sanitizedLimit;
    if (start >= _allClubs.length) return [];

    final end = (start + sanitizedLimit).clamp(0, _allClubs.length);
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
