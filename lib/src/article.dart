import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'article.g.dart';

abstract class Article implements Built<Article, ArticleBuilder> {
  static Serializer<Article> get serializer => _$articleSerializer;

  int get id;
  String get by;
  int? get descendants;
  BuiltList<int> get kids;
  int get score;
  int? get time;
  String get title;
  String? get text;
  int? get comments;

  /// This is the type of the article
  ///
  /// It can be either of these: "job","story", "comment","poll"
  String get type;
  String? get url;
  Article._();

  factory Article([void Function(ArticleBuilder) updates]) = _$Article;
}
