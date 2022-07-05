import 'dart:async';

import 'package:privates_app/core/app/app.locator.dart';
import 'package:privates_app/core/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel{

  final _navigationService = locator<NavigationService>();

  void _actionRouteHomeView(){
    _navigationService.pushNamedAndRemoveUntil(Routes.welcomeView);
  }

  Future<void> startUpLogic() async {
    Duration duration = const Duration(seconds: 5);
    Timer(duration, _actionRouteHomeView);
  }

}