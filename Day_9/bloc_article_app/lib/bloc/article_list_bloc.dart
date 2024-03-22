import 'dart:async';
import 'package:bloc_pattern/bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../data/api_provider.dart';
import '../data/article.dart';

class ArticleListBloc implements Bloc {
  final _client = ApiProvider();
  final _searchQueryController = StreamController<String?>();
  Sink<String?> get searchQuery => _searchQueryController.sink;
  late Stream<List<Article>?> articlesStream;

  ArticleListBloc() {
    articlesStream = _searchQueryController.stream
        .startWith(null)
        .debounceTime(const Duration(milliseconds: 100))
        .switchMap(
          (query) => _client
          .fetchArticles(query)
          .asStream()
          .startWith(null),
    );
  }

  @override
  void dispose() {
    _searchQueryController.close();
  }
}