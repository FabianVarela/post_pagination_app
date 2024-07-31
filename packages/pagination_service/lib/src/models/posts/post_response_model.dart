import 'package:json_annotation/json_annotation.dart';

part 'post_response_model.g.dart';

@JsonSerializable(createToJson: false)
class PostResponseModel {
  PostResponseModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PostResponseModelFromJson(json);

  final int userId;
  final int id;
  final String title;
  final String body;
}
