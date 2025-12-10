import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../core/locale/app_localizations.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/gaps.dart';
import '../../../core/widgets/custom_circle_clipper.dart';

class IntroScreenOld extends StatelessWidget {
  const IntroScreenOld({super.key});

  Widget getIntroPages(
      {required String imagePath,
      required String constText,
      required Size screenSize,
      required String title}) {
    return ZoomIn(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            ClipPath(
              clipper: RoundedClipper(),
              child: AnimatedContainer(
                duration: const Duration(seconds: 3),
                height: screenSize.height - 80,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Image.asset(
                imagePath,
                //fit: BoxFit.cover,
                alignment: Alignment.center,
                height: screenSize.height * .4,
                width: screenSize.width * .6,
              ),
            ),
            Positioned(
              top: screenSize.height * .65,
              right: screenSize.width * .07,
              left: screenSize.width * .07,
              child: Column(
                  //textDirection: TextDirection.rtl,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.vGap12,
                    Text(
                      textAlign: TextAlign.start,
                      constText,
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    SizedBox(
                      width: screenSize.width - 25,
                      child: Text(
                        title,
                        textAlign: TextAlign.start,
                        softWrap: true,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    return IntroductionScreen(
      dotsDecorator: DotsDecorator(
          // spacing: EdgeInsets.only(left: 2, right: 3),
          color: Colors.white,
          size: Size(screenSize.width * .023, screenSize.height * .025),
          activeColor: kPrimaryColor),
      //  dotsContainerDecorator: BoxDecoration(color: Colors.red),
      rtl: true,
      // resizeToAvoidBottomInset: true,
      next: Text(
        locale.translate('skip')!,
        style: const TextStyle(color: Colors.white, fontSize: 17),
      ),
      done: Text(
        locale.translate('skip')!,
        style: const TextStyle(color: Colors.white, fontSize: 17),
      ),
      // nextFlex: 1,
      // dotsFlex:3,
      doneStyle: TextButton.styleFrom(alignment: Alignment.bottomLeft),
      nextStyle: TextButton.styleFrom(alignment: Alignment.bottomLeft),
      onDone: () {
        Navigator.pushReplacementNamed(context, kLoginScreenRoute);
      },

      showDoneButton: true,

      rawPages: [
        getIntroPages(
            constText: locale.translate('finger_print_system')!,
            imagePath: "assets/images/intro1.png",
            screenSize: screenSize,
            title: locale
                .translate('manage_human_resources_in_an_integrated_manner')!),
        getIntroPages(
            constText: locale.translate('finger_print_system')!,
            imagePath: "assets/images/intro2.png",
            screenSize: screenSize,
            title: locale.translate(
                'provides_you_with_detailed_reports_on_all_your_employees')!),
        getIntroPages(
            constText: locale.translate('finger_print_system')!,
            imagePath: "assets/images/intro3.png",
            screenSize: screenSize,
            title: locale
                .translate('the_employee_can_view_his_accrued_leave_balance')!),
      ],
    );
  }
}
