// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../ui/views/chats_screen_view.dart';
import '../../ui/views/get_number_view.dart';
import '../../ui/views/login_view.dart';
import '../../ui/views/otp_view.dart';
import '../../ui/views/post_view.dart';
import '../../ui/views/register_view.dart';
import '../../ui/views/splashview.dart';
import '../../ui/views/tabbed_view.dart';
import '../../ui/views/welcome_view.dart';
import '../models/chat.dart';

class Routes {
  static const String splashView = '/';
  static const String welcomeView = '/welcome-view';
  static const String getNumberView = '/get-number-view';
  static const String otpView = '/otp-view';
  static const String registerView = '/register-view';
  static const String loginView = '/login-view';
  static const String tabbedView = '/tabbed-view';
  static const String chatScreenView = '/chat-screen-view';
  static const String postView = '/post-view';
  static const all = <String>{
    splashView,
    welcomeView,
    getNumberView,
    otpView,
    registerView,
    loginView,
    tabbedView,
    chatScreenView,
    postView,
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
    RouteDef(Routes.registerView, page: RegisterView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.tabbedView, page: TabbedView),
    RouteDef(Routes.chatScreenView, page: ChatScreenView),
    RouteDef(Routes.postView, page: PostView),
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
          id: args.id,
        ),
        settings: data,
      );
    },
    RegisterView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const RegisterView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const LoginView(),
        settings: data,
      );
    },
    TabbedView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const TabbedView(),
        settings: data,
      );
    },
    ChatScreenView: (data) {
      var args = data.getArgs<ChatScreenViewArguments>(nullOk: false);
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => ChatScreenView(
          key: args.key,
          chat: args.chat,
        ),
        settings: data,
      );
    },
    PostView: (data) {
      var args = data.getArgs<PostViewArguments>(
        orElse: () => PostViewArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => PostView(
          key: args.key,
          platformFile: args.platformFile,
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
  final String id;
  OtpViewArguments({this.key, required this.phoneNumber, required this.id});
}

/// ChatScreenView arguments holder class
class ChatScreenViewArguments {
  final Key? key;
  final Chat chat;
  ChatScreenViewArguments({this.key, required this.chat});
}

/// PostView arguments holder class
class PostViewArguments {
  final Key? key;
  final PlatformFile? platformFile;
  PostViewArguments({this.key, this.platformFile});
}
