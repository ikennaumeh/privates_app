import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:privates_app/core/decorations/color_palette.dart';
import 'package:privates_app/core/decorations/device_scaler.dart';
import 'package:privates_app/core/models/post.dart';


class PostWidget extends StatelessWidget {
  final Post data;
  const PostWidget({
    Key? key, required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: DeviceScaler().scale(330),
              margin: EdgeInsets.only(left: 11, right: 11, top: DeviceScaler().scale(13)),
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                  image: DecorationImage(
                      image: NetworkImage('${data.postLink}'),
                      fit: BoxFit.cover
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
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: DeviceScaler().scale(15)),
                color: Palette.primary.withOpacity(.38),
                child: Row(
                  children: [
                    Text(
                      data.name,
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
                data.caption,
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