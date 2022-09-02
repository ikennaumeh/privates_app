import 'dart:async';

import 'package:get_storage/get_storage.dart';
import 'package:privates_app/core/app/app.locator.dart';
import 'package:privates_app/core/app/app.router.dart';
import 'package:privates_app/generated/l10n.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel{

  final _navigationService = locator<NavigationService>();
  final box = GetStorage();

  void _initialize(){
    String? id = box.read(S.current.id);
    if(id == null) {
      _navigationService.pushNamedAndRemoveUntil(Routes.welcomeView);
      return;
    }
    _navigationService.pushNamedAndRemoveUntil(Routes.tabbedView);
    return;
  }

  Future<void> startUpLogic() async {
    Duration duration = const Duration(seconds: 5);
    Timer(duration, _initialize);
  }

}