import 'package:flutter/material.dart';
import 'package:privates_app/core/decorations/color_palette.dart';
import 'package:privates_app/core/decorations/device_scaler.dart';
import 'package:privates_app/core/models/phone_number.dart';
import 'package:privates_app/generated/l10n.dart';
import 'package:privates_app/ui/utilities/validator.dart';
import 'package:privates_app/ui/view-models/get_number_view_model.dart';
import 'package:privates_app/ui/widgets/button.dart';
import 'package:privates_app/ui/widgets/custom_back_button.dart';
import 'package:privates_app/ui/widgets/full_screen_loading_indicator.dart';
import 'package:privates_app/ui/widgets/inlt_phone_field.dart';
import 'package:privates_app/ui/widgets/one_action_topbar.dart';
import 'package:stacked/stacked.dart';

class GetNumberView extends StatefulWidget {
  const GetNumberView({Key? key}) : super(key: key);

  @override
  _GetNumberViewState createState() => _GetNumberViewState();
}

class _GetNumberViewState extends State<GetNumberView> {

  late GetNumberViewModel _model;
  late TextEditingController _phoneController;
  late FocusNode _phoneFocusNode;
  PhoneNumber? enteredPhone;

  @override
  void initState() {
    _model = GetNumberViewModel();
    _phoneController = TextEditingController();
    _phoneFocusNode = FocusNode();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,

      body: ViewModelBuilder<GetNumberViewModel>.reactive(
          viewModelBuilder: () => GetNumberViewModel(),
          builder: (_, model, __){

            Widget body = SafeArea(child: Column(
              children: [
                const OneActionAppBar(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        S.current.enter_your_mobile_number,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: DeviceScaler().scaleFont(32),
                          color: Palette.darkBlue,
                        ),
                      ),
                      SizedBox(
                        height: DeviceScaler().scale(40),
                      ),
                      IntlPhoneFormField(
                        controller: _phoneController,
                        focusNode: _phoneFocusNode,
                        keyboardType: TextInputType.number,
                        cursorColor: Palette.primary,
                        dropDownArrowColor: Palette.primary,
                        decoration: InputDecoration(
                          hintText: S.current.enter_your_mobile_number,
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: DeviceScaler().scaleFont(16)
                          ),
                          border: const OutlineInputBorder(),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Palette.primary)
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Palette.primary)
                          ),

                        ),
                        validator: (value) => Validator.validateMobile(value),
                        onChange: (PhoneNumber value) {
                          enteredPhone = value;
                        },
                      ),
                      SizedBox(
                        height: DeviceScaler().scale(40),
                      ),
                      Text(
                        S.current.verification_code_phrase,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: DeviceScaler().scaleFont(13),
                            fontWeight: FontWeight.w400,
                            color: Palette.black
                        ),
                      ),
                      SizedBox(
                        height: DeviceScaler().scale(40),
                      ),
                      PrimaryButton(
                        buttonConfig: ButtonConfig(
                          text: S.current.continue_text,
                          action: () async {
                            await model.goToOtpView("${enteredPhone?.completeNumber}");
                          },
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),);

            List<Widget> stackChildren = [body];

            if(model.isBusy){
              stackChildren.add(const FullScreenProgressIndicator());
            }
            return Stack(children: stackChildren,);
          },
      ),
    );
  }


  // Widget get body {
  //   return ;
  // }
}
