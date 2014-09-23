library welcome_controller;

import 'package:angular/angular.dart';
import 'package:verdicci/service/query_service.dart';
import 'package:verdicci/service/model.dart';


@Controller(
    selector: '[welcome-ctrl]',
    publishAs: 'welcomeCtrl')
class WelcomeController {

  final Http _http;
  final QueryService _queryService;

  List<News> _allNews = [];

  WelcomeController(this._http, this._queryService) {
    _loadData();
  }

  void _loadData() {
    _queryService.getAllNews().then((List<News> allNews) {
      _allNews = allNews;
    }).catchError((e) {
      print(e);
    });
  }

  List<News> get allNews => _allNews;
  set allNews(List<News> value) => _allNews = value;

  Http get http => _http;
//  set http(Http value) => _http = value;

  QueryService get queryService => _queryService;
//  set queryService(QueryService value) => _queryService = value;


}
