import 'dart:io';

import 'package:privates_app/core/app/app.locator.dart';
import 'package:privates_app/core/services/image_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PostViewModel extends BaseViewModel{

  final _navigate = locator<NavigationService>();
  final _image = locator<ImageService>();

  File? file;

  void goBack(){
    _navigate.back();
  }

  Future<void> pickImage() async {
    file = await _image.selectFromCamera();
    notifyListeners();
  }

}