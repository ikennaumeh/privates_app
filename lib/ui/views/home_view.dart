import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:privates_app/core/decorations/color_palette.dart';
import 'package:privates_app/core/decorations/device_scaler.dart';
import 'package:privates_app/core/models/post.dart';
import 'package:privates_app/generated/l10n.dart';
import 'package:privates_app/ui/view-models/home_view_model.dart';
import 'package:privates_app/ui/views/post_view.dart';
import 'package:privates_app/ui/widgets/add_user_widget.dart';
import 'package:privates_app/ui/widgets/post_widget.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeViewModel _model;

  @override
  void initState() {
    super.initState();
    _model = HomeViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.lightShadowGrey,
      appBar: AppBar(
        title: Text(
          S.current.privates,
          style: TextStyle(
            color: Palette.primary,
            fontWeight: FontWeight.w900,
            fontSize: DeviceScaler().scaleFont(20),
          ),
        ),
        actions: [
          Image.asset("assets/png/photo.png"),
        ],
      ),
      body: ViewModelBuilder<HomeViewModel>.reactive(
          viewModelBuilder: () => HomeViewModel(),
          builder: (_, model, __) {
            Widget body = SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StreamBuilder<List<Post>>(
                    stream: model.readUser(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text("Something went wrong ${snapshot.error}"),
                        );
                      } else if (snapshot.hasData) {
                        final posts = snapshot.data!;
                        return ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: posts
                              .map((post) => PostWidget(data: post))
                              .toList(),
                        );
                      }
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: const [
                          Center(
                            child: CircularProgressIndicator(),
                          ),
                        ],
                      );
                    },
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 20, top: DeviceScaler().scale(10)),
                  //   child: Text(
                  //     S.current.suggestions,
                  //     style: TextStyle(
                  //       color: Palette.lightBlue,
                  //       fontSize: DeviceScaler().scaleFont(14),
                  //       fontWeight: FontWeight.w500,
                  //     ),
                  //   ),
                  // ),
                  // const PostWidget(imageUrl: "assets/png/photo1.png",),
                  // SizedBox(
                  //   height: DeviceScaler().scale(90),
                  //   child: ListView(
                  //     shrinkWrap: true,
                  //     scrollDirection: Axis.horizontal,
                  //     children: [
                  //       Image.asset("assets/png/story2.png"),
                  //       Image.asset("assets/png/story3.png"),
                  //       Image.asset("assets/png/story1.png"),
                  //       Image.asset("assets/png/story4.png"),
                  //       Image.asset("assets/png/story1.png"),
                  //       Image.asset("assets/png/story4.png"),
                  //     ],
                  //   ),
                  // ),
                  // const PostWidget(imageUrl: "assets/png/photo2.png",),
                  // const PostWidget(imageUrl: "assets/png/photo3.png",),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 20, top: DeviceScaler().scale(20), bottom: DeviceScaler().scale(10)),
                  //   child: Text(
                  //     S.current.people_who_might_interest_you,
                  //     style: TextStyle(
                  //       color: Palette.lightBlue,
                  //       fontSize: DeviceScaler().scaleFont(14),
                  //       fontWeight: FontWeight.w500,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: DeviceScaler().scale(205),
                  //   child: ListView(
                  //     shrinkWrap: true,
                  //     scrollDirection: Axis.horizontal,
                  //     children: const [
                  //       AddUserWidget(imageUrl: "assets/png/big-photo.png",),
                  //       AddUserWidget(imageUrl: "assets/png/big-photo2.png",),
                  //       AddUserWidget(imageUrl: "assets/png/big-photo.png",),
                  //       AddUserWidget(imageUrl: "assets/png/big-photo2.png",),
                  //
                  //     ],
                  //   ),
                  // ),
                  // const PostWidget(imageUrl: "assets/png/photo2.png",),
                  // const PostWidget(imageUrl: "assets/png/photo3.png",),
                ],
              ),
            );

            List<Widget> stackChildren = [body];

            return Stack(
              children: stackChildren,
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Palette.primary,
        onPressed: _model.selectFile,
        child: SvgPicture.asset(
          "assets/svg/post.svg",
          color: Palette.white,
        ),
      ),
    );
  }
}
