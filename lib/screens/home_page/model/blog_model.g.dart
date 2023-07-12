// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogModel _$BlogModelFromJson(Map<String, dynamic> json) => BlogModel(
      title: json['title'] as String?,
      url: json['url'] as String?,
      approved: json['approved'] as bool?,
    );

Map<String, dynamic> _$BlogModelToJson(BlogModel instance) => <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'approved': instance.approved,
    };
