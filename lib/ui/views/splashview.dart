import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:privates_app/ui/view-models/splash_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late SplashViewModel _model;
  @override
  void initState() {
    _model = SplashViewModel();
    _model.startUpLogic();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Align(
          alignment: Alignment.centerLeft,
          child: SvgPicture.asset("assets/svg/splash-logo.svg"),
        ),
      ),
    );
  }
}
