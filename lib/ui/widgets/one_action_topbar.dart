import 'package:flutter/material.dart';
import 'package:privates_app/core/decorations/color_palette.dart';
import 'package:privates_app/core/decorations/device_scaler.dart';


class OneActionAppBar extends StatelessWidget {
  final IconData iconData;
  final VoidCallback? onActionPress;
  final double height;
  final bool hasBackBtnShadow;

  const OneActionAppBar(
      {Key? key, this.iconData = Icons.arrow_back_ios_new_rounded,
      this.onActionPress,
      this.height = 56,
      this.hasBackBtnShadow = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      color: Colors.white,
      padding: const EdgeInsets.only(left: 0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          List<Widget> children = [
            BackButton(
              iconData: iconData,
              onBackPress: onActionPress,
              hasShadow: hasBackBtnShadow,
            )
          ];

          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          );
        },
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  final IconData? iconData;
  final VoidCallback? onBackPress;
  final bool hasShadow;


  const BackButton({Key? key, this.iconData, this.onBackPress, this.hasShadow = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: hasShadow ? [Palette.buttonShadow] : null,
      ),
      margin: const EdgeInsets.only(left: 15.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          customBorder: const CircleBorder(),
          splashColor: Palette.hintLightGrey,
          onTap: onBackPress ?? () {
            if (Navigator.canPop(context)) {
              Navigator.of(context).pop();
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Icon(
              iconData ?? Icons.arrow_back,
              size: 20,
              color: Palette.black,
            ),
          ),
        ),
      ),
    );
  }
}

class TopBarWithSearch extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;


  const TopBarWithSearch({Key? key, required this.controller, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const BackButton(hasShadow: false,),

          Expanded(
            child: SearchTextField(
              controller: controller,
              hintText: hintText,
            ),
          )
        ],
      ),
    );
  }
}


class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;


  const SearchTextField({Key? key, required this.controller, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Palette.lightShadowGrey,
        borderRadius: BorderRadius.circular(25.0),
      ),
      margin: const EdgeInsets.only(left: 10, right: 20),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 15.0,
        ),
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          suffixIcon: const Icon(
            Icons.search,
            size: 25.0,
            color: Palette.primary,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(left: 20, top: 15, bottom: 12),
          hintText: hintText,
          hintMaxLines: 1,
          hintStyle: TextStyle(
            fontSize: DeviceScaler().scaleFont(15),
          ),
        ),
      ),
    );
  }
}
