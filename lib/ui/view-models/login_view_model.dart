import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:privates_app/core/app/app.locator.dart';
import 'package:privates_app/core/app/app.logger.dart';
import 'package:privates_app/core/app/app.router.dart';
import 'package:privates_app/core/services/firebase_auth.dart';
import 'package:privates_app/generated/l10n.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel{
  Logger log = getLogger("LoginViewModel");
  final  _auth = locator<FirebaseService>();
  final _showDialog = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  late User? _user;
  final box = GetStorage();
  bool hide = true;

  void toggleVisibility(){
    hide = !hide;
    notifyListeners();
  }

  Future<void> login({required String email, required String password}) async {
    log.i("Login hit");
    setBusy(true);
    try{
       _user = await _auth.login(email: email, password: password);
      if(_user != null){
        box.write(S.current.id, _user?.uid);
        _navigationService.pushNamedAndRemoveUntil(Routes.tabbedView,);
      }
    } on FirebaseAuthException catch (e){
      log.e(e);
      _showDialog.showDialog(title: S.current.error, description: e.message);
    } catch (e){
      log.e(e);
      _showDialog.showDialog(title: S.current.error, description: S.current.error_message);
    }finally{
      setBusy(false);
    }

  }
}