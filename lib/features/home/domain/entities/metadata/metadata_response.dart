import 'package:json_annotation/json_annotation.dart';
part 'metadata_response.g.dart';
@JsonSerializable()
class MetadataResponse{
  final int? currentPage;
  final int? numberOfPages;
  final int? limit;

  MetadataResponse({this.currentPage, this.numberOfPages, this.limit});
  factory MetadataResponse.fromJson(Map<String, dynamic> json) =>
      _$MetadataResponseFromJson(json);
}