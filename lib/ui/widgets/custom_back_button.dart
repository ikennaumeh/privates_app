import 'package:flutter/material.dart';
import 'package:privates_app/core/decorations/color_palette.dart';


class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (Navigator.canPop(context)) {
          Navigator.of(context).pop();
        }
      },
      child: const Icon(Icons.arrow_back_ios_new_rounded, color: Palette.black, size: 17,),
    );
  }
}