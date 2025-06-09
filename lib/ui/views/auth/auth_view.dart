import 'package:flutter/material.dart';
import 'package:privates/ui/common/app_icons.dart';
import 'package:privates/ui/common/app_strings.dart';
import 'package:privates/ui/extensions/context_extensions.dart';
import 'package:privates/ui/extensions/num_extension.dart';
import 'package:privates/ui/extensions/widget.extension.dart';
import 'package:privates/ui/widgets/common/app_icon/app_icon.dart';
import 'package:privates/ui/widgets/common/primary_filled_button/primary_filled_button.dart';
import 'package:privates/ui/widgets/common/primary_outline_button/primary_outline_button.dart';
import 'package:privates/ui/widgets/common/stylized_localization/stylized_localization.dart';
import 'package:stacked/stacked.dart';

import 'auth_viewmodel.dart';

class AuthView extends StackedView<AuthViewModel> {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AuthViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          4.spacer,
          AppIcon(
            height: 74,
            backgroundColor: context.colorScheme.surface,
            borderRadius: 11,
            boxShadow: [
              BoxShadow(
                blurRadius: 44.47,
                offset: const Offset(0, 2.12),
                color: context.colorScheme.onSurface.withOpacity(.1),
              ),
            ],
          ).alignToCenter,
          5.verticalSpace,
          Text(
            ksPrivates,
            style: context.textTheme.displaySmall?.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
          3.spacer,
          Text(
            ksPrivateMomentsMeetContent,
            textAlign: TextAlign.center,
            style: context.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ).paddingHorizontal(34),
          2.spacer,
          Padding(
            padding: 25.paddingHorizontal,
            child: Column(
              children: [
                PrimaryOutlineButton.icon(
                  text: ksGoogleSignUp,
                  prefixIcon: kicGoogle,
                  onPressed: viewModel.googleSignIn,
                  borderRadius: 40,
                  padding: 16.paddingHorizontal,
                ),
                24.verticalSpace,
                PrimaryOutlineButton.icon(
                  text: ksAppleSignUp,
                  prefixIcon: kicApple,
                  onPressed: viewModel.appleSignIn,
                  borderRadius: 40,
                  padding: 16.paddingHorizontal,
                ),
              ],
            ),
          ),
          35.verticalSpace,
          Row(
            children: [
              const Divider().expandedChild(5),
              Text(
                ksOr,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium,
              ).expandedChild(2),
              const Divider().expandedChild(5),
            ],
          ).paddingHorizontal(40),
          30.verticalSpace,
          PrimaryFilledButton.widget(
            text: ksCreateAccount,
            onPressed: viewModel.appleSignIn,
            borderRadius: 40,
            padding: 10.paddingHorizontal,
            margin: 52.paddingHorizontal,
            suffix: Icon(
              Icons.arrow_forward_rounded,
              color: context.colorScheme.onPrimary,
            ),
          ),
          4.spacer,
          StylingLocalizations(
            localizedText: ksExistingUserHere,
            textToStyle: const [ksLogin],
            styledTextCallbacks: [viewModel.login],
            generalStyle: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
            ),
            styledTextStyle: context.textTheme.titleSmall?.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
          1.spacer,
        ],
      ),
    );
  }

  @override
  AuthViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AuthViewModel();
}
