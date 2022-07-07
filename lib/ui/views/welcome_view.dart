import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:privates_app/core/app/app.locator.dart';
import 'package:privates_app/core/app/app.router.dart';
import 'package:privates_app/core/decorations/color_palette.dart';
import 'package:privates_app/core/decorations/device_scaler.dart';
import 'package:privates_app/generated/l10n.dart';
import 'package:privates_app/ui/widgets/button.dart';
import 'package:stacked_services/stacked_services.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primary,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SvgPicture.asset(
                "assets/svg/splash-logo.svg",
                color: Palette.white,
                width: 255,
              ),
            ),
            SizedBox(
              height: DeviceScaler().scale(150),
            ),
            PrimaryButton(
              color: Palette.white,
              textColor: Palette.primary,
              margin: EdgeInsets.symmetric(
                  horizontal: 20, vertical: DeviceScaler().scale(15)),
              buttonConfig: ButtonConfig(
                  text: S.current.create_account,
                  action: (){
                    locator<NavigationService>().navigateTo(Routes.getNumberView);
                  }),
            ),
            PrimaryBorderButton(
              margin: EdgeInsets.only(
                  left: 20, right: 20, bottom: DeviceScaler().scale(80)),
              buttonConfig:
                  ButtonConfig(text: S.current.sign_in, action: () {
                    locator<NavigationService>().navigateTo(Routes.loginView);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
