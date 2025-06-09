import 'package:flutter/cupertino.dart';
import 'package:privates/app/app.locator.dart';
import 'package:privates/app/app.router.dart';
import 'package:privates/ui/common/app_duration.dart';
import 'package:privates/ui/common/app_images.dart';
import 'package:privates/ui/common/app_strings.dart';
import 'package:privates/ui/views/startup/models/startup_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final PageController pageController = PageController();
  int currentPage = 0;
  List<StartupModel> kStartupDetails = [
    const StartupModel(
      text: ksOnboarding1,
      image: kimOnboarding1,
      showHeart: false,
      scribbleOffset: Offset(0, 0),
    ),
    const StartupModel(
      text: ksOnboarding3,
      image: kimOnboarding2,
      showHeart: true,
      scribbleOffset: Offset(.15, 0),
    ),
    const StartupModel(
      text: ksOnboarding1,
      image: kimOnboarding3,
      showHeart: false,
      scribbleOffset: Offset(.3, 0),
    ),
  ];
  int get totalPages => kStartupDetails.length - 1;

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    pageController.addListener(() {
      final page = pageController.page?.round() ?? 0;
      if (page != currentPage) {
        currentPage = page.clamp(0, 2);
        rebuildUi();
      }
    });
  }

  /// This moves the pages one index forward and if at the end moves the user
  /// to the next screen
  void onNext() {
    if (currentPage == totalPages) {
      _navigationService.replaceWithAuthView();
    } else {
      pageController.animateToPage(
        currentPage + 1,
        duration: kdHalfSecond,
        curve: Curves.easeIn,
      );
    }
  }

  /// This moves the pages one index backward
  void onPrev() {
    pageController.animateToPage(
      currentPage - 1,
      duration: kdHalfSecond,
      curve: Curves.easeIn,
    );
  }

  /// This moves the pages to the end
  void onSkip() {
    pageController.animateToPage(
      kStartupDetails.length - 1,
      duration: kdHalfSecond,
      curve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
