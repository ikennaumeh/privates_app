import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:privates_app/core/decorations/color_palette.dart';
import 'package:privates_app/core/decorations/device_scaler.dart';
import 'package:privates_app/core/models/chat.dart';
import 'package:privates_app/generated/l10n.dart';
import 'package:privates_app/ui/view-models/chats_view_model.dart';
import 'package:privates_app/ui/widgets/chat_tile.dart';
import 'package:privates_app/ui/widgets/full_screen_loading_indicator.dart';
import 'package:stacked/stacked.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelBuilder<ChatsViewModel>.reactive(
          viewModelBuilder: () => ChatsViewModel(),
          builder: (_,model,__){
            Widget body = Column(
              children: [
                Container(
                  width: double.maxFinite,
                  height: DeviceScaler().scale(175),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Palette.primary,
                        Palette.black
                      ],
                    )
                  ),
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          S.current.chats,
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: DeviceScaler().scaleFont(28),
                            color: Palette.white,
                          ),
                        ),
                        SizedBox(height: DeviceScaler().scale(15),),
                        Container(
                          constraints: BoxConstraints(
                            maxHeight: DeviceScaler().scale(50)
                          ),
                          margin: EdgeInsets.only(bottom: DeviceScaler().scale(14)),
                          child: TextFormField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Palette.searchFillColor,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SvgPicture.asset("assets/svg/search.svg",),
                                ),
                                hintText: S.current.search,
                                hintStyle: TextStyle(
                                  fontSize: DeviceScaler().scaleFont(14),
                                  fontWeight: FontWeight.w500,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(color: Palette.searchFillColor)
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(color: Palette.searchFillColor)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(color: Palette.searchFillColor)
                                )
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: DeviceScaler().scale(10)),
                    physics: const BouncingScrollPhysics(),
                    itemCount: model.chats.length,
                    itemBuilder: (c,i){
                      Chat chat = model.chats.elementAt(i);
                      return GestureDetector(
                          onTap: () => model.goToChatScreen(chat),
                          child: ChatTile(chat: chat));
                    },
                    separatorBuilder: (c,i){
                      return SizedBox(height: DeviceScaler().scale(10),);
                    },
                  ),
                ),


              ],
            );
            List<Widget> stackChildren = [body];

            if(model.isBusy){
              stackChildren.add(const FullScreenProgressIndicator());
            }

            return Stack(children: stackChildren,);
          }),
    );
  }
}


