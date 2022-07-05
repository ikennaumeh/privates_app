import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:privates_app/core/app/app.locator.dart';
import 'package:privates_app/core/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Privates',
      theme: ThemeData(
        fontFamily: GoogleFonts.nunito().fontFamily,

      ),
      initialRoute: Routes.splashView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
    );
  }
}
