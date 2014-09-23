library app_router;

import 'package:angular/angular.dart';

class AppRouteInitializer implements RouteInitializer  {

  Scope _scope;

  AppRouteInitializer(this._scope);

  void init(Router router, RouteViewFactory views) {

    var urlPrefix = "../lib";

    views.configure({
      'welcome': ngRoute(
          defaultRoute: true,
          path: '/welcome',
          view: urlPrefix + '/welcome/welcome_view.html',
          enter: enterViewEvent),
      'styles': ngRoute(
          path: '/styles/:category',
          view: urlPrefix + '/style/style_view.html',
          enter: enterViewEvent),
      'openhours': ngRoute(
          path: '/openhours',
          view: urlPrefix + '/openhours/openhours_view.html',
          enter: enterViewEvent),
      'contact': ngRoute(
          path: '/contact',
          view: urlPrefix + '/contact/contact_view.html',
          enter: enterViewEvent)

    });
  }

  void enterViewEvent(RouteEnterEvent e) {
    _scope.broadcast('enter_view_event',[e.route]);
  }
}
