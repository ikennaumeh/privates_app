import 'package:privates/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void googleSignIn() {}

  void appleSignIn() {}

  void createAccount (){}

  void login(){}
}
