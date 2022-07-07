import 'package:privates_app/core/app/app.locator.dart';
import 'package:privates_app/core/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OtpViewModel extends BaseViewModel{

  final _navigationService = locator<NavigationService>();

  Future<void> goToRegistration() async {
    setBusy(true);
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2),(){
      _navigationService.pushNamedAndRemoveUntil(Routes.registerView,);
    });
    setBusy(false);
    notifyListeners();
  }
}