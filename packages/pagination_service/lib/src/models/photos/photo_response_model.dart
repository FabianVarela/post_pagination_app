import 'package:json_annotation/json_annotation.dart';

part 'photo_response_model.g.dart';

/// [PhotoResponseModel] class model
@JsonSerializable(createToJson: false)
class PhotoResponseModel {
  /// [PhotoResponseModel] class that get the basic info
  PhotoResponseModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  /// Factory that returns a [PhotoResponseModel] instance
  factory PhotoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoResponseModelFromJson(json);

  /// The photos's [albumId]
  final int albumId;

  /// The photos's [id]
  final int id;

  /// The photos's [title]
  final String title;

  /// The photos's [url]
  final String url;

  /// The photos's [thumbnailUrl]
  final String thumbnailUrl;
}
