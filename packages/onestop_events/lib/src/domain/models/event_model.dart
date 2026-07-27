import 'package:freezed_annotation/freezed_annotation.dart';

// These two lines are mandatory for Freezed and JSON generation to work.
// The names MUST match your file name exactly.
part 'event_model.freezed.dart';
part 'event_model.g.dart';

@freezed
class EventModel with _$EventModel {
  const factory EventModel({
    required String id,
    required String title,
    required String description,
    required DateTime startTime,
    required DateTime endTime,
    required String venue,
    // Nullable fields don't need 'required'
    String? imageUrl,
    // Default values are great for flags like this
    @Default(false) bool isBookmarked,
  }) = _EventModel;

  // This single line tells Freezed to wire up the JSON serialization.
  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);
}