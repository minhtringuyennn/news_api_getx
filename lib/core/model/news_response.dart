import 'package:json_annotation/json_annotation.dart';
import 'article.dart';

part 'news_response.g.dart';

@JsonSerializable()
class NewsResponse{

  NewsResponse();

  @JsonKey(name : "status")
  late String status;

  @JsonKey(name : "totalResults")
  late int totalResults;

  @JsonKey(name : "articles")
  late List<Article> articles;

  factory NewsResponse.fromJson(Map<String, dynamic> json) => _$NewsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$NewsResponseToJson(this);

}