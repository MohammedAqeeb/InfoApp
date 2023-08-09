import 'package:json_annotation/json_annotation.dart';

part 'access.g.dart';

@JsonSerializable(createToJson: false)
class AccessInfo {
  @JsonKey(defaultValue: '')
  final String webReaderLink;

  AccessInfo({
    required this.webReaderLink,
  });

  factory AccessInfo.fromJson(Map<String, dynamic> json) =>
      _$AccessInfoFromJson(json);
}
