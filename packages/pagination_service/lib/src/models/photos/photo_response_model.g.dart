// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoResponseModel _$PhotoResponseModelFromJson(Map<String, dynamic> json) =>
    PhotoResponseModel(
      albumId: (json['albumId'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
