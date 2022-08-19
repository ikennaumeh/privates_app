import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:privates_app/core/decorations/color_palette.dart';
import 'package:privates_app/core/decorations/device_scaler.dart';
import 'package:privates_app/core/models/post.dart';
import 'package:privates_app/generated/l10n.dart';
import 'package:privates_app/ui/view-models/post_view_model.dart';
import 'package:privates_app/ui/widgets/button.dart';
import 'package:stacked/stacked.dart';

class PostView extends StatefulWidget {
  final PlatformFile? platformFile;
  const PostView({Key? key, this.platformFile}) : super(key: key);

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  late TextEditingController captionController;

  @override
  void initState() {
    super.initState();
    captionController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostViewModel>.reactive(
      viewModelBuilder: () => PostViewModel(),
      builder: (_, model, __) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100,),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(File("${widget.platformFile?.path}")),
                            )
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        controller: captionController,
                        keyboardType: TextInputType.emailAddress,
                        maxLines: 3,
                        decoration:  InputDecoration(
                          hintText: S.current.write_caption,
                          labelStyle: const TextStyle(
                            color: Palette.darkBlue,
                          ),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,

                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: PrimaryButton(
                    margin: EdgeInsets.only(
                      top: DeviceScaler().scale(43),
                    ),
                    buttonConfig: ButtonConfig(
                      action: () {

                        Post user = Post(name: FirebaseAuth.instance.currentUser?.displayName ?? 'Anonymous', caption: captionController.text, timestamp: Timestamp.now().millisecondsSinceEpoch);

                        model.createPost(user, widget.platformFile);
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
      ),
    );
  }

  @override
  void dispose() {
    captionController.dispose();
    super.dispose();
  }

}


