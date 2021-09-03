import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/article.dart';
import 'package:url_launcher/url_launcher.dart';

import 'json_parse.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static Function(ArticleBuilder) newCompanyArticle(
      String companyName, int comments) {
    return (b) => b
      ..id = 0
      ..title = "company domain"
      ..type = 'boring'
      ..by = ""
      ..score = 0
      ..text = 'hello $companyName!'
      ..comments = comments
      ..url = 'http://$companyName.com';
  }

  final List<Article> sampleArticles = [
    Article(newCompanyArticle('naver', 1302)),
    Article(newCompanyArticle('google', 111)),
    Article(newCompanyArticle('kakao', 1322)),
    Article(newCompanyArticle('microsoft', 1304)),
  ];

  var idList = [];

  _MyHomePageState() {
    refreshStoryIds();
  }

  refreshStoryIds() async {
    var url = Uri.https('hacker-news.firebaseio.com', '/v0/topstories.json');
    if (idList.isNotEmpty) {
      idList.shuffle();
      idList = idList.sublist(0, 50);
      return;
    }

    final res = await http.get(url);
    if (res.statusCode == 200) {
      idList = json.decode(res.body);
      idList.shuffle();
      idList = idList.sublist(0, 50);
    }
  }

  Future<Article?>? getArticle(itemId) async {
    final storyUrl =
        Uri.https('hacker-news.firebaseio.com', '/v0/item/$itemId.json');
    final storyRes = await http.get(storyUrl);

    if (storyRes.statusCode == 200) {
      return parseArticle(storyRes.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new RefreshIndicator(
        onRefresh: () async {
          await new Future.delayed(const Duration(milliseconds: 300));
          setState(() {
            refreshStoryIds();
          });
        },
        child: new ListView(
            children: idList
                .map(
                  (id) => FutureBuilder<Article?>(
                    future: getArticle(id),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return _buildItem(snapshot.data!);
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                )
                .toList()),
      ),
    );
  }
}

Widget _buildItem(Article article) {
  return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new ExpansionTile(
        key: Key(article.id.toString()),
        title: new Text(
          article.title,
          style: new TextStyle(fontSize: 24),
        ),
        children: <Widget>[
          new Text("${article.text}"),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Text("${article.descendants} comments"),
              new IconButton(
                icon: new Icon(Icons.launch),
                onPressed: () async {
                  final myDomain = article.url;
                  try {
                    launch(myDomain!);
                    print("launched $myDomain");
                  } catch (e) {
                    print(e);
                    print("asdf, cannot launch $myDomain");
                  }
                },
                color: Colors.green,
              )
            ],
          )
        ],
      ));
}
