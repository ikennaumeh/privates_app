import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:privates/app/theming/app.fonts.dart';
import 'package:privates/ui/common/app_duration.dart';
import 'package:privates/ui/common/app_icons.dart';
import 'package:privates/ui/common/app_strings.dart';
import 'package:privates/ui/extensions/context_extensions.dart';
import 'package:privates/ui/views/startup/models/startup_model.dart';
import 'package:stacked/stacked.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: DefaultTextStyle(
        style: context.textTheme.titleLarge!.copyWith(
          height: 1,
          color: context.colorScheme.onPrimary,
          fontWeight: FontWeight.w900,
          fontFamily: AppFonts.nunito,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        child: Stack(
          children: [
            PageView.builder(
              itemCount: 3,
              controller: viewModel.pageController,
              itemBuilder: (_, index) => Image.asset(
                viewModel.kStartupDetails[index].image,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (viewModel
                    .kStartupDetails[viewModel.currentPage].showHeart) ...[
                  const Spacer(),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: SvgPicture.asset(
                        kicSquishyHeart,
                        alignment: Alignment.centerRight,
                      ),
                    )
                        .animate(target: viewModel.currentPage == 1 ? 1 : 0)
                        .scaleXY(duration: kdHalfSecond),
                  ),
                  const Spacer(flex: 2),
                ] else
                  const Spacer(flex: 6),
                SvgPicture.asset(
                  kicCurvedArrow,
                  alignment: Alignment.centerLeft,
                ),
                const Spacer(flex: 6),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: AnimatedSlide(
                    duration: kdHalfSecond,
                    offset: viewModel
                        .kStartupDetails[viewModel.currentPage].scribbleOffset,
                    child: SvgPicture.asset(
                      kicScribble,
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                ),
                const Spacer(flex: 2),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 100),
                  child: AnimatedSwitcher(
                    duration: kdHalfSecond,
                    transitionBuilder: (child, animation) =>
                        FadeTransition(opacity: animation, child: child),
                    child: Text(
                      viewModel.kStartupDetails[viewModel.currentPage].text,
                      key: ValueKey(viewModel.currentPage),
                    ),
                  ),
                ),
                const Spacer(flex: 2),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Material(
                    type: MaterialType.transparency,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AnimatedSwitcher(
                          duration: kdHalfSecond,
                          transitionBuilder: (child, animation) =>
                              FadeTransition(opacity: animation, child: child),
                          child: viewModel.currentPage != viewModel.totalPages
                              ? TextButton(
                                  onPressed: viewModel.currentPage == 0
                                      ? viewModel.onSkip
                                      : viewModel.onPrev,
                                  child: AnimatedSwitcher(
                                    duration: kdHalfSecond,
                                    transitionBuilder: (child, animation) =>
                                        FadeTransition(
                                            opacity: animation, child: child),
                                    child: Text(
                                      viewModel.currentPage == 0
                                          ? ksSkip
                                          : ksPrev,
                                      key: ValueKey(viewModel.currentPage),
                                      style: context.textTheme.titleLarge!
                                          .copyWith(
                                        height: 1,
                                        color: context.colorScheme.onPrimary,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: AppFonts.nunito,
                                        decoration: TextDecoration.underline,
                                        decorationColor:
                                            context.colorScheme.onPrimary,
                                        decorationThickness: 3,
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        ),
                        TextButton(
                          onPressed: viewModel.onNext,
                          child: Text(
                            ksNext,
                            style: context.textTheme.titleLarge!.copyWith(
                              height: 1,
                              color: context.colorScheme.onPrimary,
                              fontWeight: FontWeight.w900,
                              fontFamily: AppFonts.nunito,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) {
    StartupViewModel viewModel = StartupViewModel();
    loadImages(context, viewModel);
    return viewModel;
  }

  // This precaches the images used in the startup pages
  void loadImages(BuildContext context, StartupViewModel viewModel) {
    for (StartupModel path in viewModel.kStartupDetails) {
      precacheImage(AssetImage(path.image), context);
    }
  }

  @override
  void onViewModelReady(StartupViewModel viewModel) {
    viewModel.runStartupLogic();
    super.onViewModelReady(viewModel);
  }
}
