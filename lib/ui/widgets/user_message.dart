import 'package:flutter/material.dart';
import 'package:privates_app/core/decorations/color_palette.dart';
import 'package:privates_app/core/decorations/device_scaler.dart';
import 'package:privates_app/core/models/message.dart';

class UserMessage extends StatelessWidget {
  final int index;
  final Message data;
  const UserMessage({Key? key,required this.index,required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            constraints: const BoxConstraints(
              maxWidth: 200,
            ),
            margin: const EdgeInsets.only(right: 10,),
            child: Text("${data.value}",
              style: TextStyle(
                  color: Palette.primary,
                  fontSize: DeviceScaler().scaleFont(16),
                  fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}