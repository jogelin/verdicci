library news_component;

import 'package:angular/angular.dart';
import 'package:verdicci/service/query_service.dart';
import 'package:verdicci/service/model.dart';

@Component(
    selector: 'news',
    templateUrl: 'packages/verdicci/welcome/news_component.html',
    cssUrl: 'packages/verdicci/welcome/news_component.css',
    publishAs: 'cmp')
class NewsComponent {

  final Http _http;
  final QueryService _queryService;

  List<News> _news = [];

  NewsComponent(this._http, this._queryService) {
    _loadData();
  }

  void _loadData() {
    _queryService.getAllNews().then((List<News> allNews) {
      _news = allNews;
    }).catchError((e) {
      print(e);
    });
  }

  List<News> get news => _news;
  set news(List<News> value) => _news = value;

}

