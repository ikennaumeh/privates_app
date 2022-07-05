// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../ui/views/get_number_view.dart';
import '../../ui/views/otp_view.dart';
import '../../ui/views/splashview.dart';
import '../../ui/views/welcome_view.dart';

class Routes {
  static const String splashView = '/';
  static const String welcomeView = '/welcome-view';
  static const String getNumberView = '/get-number-view';
  static const String otpView = '/otp-view';
  static const all = <String>{
    splashView,
    welcomeView,
    getNumberView,
    otpView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashView, page: SplashView),
    RouteDef(Routes.welcomeView, page: WelcomeView),
    RouteDef(Routes.getNumberView, page: GetNumberView),
    RouteDef(Routes.otpView, page: OtpView),
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
    GetNumberView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const GetNumberView(),
        settings: data,
      );
    },
    OtpView: (data) {
      var args = data.getArgs<OtpViewArguments>(nullOk: false);
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => OtpView(
          key: args.key,
          phoneNumber: args.phoneNumber,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// OtpView arguments holder class
class OtpViewArguments {
  final Key? key;
  final String phoneNumber;
  OtpViewArguments({this.key, required this.phoneNumber});
}
