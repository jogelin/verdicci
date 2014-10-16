library verdicci;

import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';

import 'package:verdicci/service/query_service.dart';
import 'package:verdicci/menu/menu_component.dart';

import 'package:verdicci/welcome/news_component.dart';

import 'package:verdicci/style/styles_component.dart';

import 'package:verdicci/routing/app_router.dart';

class VerdicciAppModule extends Module {
  VerdicciAppModule() {

    bind(MenuComponent);
    bind(NewsComponent);
    bind(StylesComponent);
    bind(QueryService);

    bind(RouteInitializer, toImplementation: AppRouteInitializer );
    bind(NgRoutingUsePushState, toValue: new NgRoutingUsePushState.value(false));
  }
}

void main() {
  applicationFactory()
  .addModule(new VerdicciAppModule())
  .run();
}
