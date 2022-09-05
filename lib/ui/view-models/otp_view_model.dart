import 'package:firebase_auth/firebase_auth.dart';
import 'package:privates_app/core/app/app.locator.dart';
import 'package:privates_app/core/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OtpViewModel extends BaseViewModel{

  final _navigationService = locator<NavigationService>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _showDialog = locator<DialogService>();

  Future<void> goToRegistration(PhoneAuthCredential phoneAuth) async {
    setBusy(true);
    try{
      final auth = await _auth.signInWithCredential(phoneAuth);
      if(auth.user != null){
        _navigationService.pushNamedAndRemoveUntil(Routes.registerView,);
      }
    } on FirebaseAuthException catch (e){
      _showDialog.showDialog(title: "Error", description: e.message);
    } finally {
      setBusy(false);
    }

  }
}