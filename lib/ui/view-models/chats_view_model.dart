import 'package:privates_app/core/app/app.locator.dart';
import 'package:privates_app/core/app/app.router.dart';
import 'package:privates_app/core/models/chat.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChatsViewModel extends BaseViewModel{

  final _navigationService = locator<NavigationService>();

  List<Chat> chats = [
    Chat(name: "Cristano Ronaldo", image: "assets/png/chat1.png", status: "Delivered", active: true,lastSeen: DateTime.now()),
    Chat(name: "Lionel Messi", image: "assets/png/chat2.png", status: "Received", lastSeen: DateTime.now()),
    Chat(name: "Giannis Adetokunmbo", image: "assets/png/chat3.png", status: "Seen", lastSeen: DateTime.now()),
    Chat(name: "Lebron James", image: "assets/png/chat4.png", status: "Received", active: true, lastSeen: DateTime.now()),
    Chat(name: "Demar DeRozan", image: "assets/png/chat5.png", status: "Seen", lastSeen: DateTime.now()),
    Chat(name: "Steph Curry", image: "assets/png/chat6.png", status: "Received", active: true, lastSeen: DateTime.now()),
    Chat(name: "LaMelo Ball", image: "assets/png/chat1.png", status: "Seen", lastSeen: DateTime.now()),
  ];



  void goToChatScreen(Chat chat){
    _navigationService.navigateTo(Routes.chatScreenView, arguments: ChatScreenViewArguments(chat: chat));
  }

}

