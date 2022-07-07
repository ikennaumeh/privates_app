import 'package:privates_app/core/app/app.locator.dart';
import 'package:privates_app/core/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RegisterViewModel extends BaseViewModel{

  final _navigationService = locator<NavigationService>();

  Future<void> register() async {
    setBusy(true);
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2),(){
      _navigationService.pushNamedAndRemoveUntil(Routes.loginView,);
    });
    setBusy(false);
    notifyListeners();
  }

}