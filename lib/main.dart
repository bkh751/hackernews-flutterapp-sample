import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:untitled/src/article.dart';
import 'package:untitled/src/hn_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  final hnBloc = HackerNewsBloc();
  runApp(MyApp(
    bloc: hnBloc,
  ));
}

class MyApp extends StatelessWidget {
  final HackerNewsBloc bloc;
  MyApp({Key? key, required this.bloc}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Flutter Hacker News',
        bloc: bloc,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final HackerNewsBloc bloc;

  MyHomePage({Key? key, required this.title, required this.bloc})
      : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        // leading: LoadingInfo(widget.bloc.isloadingSubject),
      ),
      body: StreamBuilder<UnmodifiableListView<Article>>(
        stream: widget.bloc.articles,
        initialData: UnmodifiableListView<Article>([]),
        builder: (context, snapshot) => ListView(
          children: snapshot.data!.map(_buildItem).toList(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 0) {
            widget.bloc.storiesType.add(StoriesType.topStories);
          } else {
            widget.bloc.storiesType.add(StoriesType.newStories);
          }
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            label: 'Top stories',
            icon: Icon(Icons.arrow_drop_down),
          ),
          BottomNavigationBarItem(
              label: 'New stories', icon: Icon(Icons.new_releases))
        ],
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
                  } catch (e) {}
                },
                color: Colors.green,
              )
            ],
          )
        ],
      ));
}

class LoadingInfo extends StatelessWidget {
  final Stream<bool> _isLoading;
  LoadingInfo(this._isLoading);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _isLoading,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData && snapshot.data!)
          return CircularProgressIndicator();
        return Container();
      },
    );
  }
}
