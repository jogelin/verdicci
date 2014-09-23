library query_service;

import 'dart:async';

import 'package:verdicci/service/model.dart';
import 'package:angular/angular.dart';

@Injectable()
class QueryService {
  String _newsUrl = 'data/news.json';
  String _stylesUrl = 'data/styles.json';

  Future _loaded;

  List<News> _newsCache;
  List<Styles> _stylesCache;

  final Http _http;

  QueryService(Http this._http) {
    _loaded = Future.wait([_loadNews(), _loadStyles()]);
  }

  Future _loadNews() {
    return _http.get(_newsUrl)
    .then((HttpResponse response) {
      _newsCache = response.data;

    });
  }

  Future _loadStyles() {
    return _http.get(_stylesUrl)
    .then((HttpResponse response) {
      _stylesCache = response.data;
    });
  }

  Future<List<News>> getAllNews() {
    return _newsCache == null
    ? _loaded.then((_) => _newsCache)
    : new Future.value(_newsCache);
  }

  Future<List<Styles>> getAllStyles() {
    return _stylesCache == null
    ? _loaded.then((_) => _stylesCache)
    : new Future.value(_stylesCache);
  }
}
