import 'package:flutter/material.dart';
import 'package:privates_app/core/decorations/color_palette.dart';
import 'package:privates_app/core/decorations/device_scaler.dart';

class AddUserWidget extends StatelessWidget {
  final String imageUrl;

  const AddUserWidget({
    Key? key,required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Image.asset(imageUrl),
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
    );
  }
}