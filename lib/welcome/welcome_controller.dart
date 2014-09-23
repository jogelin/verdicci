library welcome_controller;

import 'package:angular/angular.dart';
import 'package:verdicci/service/query_service.dart';
import 'package:verdicci/service/model.dart';


@Controller(
    selector: '[welcome-ctrl]',
    publishAs: 'welcomeCtrl')
class WelcomeController {

  final Http _http;
  final QueryService queryService;

  List<News> _allNews = [];

  WelcomeController(this._http, this.queryService) {
    _loadData();
  }

  void _loadData() {
    queryService.getAllNews().then((List<News> allNews) {
      _allNews = allNews;
    }).catchError((e) {
      print(e);
    });
  }

  List<News> get allNews => _allNews;
  set allNews(List<News> value) => _allNews = value;
}
