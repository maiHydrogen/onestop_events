// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClubModelImpl _$$ClubModelImplFromJson(Map<String, dynamic> json) =>
    _$ClubModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      category: $enumDecode(_$ClubCategoryEnumMap, json['category']),
      logoUrl: json['logoUrl'] as String?,
    );

Map<String, dynamic> _$$ClubModelImplToJson(_$ClubModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'category': _$ClubCategoryEnumMap[instance.category]!,
      'logoUrl': instance.logoUrl,
    };

const _$ClubCategoryEnumMap = {
  ClubCategory.technical: 'technical',
  ClubCategory.cultural: 'cultural',
  ClubCategory.sports: 'sports',
};
