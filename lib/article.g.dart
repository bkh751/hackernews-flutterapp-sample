// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Article> _$articleSerializer = new _$ArticleSerializer();

class _$ArticleSerializer implements StructuredSerializer<Article> {
  @override
  final Iterable<Type> types = const [Article, _$Article];
  @override
  final String wireName = 'Article';

  @override
  Iterable<Object?> serialize(Serializers serializers, Article object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'by',
      serializers.serialize(object.by, specifiedType: const FullType(String)),
      'kids',
      serializers.serialize(object.kids,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
      'score',
      serializers.serialize(object.score, specifiedType: const FullType(int)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.descendants;
    if (value != null) {
      result
        ..add('descendants')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.time;
    if (value != null) {
      result
        ..add('time')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.text;
    if (value != null) {
      result
        ..add('text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.comments;
    if (value != null) {
      result
        ..add('comments')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.url;
    if (value != null) {
      result
        ..add('url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Article deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ArticleBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'by':
          result.by = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'descendants':
          result.descendants = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'kids':
          result.kids.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'score':
          result.score = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'comments':
          result.comments = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Article extends Article {
  @override
  final int id;
  @override
  final String by;
  @override
  final int? descendants;
  @override
  final BuiltList<int> kids;
  @override
  final int score;
  @override
  final int? time;
  @override
  final String title;
  @override
  final String? text;
  @override
  final int? comments;
  @override
  final String type;
  @override
  final String? url;

  factory _$Article([void Function(ArticleBuilder)? updates]) =>
      (new ArticleBuilder()..update(updates)).build();

  _$Article._(
      {required this.id,
      required this.by,
      this.descendants,
      required this.kids,
      required this.score,
      this.time,
      required this.title,
      this.text,
      this.comments,
      required this.type,
      this.url})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'Article', 'id');
    BuiltValueNullFieldError.checkNotNull(by, 'Article', 'by');
    BuiltValueNullFieldError.checkNotNull(kids, 'Article', 'kids');
    BuiltValueNullFieldError.checkNotNull(score, 'Article', 'score');
    BuiltValueNullFieldError.checkNotNull(title, 'Article', 'title');
    BuiltValueNullFieldError.checkNotNull(type, 'Article', 'type');
  }

  @override
  Article rebuild(void Function(ArticleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ArticleBuilder toBuilder() => new ArticleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Article &&
        id == other.id &&
        by == other.by &&
        descendants == other.descendants &&
        kids == other.kids &&
        score == other.score &&
        time == other.time &&
        title == other.title &&
        text == other.text &&
        comments == other.comments &&
        type == other.type &&
        url == other.url;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc($jc(0, id.hashCode), by.hashCode),
                                        descendants.hashCode),
                                    kids.hashCode),
                                score.hashCode),
                            time.hashCode),
                        title.hashCode),
                    text.hashCode),
                comments.hashCode),
            type.hashCode),
        url.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Article')
          ..add('id', id)
          ..add('by', by)
          ..add('descendants', descendants)
          ..add('kids', kids)
          ..add('score', score)
          ..add('time', time)
          ..add('title', title)
          ..add('text', text)
          ..add('comments', comments)
          ..add('type', type)
          ..add('url', url))
        .toString();
  }
}

class ArticleBuilder implements Builder<Article, ArticleBuilder> {
  _$Article? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _by;
  String? get by => _$this._by;
  set by(String? by) => _$this._by = by;

  int? _descendants;
  int? get descendants => _$this._descendants;
  set descendants(int? descendants) => _$this._descendants = descendants;

  ListBuilder<int>? _kids;
  ListBuilder<int> get kids => _$this._kids ??= new ListBuilder<int>();
  set kids(ListBuilder<int>? kids) => _$this._kids = kids;

  int? _score;
  int? get score => _$this._score;
  set score(int? score) => _$this._score = score;

  int? _time;
  int? get time => _$this._time;
  set time(int? time) => _$this._time = time;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  int? _comments;
  int? get comments => _$this._comments;
  set comments(int? comments) => _$this._comments = comments;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  ArticleBuilder();

  ArticleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _by = $v.by;
      _descendants = $v.descendants;
      _kids = $v.kids.toBuilder();
      _score = $v.score;
      _time = $v.time;
      _title = $v.title;
      _text = $v.text;
      _comments = $v.comments;
      _type = $v.type;
      _url = $v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Article other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Article;
  }

  @override
  void update(void Function(ArticleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Article build() {
    _$Article _$result;
    try {
      _$result = _$v ??
          new _$Article._(
              id: BuiltValueNullFieldError.checkNotNull(id, 'Article', 'id'),
              by: BuiltValueNullFieldError.checkNotNull(by, 'Article', 'by'),
              descendants: descendants,
              kids: kids.build(),
              score: BuiltValueNullFieldError.checkNotNull(
                  score, 'Article', 'score'),
              time: time,
              title: BuiltValueNullFieldError.checkNotNull(
                  title, 'Article', 'title'),
              text: text,
              comments: comments,
              type: BuiltValueNullFieldError.checkNotNull(
                  type, 'Article', 'type'),
              url: url);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'kids';
        kids.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Article', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
