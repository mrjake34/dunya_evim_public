import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blog_model.g.dart';

@JsonSerializable()
final class BlogModel extends Equatable {
  final String? title;
  final String? url;
  final bool? approved;

  BlogModel({this.title, this.url, this.approved});
  
  @override
  List<Object?> get props => [title, url, approved];

  
  Map<String, dynamic> toJson() => _$BlogModelToJson(this);

  factory BlogModel.fromJson(Map<String, dynamic> json) => _$BlogModelFromJson(json);
}
