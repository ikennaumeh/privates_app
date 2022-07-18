import 'package:firebase_auth/firebase_auth.dart';
import 'package:privates_app/core/app/app.locator.dart';
import 'package:privates_app/core/app/app.router.dart';
import 'package:privates_app/core/services/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RegisterViewModel extends BaseViewModel{

  final _navigationService = locator<NavigationService>();
  final  _auth = locator<FirebaseService>();
  final _showDialog = locator<DialogService>();
  late User? _user;

  Future<void> register({required String email, required String password, required String fullName}) async {
    setBusy(true);
    notifyListeners();
    try{
      _user = await _auth.registerUser(email: email, password: password).whenComplete(() async {
        await _auth.setFullName(fullName: fullName);
      });

      if(_user != null){
        _navigationService.pushNamedAndRemoveUntil(Routes.loginView,);

      }
    } on FirebaseAuthException catch (e){
      _showDialog.showDialog(title: "Error", description: e.message);
    } finally {
      setBusy(false);
      notifyListeners();
    }


  }

}