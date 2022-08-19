import 'package:flutter/material.dart';
import 'package:privates_app/core/decorations/color_palette.dart';
import 'package:privates_app/core/models/message.dart';

class UserMessage extends StatelessWidget {
  final int index;
  final Message data;
  const UserMessage({Key? key,required this.index,required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            constraints: const BoxConstraints(
              maxWidth: 200,
            ),
            margin: const EdgeInsets.only(right: 10,),
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
            decoration: BoxDecoration(
              color: Palette.primary.withOpacity(.5),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text("${data.value}",
              style: const TextStyle(color: Palette.white),),
          ),
        ],
      ),
    );
  }
}