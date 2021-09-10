import 'dart:async';
import 'dart:collection';

import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';
import 'package:untitled/src/article.dart';

import '../json_parse.dart';

enum StoriesType {
  topStories,
  newStories,
}

class HackerNewsBloc {
  Stream<UnmodifiableListView<Article>> get articles => _articlesSubject.stream;

  final _articlesSubject = BehaviorSubject<UnmodifiableListView<Article>>();
  final _isloadingSubject = BehaviorSubject<bool>();
  get isloadingSubject => _isloadingSubject.stream;

  Sink<StoriesType> get storiesType => _storiesTypeController.sink;

  final _storiesTypeController = StreamController<StoriesType>();

  static List<int> _newIds = [
    28366063,
    28365163,
    28368626,
    28369654,
    28368622,
  ];

  static List<int> _topIds = [28369165, 28365928, 28368630, 28369069];

  var _articles = <Article>[];

  HackerNewsBloc() {
    _getArticlesAndUpdate(_topIds);

    _storiesTypeController.stream.listen((storiesType) {
      if (storiesType == StoriesType.newStories) {
        _getArticlesAndUpdate(_newIds);
      } else {
        _getArticlesAndUpdate(_topIds);
      }
    });
  }
  _getArticlesAndUpdate(List<int> ids) {
    _isloadingSubject.add(true);
    _updateArticles(ids).then((_) {
      _articlesSubject.add(UnmodifiableListView(_articles));
    });
  }

  Future<Null> _updateArticles(List<int> articleIds) async {
    final futureArticles = articleIds.map((id) => getArticle(id));
    final articles = await Future.wait(futureArticles);
    _articles = articles;
  }

  Future<Article> getArticle(itemId) async {
    final storyUrl =
        Uri.https('hacker-news.firebaseio.com', '/v0/item/$itemId.json');
    final storyRes = await http.get(storyUrl);

    if (storyRes.statusCode == 200) {
      return parseArticle(storyRes.body);
    } else {
      return Article();
    }
  }
}
