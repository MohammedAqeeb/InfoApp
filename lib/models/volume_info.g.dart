// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volume_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VolumeInfo _$VolumeInfoFromJson(Map<String, dynamic> json) => VolumeInfo(
      title: json['title'] as String? ?? 'NA',
      authors: (json['authors'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      publisher: json['publisher'] as String? ?? 'NA',
      publishedDate: json['publishedDate'] as String? ?? 'NA',
      description: json['description'] as String? ?? 'NA',
      pageCount: json['pageCount'] as int?,
      averageRating: (json['averageRating'] as num?)?.toDouble() ?? 0,
      ratingsCount: json['ratingsCount'] as int?,
      allowAnonLogging: json['allowAnonLogging'] as bool,
      imageLinks:
          ImageLinks.fromJson(json['imageLinks'] as Map<String, dynamic>),
    );
