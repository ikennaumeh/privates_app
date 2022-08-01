import 'package:privates_app/core/services/firebase_auth.dart';
import 'package:privates_app/core/services/image_service.dart';
import 'package:privates_app/ui/utilities/phone_util.dart';
import 'package:privates_app/ui/views/chats_screen_view.dart';
import 'package:privates_app/ui/views/get_number_view.dart';
import 'package:privates_app/ui/views/login_view.dart';
import 'package:privates_app/ui/views/otp_view.dart';
import 'package:privates_app/ui/views/post_view.dart';
import 'package:privates_app/ui/views/register_view.dart';
import 'package:privates_app/ui/views/splashview.dart';
import 'package:privates_app/ui/views/tabbed_view.dart';
import 'package:privates_app/ui/views/welcome_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

///I'm using stacked architecture for state management, dependency injection, etc, so watch tutorials on it if you dunno about it.
/// for code generation anytime u add anything below: flutter pub run build_runner build --delete-conflicting-outputs

@StackedApp(
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: PhoneUtil),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: FirebaseService),
    LazySingleton(classType: ImageService),
  ],
  logger: StackedLogger(),
  routes: [
    AdaptiveRoute(page: SplashView, initial: true),
    AdaptiveRoute(page: WelcomeView),
    AdaptiveRoute(page: GetNumberView),
    AdaptiveRoute(page: OtpView),
    AdaptiveRoute(page: RegisterView),
    AdaptiveRoute(page: LoginView),
    AdaptiveRoute(page: TabbedView),
    AdaptiveRoute(page: ChatScreenView),
    AdaptiveRoute(page: PostView),
  ]

)
class AppSetUp{}