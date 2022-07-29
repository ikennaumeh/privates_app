import 'package:firebase_auth/firebase_auth.dart';
import 'package:privates_app/core/app/app.locator.dart';
import 'package:privates_app/core/app/app.router.dart';
import 'package:privates_app/core/services/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel{
  final  _auth = locator<FirebaseService>();
  final _showDialog = locator<DialogService>();
  final _navigate = locator<NavigationService>();

  late User? user;

  void showUser() {
    user = _auth.getUser();
    _showDialog.showDialog(description: "Name: ${user?.displayName}, Email: ${user?.email}");
  }

  void goToPostView(){
    _navigate.navigateTo(Routes.postView);
  }


}