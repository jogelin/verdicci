library verdicci;

import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';

import 'package:verdicci/menu/menu_component.dart';
import 'package:verdicci/news/news_component.dart';
import 'package:verdicci/google-map/maps.dart';
import 'package:verdicci/service/query_service.dart';

import 'package:verdicci/welcome/welcome_controller.dart';
import 'package:verdicci/style/style_controller.dart';
import 'package:verdicci/openhours/openhours_controller.dart';
import 'package:verdicci/contact/contact_controller.dart';

import 'package:verdicci/routing/app_router.dart';

class VerdicciAppModule extends Module {
  VerdicciAppModule() {
    bind(WelcomeController);
    bind(StyleController);
    bind(OpenHoursController);
    bind(ContactController);

    bind(MenuComponent);
    bind(NewsComponent);
    bind(XGoogleMaps);
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
