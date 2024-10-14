import 'package:json_annotation/json_annotation.dart';

part 'post_response_model.g.dart';

/// [PostResponseModel] class model
@JsonSerializable(createToJson: false)
class PostResponseModel {
  /// [PostResponseModel] class that get the basic info
  PostResponseModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  /// Factory that returns a [PostResponseModel] instance
  factory PostResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PostResponseModelFromJson(json);

  /// The post's [userId]
  final int userId;

  /// The post's [id]
  final int id;

  /// The post's [title]
  final String title;

  /// The post's [body]
  final String body;
}
