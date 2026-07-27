// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookmarkModelImpl _$$BookmarkModelImplFromJson(Map<String, dynamic> json) =>
    _$BookmarkModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      bookmarkedEventIds: (json['bookmarkedEventIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$BookmarkModelImplToJson(_$BookmarkModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'bookmarkedEventIds': instance.bookmarkedEventIds,
    };
