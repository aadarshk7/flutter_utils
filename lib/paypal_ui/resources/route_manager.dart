import 'package:flutter/material.dart' show AppBar, Center, MaterialPageRoute, Route, RouteSettings, Scaffold, Text, Widget;

import '../presentation/pages/splash_page/splash_page.dart';
import 'string_manager.dart';

enum AppRoute {
  splashPage('/', SplashPage());
  // loginPage('/login_page', LoginPage()),
  // registerPage('/resigter_page', RegisterPage()),
  // nextStationPage('/next_station', NextStation()),
  // homePage('/home_page', HomePage());

  final String path;
  final Widget page;

  const AppRoute(this.path, this.page);

  static AppRoute get initialRoute => AppRoute.splashPage;

  static final _routeNameMap = AppRoute.values.asNameMap();
  static final _routePathMap = Map.fromEntries(
    _routeNameMap.entries.map(
      (entry) => MapEntry(entry.value.path, entry.value),
    ),
  );

  static AppRoute? fromName(String? name) => _routePathMap[name];

  static Widget _getWidget(
    RouteSettings routeSettings,
  ) {
    final routeSettingsName = routeSettings.name;

    return AppRoute.fromName(routeSettingsName)?.page ?? undefinedRoute();
  }

  static Route<dynamic> getRoute(
    RouteSettings routeSettings,
  ) {
    return MaterialPageRoute(
      builder: (context) => _getWidget(routeSettings),
    );
  }

  static Widget undefinedRoute() {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppString.noRouteFound),
      ),
      body: const Center(
        child: Text(AppString.noRouteFound),
      ),
    );
  }
}
