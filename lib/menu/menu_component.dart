library menu_component;

import 'package:angular/angular.dart';


@Component(
    selector: 'verdicci-menu',
    templateUrl: 'packages/verdicci/menu/menu_component.html',
    cssUrl: 'packages/verdicci/menu/menu_component.css',
    publishAs: 'cmp')
class MenuComponent {

  Scope _scope;
  Router _router;

  List<Menu> _menus;
  List<Menu> get menus => _menus;
  Menu get currentMenu => _menus.singleWhere((menu) => menu.active);

  MenuComponent(this._router, this._scope) {
    _menus = [
        new Menu('ACCEUIL', 'YOU', ['welcome'], true),
        new Menu('HOME', 'HOME', ['styles','home'], false),
        new Menu('STYLE', 'STYLE', ['styles','style'], false),
        new Menu('ACCESSOIRES', 'ACCESSOIRES', ['styles','accessories'], false),
        new Menu('HEURES D\'OUVERTURE', 'TO WELCOME YOU', ['openhours'], false),
        new Menu('CONTACT', 'TO SEE YOU', ['contact'], false)];

    _scope.on('enter_view_event').listen(enterViewEvent);
  }

  void enterViewEvent(ScopeEvent e) {
    Route route = e.data[0];
    _menus.forEach((menu) => menu.activeFromRoute(route));

  }



  void handleClick(Menu menu) {
    _router.go(menu.routeKey[0], menu.routeKey.length==2?{'category':menu.routeKey[1]}:{}, startingFrom: null, replace: true);
  }
}

class Menu {

  String _name;
  String _title;
  List<String> _routeKey;
  bool _active = false;

  Menu(this._name, this._title, this._routeKey, this._active);

  String get name => _name;
  set name(String value) => _name = value;

  String get title => _title;
  set title(String value) => _title = value;

  bool get active => _active;
  set active(bool value) => _active = value;

  void activeFromRoute(Route route) {
    if(_routeKey.contains(route.name)) {

      if(route.parameters['category'] != null)
        _active = _routeKey.contains(route.parameters['category'])?true:false;
      else
        _active = true;
    }
    else {
      _active = false;
    }
    /*if(_active) {
      print(route.name);
      print(_routeKey);
    }   */
  }

  List<String> get routeKey => _routeKey;
  set routeKey(List<String> value) => _routeKey = value;

}
