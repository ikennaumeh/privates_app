import 'package:flutter/cupertino.dart';
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
          Expanded(child: GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Container(color: Colors.red,))),
          Container(
            color: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5,),
                    child: TextField(
                      minLines: 1,
                      maxLines: 3,
                      textInputAction: TextInputAction.send,
                      style: const TextStyle(
                        height: 1,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Palette.textFieldFillColor,
                        hintText: "Message",
                        contentPadding: const EdgeInsets.only(left: 20, right: 20, top: 10,bottom: 10),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        )
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5),
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
