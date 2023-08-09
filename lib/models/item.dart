import 'package:json_annotation/json_annotation.dart';

import 'access.dart';
import 'volume_info.dart';

part 'item.g.dart';

@JsonSerializable(createToJson: false)
class Items {
  String? id, etag, selfLink;
  VolumeInfo volumeInfo;
  AccessInfo accessInfo;

  Items({
    this.id,
    this.etag,
    this.selfLink,
    required this.volumeInfo,
    required this.accessInfo,
  });

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);
}
