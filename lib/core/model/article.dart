import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class Article{

  Article();

  @JsonKey(name : "author")
  late String? author;

  @JsonKey(name : "description")
  late String? desc;

  @JsonKey(name : "title")
  late String? title;

  @JsonKey(name : "urlToImage")
  late String? imageUrl;

  @JsonKey(name : "url")
  late String? url;

  @JsonKey(name : "publishedAt")
  late String? publishedAt;

  DateTime? get getPublishedAtDate => DateTime.tryParse(publishedAt!);

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}