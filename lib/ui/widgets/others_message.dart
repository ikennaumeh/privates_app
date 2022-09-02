import 'package:flutter/material.dart';
import 'package:privates_app/core/decorations/color_palette.dart';
import 'package:privates_app/core/decorations/device_scaler.dart';
import 'package:privates_app/core/models/message.dart';

class OthersMessage extends StatelessWidget {
  final int index;
  final Message data;
  final bool hasPadding;
  const OthersMessage({Key? key,required this.index,required this.data, this.hasPadding = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4, left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            constraints: const BoxConstraints(
              maxWidth: 200,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
            child: Text("${data.value}", style: TextStyle(
              color: Palette.black,
              fontSize: DeviceScaler().scaleFont(16),
              fontWeight: FontWeight.w500,
            ),),
          ),
        ],
      ),
    );
  }
}