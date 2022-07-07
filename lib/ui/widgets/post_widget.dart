import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:privates_app/core/decorations/color_palette.dart';
import 'package:privates_app/core/decorations/device_scaler.dart';

class PostWidget extends StatelessWidget {
  final String imageUrl;
  const PostWidget({
    Key? key, required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: DeviceScaler().scale(190),
              margin: EdgeInsets.only(left: 11, right: 11, top: DeviceScaler().scale(13)),
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: const Radius.circular(10), topLeft: const Radius.circular(10)),
                  image: DecorationImage(
                      image: AssetImage(imageUrl),
                      fit: BoxFit.fill
                  )
              ),

            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                width: double.maxFinite,
                margin: const EdgeInsets.only(left: 11, right: 11,),
                padding: EdgeInsets.symmetric(horizontal: 28, vertical: DeviceScaler().scale(15)),
                color: Palette.primary.withOpacity(.38),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Star Girl 005',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: DeviceScaler().scaleFont(12),
                              color: Palette.white
                          ),
                        ),
                        const SizedBox(width: 5,),
                        SvgPicture.asset("assets/svg/p-icon.svg", width: 18,),
                      ],
                    ),
                    Text(
                      '@stargirlriri',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: DeviceScaler().scaleFont(10),
                          color: Palette.white
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          margin:  EdgeInsets.only(left: 11, right: 11, bottom: DeviceScaler().scale(10),),
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: DeviceScaler().scale(13)),
          decoration: const BoxDecoration(
            color: Palette.white,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    blurRadius: 160,
                    offset: Offset(0,4.28),
                    color: Palette.lightShadowGrey
                )
              ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Shhh! 🎙️Get milkshakes with @willowwhispers as Mia Wallace in this Pulp Fiction-inspired ASMR cosplay.For more ASMR videos, watch Willow Whispers on OFTV: https://of.tv/creators/willow-whispers/",
                style: TextStyle(
                  color: Palette.black,
                  fontSize: DeviceScaler().scaleFont(12),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: DeviceScaler().scale(10),),
              Row(
                children: [
                  InkWell(
                    child: Row(
                      children: [
                        const Icon(Icons.favorite_outline_rounded, size: 22,),
                        const SizedBox(width: 5,),
                        Text('Likes (32)',style: TextStyle(fontWeight: FontWeight.w500, fontSize: DeviceScaler().scaleFont(14)),)
                      ],
                    ),
                  ),
                  const SizedBox(width: 10,),
                  InkWell(
                    child: Row(
                      children: [
                        Text('Comments (2.4k)',style: TextStyle(fontWeight: FontWeight.w500, fontSize: DeviceScaler().scaleFont(14)),),
                        const SizedBox(width: 5,),
                        SvgPicture.asset("assets/svg/comment.svg"),


                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),

        ),
      ],
    );
  }
}