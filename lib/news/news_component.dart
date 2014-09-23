library news_component;

import 'package:angular/angular.dart';


import 'package:verdicci/service/model.dart';

@Component(
    selector: 'news',
    templateUrl: 'packages/verdicci/news/news_component.html',
    cssUrl: 'packages/verdicci/news/news_component.css',
    publishAs: 'cmp')
class NewsComponent {

  @NgOneWay('news')
  List<News> news;

  NewsComponent();
}

