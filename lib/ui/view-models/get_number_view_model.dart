import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:privates_app/core/app/app.locator.dart';
import 'package:privates_app/core/app/app.router.dart';
import 'package:privates_app/core/models/phone_number.dart';
import 'package:privates_app/ui/utilities/phone_util.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class GetNumberViewModel extends BaseViewModel{
  Logger log = Logger();
  final _navigationService = locator<NavigationService>();
  final _phoneUtil = locator<PhoneUtil>();
  final _showDialog = locator<DialogService>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> goToOtpView(PhoneNumber phone) async {
    setBusy(true);
     try{
       bool isValid = await _phoneUtil.isValidPhoneNumber(
         phoneNumber: phone.completeNumber,
         isoCode: phone.countryISOCode,
       );

       if (!isValid) {
         log.e('Error in validating inputted phone number');
         _showDialog.showDialog(title: "Error", description: "Wrong phone number");
         return;
       }

       String? phoneNumber = await _phoneUtil.normalize(
         phoneNumber: phone.completeNumber,
         isoCode: phone.countryISOCode,
       );

       await _auth.verifyPhoneNumber(
         phoneNumber: "$phoneNumber",
         verificationCompleted: (phoneCredentials) async {

         },
         verificationFailed: (verificationFailed) async {
           _showDialog.showDialog(title: "Error", description: verificationFailed.message);
         },
         codeSent: (verificationId, resendToken) async {
           _navigationService.navigateTo(Routes.otpView, arguments: OtpViewArguments(phoneNumber: "$phoneNumber", id: verificationId));
         },
         codeAutoRetrievalTimeout: (verificationId) async {},
       );
     } on FirebaseAuthException catch (e){
       log.e(e);
       _showDialog.showDialog(title: "Error", description: e.message);
     } finally {
       setBusy(false);
     }


  }
}