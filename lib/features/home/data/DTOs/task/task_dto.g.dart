// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskDtoImpl _$$TaskDtoImplFromJson(Map<String, dynamic> json) =>
    _$TaskDtoImpl(
      createdAt: json['created_at'] as String,
      description: json['description'] as String,
      statusType:
          StatusTypeDto.fromJson(json['status_type'] as Map<String, dynamic>),
      title: json['title'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$$TaskDtoImplToJson(_$TaskDtoImpl instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt,
      'description': instance.description,
      'status_type': instance.statusType,
      'title': instance.title,
      'updated_at': instance.updatedAt,
    };
