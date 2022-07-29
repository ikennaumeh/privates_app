import 'package:privates_app/core/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PostViewModel extends BaseViewModel{

  final _navigate = locator<NavigationService>();

  void goBack(){
    _navigate.back();
  }

}