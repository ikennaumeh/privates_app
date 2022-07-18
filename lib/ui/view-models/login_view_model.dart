import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:privates_app/core/app/app.locator.dart';
import 'package:privates_app/core/app/app.router.dart';
import 'package:privates_app/core/services/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel{
  Logger log = Logger();
  final  _auth = locator<FirebaseService>();
  final _showDialog = locator<DialogService>();
  late User? _user;
  final _navigationService = locator<NavigationService>();

  Future<void> login({required String email, required String password}) async {
    setBusy(true);
    notifyListeners();
    try{
       _user = await _auth.login(email: email, password: password);
      if(_user != null){
        _navigationService.pushNamedAndRemoveUntil(Routes.tabbedView,);
      }
    } on FirebaseAuthException catch (e){
      log.e(e);
      _showDialog.showDialog(title: "Error", description: e.message);
    } finally{
      setBusy(false);
      notifyListeners();
    }

  }
}