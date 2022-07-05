import 'package:privates_app/core/app/app.locator.dart';
import 'package:privates_app/core/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class GetNumberViewModel extends BaseViewModel{
  final _navigationService = locator<NavigationService>();

  void goToOtpView(String phone){
    _navigationService.navigateTo(Routes.otpView, arguments: OtpViewArguments(phoneNumber: phone));
  }
}