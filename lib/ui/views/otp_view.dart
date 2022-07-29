import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:privates_app/core/decorations/color_palette.dart';
import 'package:privates_app/core/decorations/device_scaler.dart';
import 'package:privates_app/generated/l10n.dart';
import 'package:privates_app/ui/view-models/otp_view_model.dart';
import 'package:privates_app/ui/widgets/button.dart';
import 'package:privates_app/ui/widgets/custom_back_button.dart';
import 'package:privates_app/ui/widgets/full_screen_loading_indicator.dart';
import 'package:privates_app/ui/widgets/one_action_topbar.dart';
import 'package:stacked/stacked.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpView extends StatefulWidget {
  final String phoneNumber, id;
  const OtpView({Key? key,required this.phoneNumber,required this.id}) : super(key: key);

  @override
  _OtpViewState createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {

  late OtpViewModel _model;
  late TextEditingController _controller;

  @override
  void initState() {
    _model = OtpViewModel();
    _controller = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      body: ViewModelBuilder<OtpViewModel>.reactive(
        viewModelBuilder: () => OtpViewModel(),
        builder: (_, model, __){

          Widget body = SafeArea(child: Column(
            children: [
              const OneActionAppBar(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.current.your_code_is,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: DeviceScaler().scaleFont(32),
                        color: Palette.darkBlue,
                      ),
                    ),
                    SizedBox(
                      height: DeviceScaler().scale(10),
                    ),
                    Text(
                      S.current.enter_otp_phrase + widget.phoneNumber,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: DeviceScaler().scaleFont(13),
                          fontWeight: FontWeight.w400,
                          color: Palette.black
                      ),
                    ),

                    SizedBox(
                      height: DeviceScaler().scale(40),
                    ),

                    PinCodeTextField(
                      appContext: context,
                      pastedTextStyle: const TextStyle(
                        color: Palette.primary,
                        fontWeight: FontWeight.bold,
                      ),
                      autovalidateMode: AutovalidateMode.disabled,
                      length: 6,
                      obscureText: true,
                      obscuringCharacter: '*',
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v!.length < 3) {
                          return "Fill in otp";
                        }
                        return null;
                      },
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderWidth: 1,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 45,
                          fieldWidth: 45,
                          inactiveColor: Palette.grey,
                          activeFillColor: Palette.transparent,
                          inactiveFillColor: Palette.transparent,
                          activeColor: Palette.grey,
                          selectedColor: Palette.primary,
                          selectedFillColor: Colors.white),
                      cursorColor: Colors.black,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      onCompleted: (v) {
                        debugPrint(_controller.text);
                        debugPrint("Completed");
                      },
                      // onTap: () {
                      //   print("Pressed");
                      // },
                      onChanged: (value) {},
                      beforeTextPaste: (text) {
                        debugPrint("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: RichText(
                        text: TextSpan(
                            text: S.current.resend_on,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: DeviceScaler().scaleFont(15),
                                color: Palette.darkBlue
                            ),
                            children: const [
                              TextSpan(
                                  text: " 00:35",
                                  style: TextStyle(
                                    color: Palette.primary,
                                  )
                              ),
                            ]
                        ),
                      ),
                    ),
                    SizedBox(
                      height: DeviceScaler().scale(40),
                    ),
                    PrimaryButton(
                      buttonConfig: ButtonConfig(
                        text: S.current.continue_text,
                        action: () async {
                          PhoneAuthCredential phoneAuth = PhoneAuthProvider.credential(verificationId: widget.id, smsCode: _controller.text);
                          model.goToRegistration(phoneAuth);
                        },
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ));

          List<Widget> stackChildren = [body];

          if(model.isBusy){
            stackChildren.add(const FullScreenProgressIndicator());
          }

          return Stack(children: stackChildren,);
        },
      ),
    );
  }
}
