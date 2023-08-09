import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable(createToJson: false)
class ImageLinks {
  @JsonKey(defaultValue: '')
  final String smallThumbnail, thumbnail;
  ImageLinks({
    required this.smallThumbnail,
    required this.thumbnail,
  });

  factory ImageLinks.fromJson(Map<String, dynamic> json) =>
      _$ImageLinksFromJson(json);
}
