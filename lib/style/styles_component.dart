library styles_component;

import 'package:angular/angular.dart';
import 'package:verdicci/service/query_service.dart';
import 'package:verdicci/service/model.dart';

@Component(
    selector: 'verdicci-styles',
    templateUrl: 'packages/verdicci/style/styles_component.html',
    cssUrl: 'packages/verdicci/style/styles_component.css',
    publishAs: 'cmp')
class StylesComponent {

  final Http _http;
  final QueryService _queryService;
  final RouteProvider _routerProvider;

  List<Styles> _styles;
  String _currentCategory;

  StylesComponent(this._http, this._queryService, this._routerProvider) {
    _loadData();
    _currentCategory = _routerProvider.parameters['category'];
  }
  void _loadData() {
    _queryService.getAllStyles().then((List<Styles> allStyles) {
      _styles = allStyles;
    }).catchError((e) {
      print(e);
    });
  }

  List<Styles> get currentStyles => _styles != null?styles.where((style) => style['category'] == _currentCategory):[];
  set styles(List<Styles> value) => _styles = value;
  List<Styles> get styles => _styles;

  String get currentCategory => _currentCategory;
  set currentCategory(String value) => _currentCategory = value;

}

