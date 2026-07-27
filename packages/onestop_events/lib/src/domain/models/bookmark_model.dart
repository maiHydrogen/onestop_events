import 'package:freezed_annotation/freezed_annotation.dart';

part 'bookmark_model.freezed.dart';
part 'bookmark_model.g.dart';

@freezed
class BookmarkModel with _$BookmarkModel {
  const factory BookmarkModel({
    required String id,
    required String userId,
    required List<String> bookmarkedEventIds,
  }) = _BookmarkModel;

  factory BookmarkModel.fromJson(Map<String, dynamic> json) =>
      _$BookmarkModelFromJson(json);
}
