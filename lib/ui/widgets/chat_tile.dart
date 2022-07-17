import 'package:flutter/material.dart';
import 'package:privates_app/core/decorations/color_palette.dart';
import 'package:privates_app/core/decorations/device_scaler.dart';
import 'package:privates_app/core/models/chat.dart';

class ChatTile extends StatelessWidget {
  final Chat chat;
  const ChatTile({
    Key? key, required this.chat
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.transparent,
      child: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: Palette.white,
                backgroundImage: AssetImage("${chat.image}"),
              ),
              Visibility(
                visible: chat.active,
                child: const CircleAvatar(
                  radius: 10,
                  backgroundColor: Palette.green,
                ),
              ),
            ],
          ),
          const SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${chat.name}",
                style: TextStyle(
                  fontSize: DeviceScaler().scale(15),
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "${chat.status}",
                style: TextStyle(
                  fontSize: DeviceScaler().scale(12),
                  fontWeight: FontWeight.w300,
                  color: chat.status == "Delivered" ? Palette.green : Palette.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}