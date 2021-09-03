import 'dart:convert' as json;

import 'package:untitled/article.dart';
import 'package:untitled/serializers.dart';

List<int> parseTopStories(String jsonStr) {
  // final parsed = json.jsonDecode(jsonStr);
  // final listOfIds = List<int>.from(parsed);
  // return listOfIds;
  return [];
}

Article? parseArticle(String jsonStr) {
  final parsed = json.jsonDecode(jsonStr);

  Article? article =
      standardSerializers.deserializeWith(Article.serializer, parsed);

  return article;
}
