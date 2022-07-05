// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../ui/views/splashview.dart';
import '../../ui/views/welcome_view.dart';

class Routes {
  static const String splashView = '/';
  static const String welcomeView = '/welcome-view';
  static const all = <String>{
    splashView,
    welcomeView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashView, page: SplashView),
    RouteDef(Routes.welcomeView, page: WelcomeView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    SplashView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const SplashView(),
        settings: data,
      );
    },
    WelcomeView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const WelcomeView(),
        settings: data,
      );
    },
  };
}
