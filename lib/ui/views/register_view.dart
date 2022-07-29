import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:privates_app/core/decorations/color_palette.dart';
import 'package:privates_app/core/decorations/device_scaler.dart';
import 'package:privates_app/generated/l10n.dart';
import 'package:privates_app/ui/utilities/validator.dart';
import 'package:privates_app/ui/view-models/register_view_model.dart';
import 'package:privates_app/ui/widgets/button.dart';
import 'package:privates_app/ui/widgets/full_screen_loading_indicator.dart';
import 'package:stacked/stacked.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late TextEditingController _fullName;
  late TextEditingController _email;
  late TextEditingController _password;
  late TextEditingController _confirmPassword;

  late RegisterViewModel _model;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _model = RegisterViewModel();
    _fullName = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    _confirmPassword = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var queryData = MediaQuery.of(context);
    var bottomSafeArea = queryData.padding.bottom;
    var bottomInset = queryData.viewInsets.bottom;
    return Scaffold(
      backgroundColor: Palette.white,
      body: ViewModelBuilder<RegisterViewModel>.reactive(
        viewModelBuilder: () => RegisterViewModel(),
        builder: (_, model, __) {
          Widget body = SafeArea(
              child: SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: DeviceScaler().scale(50),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset("assets/svg/private-logo.svg"),
                      ),
                      SizedBox(
                        height: DeviceScaler().scale(50),
                      ),
                      Text(
                        S.current.register,
                        style: TextStyle(
                          fontSize: DeviceScaler().scaleFont(25),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: DeviceScaler().scale(30),
                      ),
                      TextFormField(
                        controller: _fullName,
                        decoration: const InputDecoration(
                          labelText: "Full Name",
                          labelStyle: TextStyle(
                            color: Palette.darkBlue,
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Palette.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Palette.primary)),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Palette.red)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Palette.red)),
                        ),
                        validator: (value) => Validator.validateFullName(value),
                      ),
                      SizedBox(
                        height: DeviceScaler().scale(20),
                      ),
                      TextFormField(
                        controller: _email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(
                            color: Palette.darkBlue,
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Palette.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Palette.primary)),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Palette.red)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Palette.red)),
                        ),
                        validator: (value) => Validator.validateEmail(value),
                      ),
                      SizedBox(
                        height: DeviceScaler().scale(20),
                      ),
                      TextFormField(
                        controller: _password,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(
                            color: Palette.darkBlue,
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Palette.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Palette.primary)),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Palette.red)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Palette.red)),
                        ),
                        validator: (value) => Validator.validatePassword(value),
                      ),
                      SizedBox(
                        height: DeviceScaler().scale(20),
                      ),
                      TextFormField(
                        controller: _confirmPassword,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Confirm Password",
                          labelStyle: TextStyle(
                            color: Palette.darkBlue,
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Palette.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Palette.primary)),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Palette.red)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Palette.red)),
                        ),
                        validator: (value) => Validator.validateConfirmPassword(
                            value,
                            password: _password.text),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ));

          Widget footer = Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: AnimatedSize(
              duration: const Duration(milliseconds: 250),
              child: Builder(builder: (context) {
                /// If this is true, then it means that keyboard is presented
                if (bottomInset != 0) return const SizedBox.shrink();

                return Container(
                  padding: EdgeInsets.only(
                    top: DeviceScaler().scale(15),
                    left: DeviceScaler().scale(20),
                    right: DeviceScaler().scale(20),
                    bottom: DeviceScaler().scale(10 + bottomSafeArea),
                  ),
                  decoration: const BoxDecoration(
                    color: Palette.transparent,
                  ),
                  child: PrimaryButton(
                    margin: EdgeInsets.only(
                      top: DeviceScaler().scale(43),
                    ),
                    buttonConfig: ButtonConfig(
                      action: () {
                        if (_formKey.currentState!.validate()) {
                          model.register(email: _email.text, password: _password.text, fullName: _fullName.text);
                        }
                      },
                      text: S.current.register,
                    ),
                  ),
                );
              }),
            ),
          );

          List<Widget> stackChildren = [body, footer];

          if (model.isBusy) {
            stackChildren.add(const FullScreenProgressIndicator());
          }

          return Stack(
            children: stackChildren,
          );
        },
      ),
    );
  }
}
