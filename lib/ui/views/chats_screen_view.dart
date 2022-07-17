import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:privates_app/core/decorations/color_palette.dart';
import 'package:privates_app/core/decorations/device_scaler.dart';
import 'package:privates_app/core/models/chat.dart';
import 'package:privates_app/ui/widgets/custom_back_button.dart';
import 'package:timeago/timeago.dart' as timeago;

class ChatScreenView extends StatefulWidget {
  final Chat chat;
  const ChatScreenView({Key? key,required this.chat}) : super(key: key);

  @override
  _ChatScreenViewState createState() => _ChatScreenViewState();
}

class _ChatScreenViewState extends State<ChatScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.red,
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${widget.chat.name}",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: DeviceScaler().scaleFont(18),
                color: Palette.black
              ),
            ),
            Builder(
              builder: (context){
                final loadedTime = widget.chat.lastSeen;
                final now = DateTime.now();
                final difference = now.difference(loadedTime!);
                if(widget.chat.active){
                  return Row(
                    children: [
                      Text(
                        "Active now",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: DeviceScaler().scaleFont(11.5),
                            color: Palette.black
                        ),
                      ),
                      const SizedBox(width: 5,),
                      const CircleAvatar(radius: 3, backgroundColor: Palette.green,)
                    ],
                  );
                }
                return Text(
                  "Last seen ${timeago.format(now.subtract(difference))}",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: DeviceScaler().scaleFont(11.5),
                      color: Palette.black
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(child: Container(color: Colors.red,)),
          Container(
            height: 55,
            margin: const EdgeInsets.only(bottom: 5),
            child: Row(
              children: [
                const SizedBox(width: 5,),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Palette.textFieldFillColor,
                      hintText: "Message",
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(30),
                      )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SvgPicture.asset("assets/svg/send-media.svg", width: 35,),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
