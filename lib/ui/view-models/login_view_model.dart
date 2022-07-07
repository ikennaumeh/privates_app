import 'package:logger/logger.dart';
import 'package:privates_app/core/app/app.locator.dart';
import 'package:privates_app/core/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel{
  Logger log = Logger();

  final _navigationService = locator<NavigationService>();

  Future<void> login() async {
    setBusy(true);
    notifyListeners();
    try{
      await Future.delayed(const Duration(seconds: 2),(){
        _navigationService.pushNamedAndRemoveUntil(Routes.tabbedView,);
      });
    } catch (e){
      log.e(e);
    } finally{
      setBusy(false);
      notifyListeners();
    }

  }
}