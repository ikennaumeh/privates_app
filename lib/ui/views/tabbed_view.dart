import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:privates_app/core/decorations/color_palette.dart';
import 'package:privates_app/core/decorations/device_scaler.dart';
import 'package:privates_app/ui/view-models/tabbed_view_model.dart';
import 'package:privates_app/ui/views/chat_view.dart';
import 'package:privates_app/ui/views/home_view.dart';
import 'package:privates_app/ui/views/post_view.dart';
import 'package:privates_app/ui/views/search_view.dart';
import 'package:stacked/stacked.dart';

class TabbedView extends StatelessWidget {
  const TabbedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TabbedViewModel>.reactive(
      viewModelBuilder: () => TabbedViewModel(),
      builder: (context, model, child) => Scaffold(
        body: getViewForIndex(model.currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: model.currentIndex,
          backgroundColor: Palette.white,
          selectedItemColor: Palette.primary,
          unselectedItemColor: Palette.darkBlue,
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: DeviceScaler().scaleFont(12),
            color: const Color(0xffF9F8F8),
          ),
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: DeviceScaler().scaleFont(12),
            color: Palette.primary,
          ),
          elevation: 0,
          iconSize: 20,
          items: [
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset('assets/svg/home.svg',),
              icon: SvgPicture.asset('assets/svg/home.svg', color: Palette.darkBlue,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset('assets/svg/search.svg', color: Palette.primary,),
              icon: SvgPicture.asset('assets/svg/search.svg',),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset('assets/svg/chat.svg', color: Palette.primary,),
              icon: SvgPicture.asset('assets/svg/chat.svg',),
              label: 'Chat',
            ),
          ],
          onTap: model.setIndex,
        ),
      ),
    );
  }

  Widget getViewForIndex(int index) {
    switch(index){
      case 0 :
        return const HomeView();
      case 1 :
        return const SearchView();
      case 2:
        return const ChatView();
      default:
        return const HomeView();

    }
  }
}
