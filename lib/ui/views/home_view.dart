import 'package:flutter/material.dart';
import 'package:privates_app/core/decorations/color_palette.dart';
import 'package:privates_app/core/decorations/device_scaler.dart';
import 'package:privates_app/generated/l10n.dart';
import 'package:privates_app/ui/view-models/home_view_model.dart';
import 'package:privates_app/ui/widgets/post_widget.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

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
      body: ViewModelBuilder.reactive(viewModelBuilder: () => HomeViewModel(), builder: (_,model,__){
        Widget body = SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, top: DeviceScaler().scale(10)),
                child: Text(
                  S.current.suggestions,
                  style: TextStyle(
                    color: Palette.lightBlue,
                    fontSize: DeviceScaler().scaleFont(14),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const PostWidget(imageUrl: "assets/png/photo1.png",),
              SizedBox(
                height: DeviceScaler().scale(90),
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Image.asset("assets/png/story2.png"),
                    Image.asset("assets/png/story3.png"),
                    Image.asset("assets/png/story1.png"),
                    Image.asset("assets/png/story4.png"),
                    Image.asset("assets/png/story1.png"),
                    Image.asset("assets/png/story4.png"),
                  ],
                ),
              ),
              const PostWidget(imageUrl: "assets/png/photo2.png",),
              const PostWidget(imageUrl: "assets/png/photo3.png",),
              Padding(
                padding: EdgeInsets.only(left: 20, top: DeviceScaler().scale(20), bottom: DeviceScaler().scale(10)),
                child: Text(
                  S.current.people_who_might_interest_you,
                  style: TextStyle(
                    color: Palette.lightBlue,
                    fontSize: DeviceScaler().scaleFont(14),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: DeviceScaler().scale(205),
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: 150,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.symmetric(vertical: DeviceScaler().scale(10)),
                      decoration: BoxDecoration(
                          color: Palette.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 50,
                                offset: Offset(0,0),
                                color: Palette.lightShadowGrey
                            )
                          ]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset("assets/png/big-photo.png"),
                          Text(
                            "Billy Morgan",
                            style: TextStyle(
                              color: Palette.black,
                              fontSize: DeviceScaler().scaleFont(14),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: DeviceScaler().scale(3),),
                          Text(
                            "Actress , Life coach, \nphilanthropist",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Palette.grey,
                              fontSize: DeviceScaler().scaleFont(10),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: DeviceScaler().scale(5),),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: DeviceScaler().scale(7)),
                            decoration: BoxDecoration(
                              color: Palette.primary,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Text(
                              'Send Privates',
                              style: TextStyle(
                                  color: Palette.white,
                                  fontSize: DeviceScaler().scaleFont(10)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 150,
                      padding: EdgeInsets.symmetric(vertical: DeviceScaler().scale(10)),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Palette.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 50,
                                offset: Offset(0,0),
                                color: Palette.lightShadowGrey
                            )
                          ]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset("assets/png/big-photo2.png"),
                          Text(
                            "Angel Freeman",
                            style: TextStyle(
                              color: Palette.black,
                              fontSize: DeviceScaler().scaleFont(14),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: DeviceScaler().scale(3),),
                          Text(
                            "Actress , Life coach, \nphilanthropist",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Palette.grey,
                              fontSize: DeviceScaler().scaleFont(10),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: DeviceScaler().scale(5),),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: DeviceScaler().scale(7)),
                            decoration: BoxDecoration(
                              color: Palette.primary,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Text(
                              'Send Privates',
                              style: TextStyle(
                                  color: Palette.white,
                                  fontSize: DeviceScaler().scaleFont(10)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 150,
                      padding: EdgeInsets.symmetric(vertical: DeviceScaler().scale(10)),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Palette.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 50,
                                offset: Offset(0,0),
                                color: Palette.lightShadowGrey
                            )
                          ]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset("assets/png/big-photo.png"),
                          Text(
                            "Billy Morgan",
                            style: TextStyle(
                              color: Palette.black,
                              fontSize: DeviceScaler().scaleFont(14),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: DeviceScaler().scale(3),),
                          Text(
                            "Actress , Life coach, \nphilanthropist",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Palette.grey,
                              fontSize: DeviceScaler().scaleFont(10),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: DeviceScaler().scale(5),),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: DeviceScaler().scale(7)),
                            decoration: BoxDecoration(
                              color: Palette.primary,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Text(
                              'Send Privates',
                              style: TextStyle(
                                  color: Palette.white,
                                  fontSize: DeviceScaler().scaleFont(10)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const PostWidget(imageUrl: "assets/png/photo2.png",),
              const PostWidget(imageUrl: "assets/png/photo3.png",),

            ],
          ),
        );

        List<Widget> stackChildren = [body];

        return Stack(children: stackChildren,);
      }),
    );
  }
}


