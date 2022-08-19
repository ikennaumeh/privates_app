import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:privates_app/core/app/app.locator.dart';
import 'package:privates_app/core/app/app.router.dart';
import 'package:privates_app/core/models/post.dart';
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

  PlatformFile? platformFile;

  void showUser() {
    user = _auth.getUser();
    _showDialog.showDialog(description: "Name: ${user?.displayName}, Email: ${user?.email}");
  }

  Future<void> selectFile() async {
    platformFile = await _image.pickFile();
    if(platformFile == null) return;
    goToPostView();
    notifyListeners();
  }

  ///Read from Fire base
  Stream<List<Post>> readUser() => FirebaseFirestore.instance
      .collection("users").orderBy("timestamp", descending: true)
      .snapshots()
      .map((snapshot) => snapshot.docs.map((docs) => Post.fromJson(docs.data())).toList());

  ///To delete
  Future<void> deleteFromFirebase(String id) async {
    //First reference the document and delete
    final docUser = FirebaseFirestore.instance.collection("// the collection").doc("//the id");
    await docUser.delete();
  }

  void goToPostView(){
    _navigate.navigateTo(Routes.postView, arguments: PostViewArguments(platformFile: platformFile));
  }







}