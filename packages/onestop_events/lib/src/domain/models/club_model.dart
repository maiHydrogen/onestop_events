import 'package:freezed_annotation/freezed_annotation.dart';

part 'club_model.freezed.dart';
part 'club_model.g.dart';

// We can use an enum to cleanly categorize clubs
enum ClubCategory { technical, cultural, sports }

@freezed
class ClubModel with _$ClubModel {
  const factory ClubModel({
    required String id,
    required String name,
    required String description,
    required ClubCategory category,
    String? logoUrl,
  }) = _ClubModel;

  factory ClubModel.fromJson(Map<String, dynamic> json) =>
      _$ClubModelFromJson(json);
}