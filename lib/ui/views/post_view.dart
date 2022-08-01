import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:privates_app/core/decorations/color_palette.dart';
import 'package:privates_app/core/decorations/device_scaler.dart';
import 'package:privates_app/generated/l10n.dart';
import 'package:privates_app/ui/view-models/post_view_model.dart';
import 'package:privates_app/ui/widgets/button.dart';
import 'package:stacked/stacked.dart';

class PostView extends StatefulWidget {
  final File? file;
  final PlatformFile? platformFile;
  const PostView({Key? key, this.file, this.platformFile}) : super(key: key);

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _profession = TextEditingController();
  late PostViewModel _model;

  @override
  void initState() {
    _model = PostViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostViewModel>.reactive(
      viewModelBuilder: () => PostViewModel(),
      builder: (_, model, __) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 100,),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(File("${widget.platformFile?.path}")),
                    )
                ),
              ),
              TextFormField(
                controller: _name,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Text",
                  labelStyle: TextStyle(
                    color: Palette.darkBlue,
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Palette.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Palette.primary)),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Palette.red)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Palette.red)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                child: TextFormField(
                  controller: _profession,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Text",
                    labelStyle: TextStyle(
                      color: Palette.darkBlue,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Palette.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Palette.primary)),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Palette.red)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Palette.red)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: PrimaryButton(
                  margin: EdgeInsets.only(
                    top: DeviceScaler().scale(43),
                  ),
                  buttonConfig: ButtonConfig(
                    action: () {

                      Upload user = Upload(name: _name.text, profession: _profession.text);

                      createPost(user);
                      model.goBack();
                    },
                    text: S.current.post,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future createPost(Upload user) async {

    //upload image first
    final path = "uploads/${widget.platformFile?.name}";
    final file = File(widget.platformFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    final task = ref.putFile(file);
    final snapshot = await task.whenComplete((){});
    final imageLink = await snapshot.ref.getDownloadURL();

    final docUser = FirebaseFirestore.instance.collection("users").doc();
    user.id = docUser.id;
    user.postLink = imageLink;
    await docUser.set(user.toJson());
  }

}

class Upload {
  String? id;
  final String name;
  final String profession;
  String? postLink;
  final DateTime? time;

  Upload({this.id = '', required this.name, required this.profession,  this.time, this.postLink});

  Map<String, dynamic> toJson() =>
      {"id": id, "name": name, "profession": profession, "time": DateTime.now(), "postLink": postLink};

  static Upload fromJson(Map<String, dynamic> json) => Upload(
        id: json['id'],
        name: json['name'],
        profession: json['profession'],
        postLink: json['postLink']

      );
}
