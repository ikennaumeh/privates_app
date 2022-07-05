import 'package:privates_app/ui/views/splashview.dart';
import 'package:privates_app/ui/views/welcome_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

///I'm using stacked architecture for state management, dependency injection, etc, so watch tutorials on it if you dunno about it.
/// for code generation anytime u add anything below: flutter pub run build_runner build --delete-conflicting-outputs

@StackedApp(
  dependencies: [
    LazySingleton(classType: NavigationService),
  ],
  logger: StackedLogger(),
  routes: [
    AdaptiveRoute(page: SplashView, initial: true),
    AdaptiveRoute(page: WelcomeView)
  ]

)
class AppSetUp{}