library style_controller;

import 'package:angular/angular.dart';
import 'package:verdicci/service/query_service.dart';
import 'package:verdicci/service/model.dart';

@Controller(
    selector: '[style-ctrl]',
    publishAs: 'styleCtrl')
class StyleController {

  final Http _http;
  final QueryService _queryService;
  final RouteProvider _routerProvider;

  List<Styles> _allStyles = [];
  String _currentCategory;

  StyleController(this._http, this._queryService, this._routerProvider) {
    _loadData();
    _currentCategory = _routerProvider.parameters['category'];
  }
  void _loadData() {
    _queryService.getAllStyles().then((List<Styles> allStyles) {
      _allStyles = allStyles;
    }).catchError((e) {
      print(e);
    });
  }

  List<Styles> get allStyles => _allStyles;
  set allStyles(List<Styles> value) => _allStyles = value;

  String get currentCategory => _currentCategory;
  set currentCategory(String value) => _currentCategory = value;

  RouteProvider get routerProvider => _routerProvider;
  QueryService get queryService => _queryService;
  Http get http => _http;


}
