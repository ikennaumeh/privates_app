import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:privates_app/core/app/app.locator.dart';
import 'package:privates_app/core/models/post.dart';
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

  Future createPost(Post post, PlatformFile? platformFile) async {

    //upload image first
    final path = "uploads/${platformFile?.name}";
    final file = File(platformFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    final task = ref.putFile(file);
    final snapshot = await task.whenComplete((){});
    final imageLink = await snapshot.ref.getDownloadURL();

    final docUser = FirebaseFirestore.instance.collection("users").doc();
    post.id = docUser.id;
    post.postLink = imageLink;
    await docUser.set(post.toJson());
  }

}