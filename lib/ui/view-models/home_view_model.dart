import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:privates_app/core/app/app.locator.dart';
import 'package:privates_app/core/app/app.router.dart';
import 'package:privates_app/core/services/firebase_auth.dart';
import 'package:privates_app/core/services/image_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel{
  final  _auth = locator<FirebaseService>();
  final _showDialog = locator<DialogService>();
  final _navigate = locator<NavigationService>();
  final _image = locator<ImageService>();

  late User? user;
  File? file;

  PlatformFile? platformFile;

  void showUser() {
    user = _auth.getUser();
    _showDialog.showDialog(description: "Name: ${user?.displayName}, Email: ${user?.email}");
  }

  Future<void> pickImage() async {
    file = await _image.selectFromCamera();
    goToPostView();
    notifyListeners();
  }

  Future<void> selectFile() async {
    platformFile = await _image.pickFile();
    goToPostView();
    notifyListeners();
  }

  void goToPostView(){
    _navigate.navigateTo(Routes.postView, arguments: PostViewArguments(file: file, platformFile: platformFile));
  }







}