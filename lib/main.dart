import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:privates_app/core/app/app.locator.dart';
import 'package:privates_app/core/app/app.router.dart';
import 'package:privates_app/core/decorations/color_palette.dart';
import 'package:privates_app/generated/l10n.dart';
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
        scaffoldBackgroundColor: Palette.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Palette.white,
          elevation: 0
        ),
        fontFamily: GoogleFonts.nunito().fontFamily,
        useMaterial3: true,
        textSelectionTheme: const TextSelectionThemeData(cursorColor: Palette.primary),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android : CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS : ZoomPageTransitionsBuilder(),
          }
        )

      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      initialRoute: Routes.splashView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
    );
  }
}
