import 'package:json_annotation/json_annotation.dart';

import 'image.dart';
part 'volume_info.g.dart';

@JsonSerializable(createToJson: false)
class VolumeInfo {
  @JsonKey(defaultValue: 'NA')
  final String? title, publisher, publishedDate, description;

  int? pageCount;
  @JsonKey(defaultValue: 0)
  double? averageRating;
  int? ratingsCount;
  bool allowAnonLogging;
  @JsonKey(defaultValue: [])
  final List<String>? authors;

  ImageLinks imageLinks;

  VolumeInfo({
    this.title,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.pageCount,
    this.averageRating,
    this.ratingsCount,
    required this.allowAnonLogging,
    required this.imageLinks,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) =>
      _$VolumeInfoFromJson(json);
}
