import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:privates_app/core/decorations/color_palette.dart';
import 'package:privates_app/core/decorations/device_scaler.dart';
import 'package:privates_app/core/models/chat.dart';
import 'package:privates_app/core/models/message.dart';
import 'package:privates_app/ui/view-models/chats_view_model.dart';
import 'package:privates_app/ui/widgets/custom_back_button.dart';
import 'package:privates_app/ui/widgets/others_message.dart';
import 'package:privates_app/ui/widgets/user_message.dart';
import 'package:stacked/stacked.dart';
import 'package:timeago/timeago.dart' as timeago;

class ChatScreenView extends StatefulWidget {
  final Chat chat;
  const ChatScreenView({Key? key,required this.chat}) : super(key: key);

  @override
  _ChatScreenViewState createState() => _ChatScreenViewState();
}

class _ChatScreenViewState extends State<ChatScreenView> {

  late TextEditingController _message;

  @override
  void initState() {
    super.initState();
    _message = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
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
      body: ViewModelBuilder<ChatsViewModel>.reactive(
        viewModelBuilder: () => ChatsViewModel(),
        builder: (_, model, __) => Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(

              stream: FirebaseFirestore.instance.collection("chat_messages")
                  .orderBy("timestamp", descending: false).snapshots(),

              builder: (context, snapshot){
                if(snapshot.hasData){
                  if(snapshot.data!.docs.isEmpty){
                    return const Center(child: Text("No messages"),);
                  }
                  return MessageWall(messages: snapshot.data!.docs);
                }
                return const Center(child: CircularProgressIndicator(),);
              },
            ),
          ),
          ColoredBox(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5,),
                      child: TextField(
                        controller: _message,
                        minLines: 1,
                        maxLines: 10,
                        textInputAction: TextInputAction.send,
                        onSubmitted: (value){
                          if(value.isNotEmpty){
                            _send(value);
                          }
                        },
                        style: const TextStyle(
                          height: 1,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Palette.textFieldFillColor,
                          hintText: "Type a message",
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),

                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: SvgPicture.asset(
                      "assets/svg/send-media.svg",
                      width: 35,
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),),
    );
  }

  Future<void> _send(String text) async {
    if (kDebugMode) {
      final user = FirebaseAuth.instance.currentUser;
      if(user != null){
        Message message = Message(
          author: user.displayName ?? "Anonymous",
          authorId: user.uid,
          photoUrl: user.photoURL ?? "https://placehold.it/100x100",
          timestamp: Timestamp.now().millisecondsSinceEpoch,
          value: text,
        );
        await FirebaseFirestore.instance.collection("chat_messages").add(message.toJson());
      }
      text = '';
      _message.clear();
    }
  }

  @override
  void dispose() {
    _message.dispose();
    super.dispose();
  }
}

class MessageWall extends StatelessWidget {
  final List<QueryDocumentSnapshot> messages;

  const MessageWall({Key? key,required this.messages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: messages.length,
      padding: const EdgeInsets.only(top: 5),
      itemBuilder: (c,i){
        Message message = Message.fromJson(messages.elementAt(i).data() as Map<String, dynamic>);

        final user = FirebaseAuth.instance.currentUser;

        if(user != null && user.uid == message.authorId){
          return Dismissible(
              onDismissed: (_){
                _onDelete(messages.elementAt(i).id);
              },
              key: ValueKey(message.timestamp),
              child: UserMessage(index: i, data: message));
        }
        return OthersMessage(index: i, data: message);
      },
      separatorBuilder: (c,i){
        return SizedBox(height: DeviceScaler().scale(5),);
      },
    );
  }

  Future<void> _onDelete(String docId) async {
    await FirebaseFirestore.instance.collection("chat_messages").doc(docId).delete();
  }
}








