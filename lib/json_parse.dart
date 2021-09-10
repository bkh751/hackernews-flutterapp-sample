import 'dart:convert' as json;

import 'package:untitled/src/article.dart';
import 'package:untitled/src/serializers.dart';

List<int> parseTopStories(String jsonStr) {
  final parsed = json.jsonDecode(jsonStr);
  final listOfIds = List<int>.from(parsed);
  return listOfIds;
}

Article parseArticle(String jsonStr) {
  final parsed = json.jsonDecode(jsonStr);

  Article article =
      standardSerializers.deserializeWith(Article.serializer, parsed)!;

  return article;
}
