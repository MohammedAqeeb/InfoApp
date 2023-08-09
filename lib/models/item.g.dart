// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      id: json['id'] as String?,
      etag: json['etag'] as String?,
      selfLink: json['selfLink'] as String?,
      volumeInfo:
          VolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>),
      accessInfo:
          AccessInfo.fromJson(json['accessInfo'] as Map<String, dynamic>),
    );
