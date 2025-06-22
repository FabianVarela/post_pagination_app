import 'package:json_annotation/json_annotation.dart';

part 'album_response_model.g.dart';

/// [AlbumResponseModel] class model
@JsonSerializable(createToJson: false)
class AlbumResponseModel {
  /// [AlbumResponseModel] class that get the basic info
  AlbumResponseModel({
    required this.userId,
    required this.id,
    required this.title,
  });

  /// Factory that returns a [AlbumResponseModel] instance
  factory AlbumResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AlbumResponseModelFromJson(json);

  /// The album's [userId]
  final int userId;

  /// The album's [id]
  final int id;

  /// The album's [title]
  final String title;
}
