library app_router;

import 'package:angular/angular.dart';

@Injectable()
class AppRouteInitializer implements RouteInitializer  {

  Scope _scope;

  AppRouteInitializer(this._scope);

  void init(Router router, RouteViewFactory views) {

    //var urlPrefix = "../lib";
    var urlPrefix = "view";

    views.configure({
      'welcome': ngRoute(
          defaultRoute: true,
          path: '/welcome',
          view: urlPrefix + '/welcome_view.html',
          enter: enterViewEvent),
      'styles': ngRoute(
          path: '/styles/:category',
          view: urlPrefix + '/style_view.html',
          enter: enterViewEvent),
      'openhours': ngRoute(
          path: '/openhours',
          view: urlPrefix + '/openhours_view.html',
          enter: enterViewEvent),
      'contact': ngRoute(
          path: '/contact',
          view: urlPrefix + '/contact_view.html',
          enter: enterViewEvent)

    });
  }

  void enterViewEvent(RouteEnterEvent e) {
    _scope.broadcast('enter_view_event',[e.route]);
  }
}
