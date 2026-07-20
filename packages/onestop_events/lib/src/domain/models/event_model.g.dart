// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventModelImpl _$$EventModelImplFromJson(Map<String, dynamic> json) =>
    _$EventModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      venue: json['venue'] as String,
      imageUrl: json['imageUrl'] as String?,
      isBookmarked: json['isBookmarked'] as bool? ?? false,
      isRegistered: json['isRegistered'] as bool? ?? false,
      isDraft: json['isDraft'] as bool? ?? false,
      boardName: json['boardName'] as String?,
      guestNames: (json['guestNames'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      guestRoles: (json['guestRoles'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      pocNames: (json['pocNames'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      pocRoles: (json['pocRoles'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$EventModelImplToJson(_$EventModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'venue': instance.venue,
      'imageUrl': instance.imageUrl,
      'isBookmarked': instance.isBookmarked,
      'isRegistered': instance.isRegistered,
      'isDraft': instance.isDraft,
      'boardName': instance.boardName,
      'guestNames': instance.guestNames,
      'guestRoles': instance.guestRoles,
      'pocNames': instance.pocNames,
      'pocRoles': instance.pocRoles,
    };
