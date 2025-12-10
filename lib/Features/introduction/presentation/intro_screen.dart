import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:elkhlod/Features/introduction/presentation/manger/services_cubit/intro_cubit.dart';
import 'package:elkhlod/core/utils/gaps.dart';
import 'package:elkhlod/core/widgets/custom_cached_network_image.dart';

import '../../../core/locale/app_localizations.dart';
import '../../../core/utils/constants.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  Widget getIntroPages(
      {required String imagePath,
      required String constText,
      required Size screenSize,
      required String title,
      required BuildContext context}) {
    return ZoomIn(
      child: Scaffold(
          //backgroundColor: kPrimaryColor,
          body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kPrimaryColor,
        ),
        child: Column(
          children: [
            // ClipPath(
            //   clipper: RoundedClipper(),
            //   child: AnimatedContainer(
            //     duration: const Duration(seconds: 3),
            //     height: screenSize.height - 80,
            //     color: Colors.white,
            //   ),
            // ),
            Padding(
                padding: const EdgeInsets.only(top: 120),
                child: CustomCashedNetworkImage(
                  imageUrl: imagePath,
                  height: screenSize.height * .4,
                  width: screenSize.width * .9,
                )
                //   Image.asset(
                //   imagePath,
                //   //fit: BoxFit.cover,
                //   alignment: Alignment.center,
                //   height: screenSize.height * .4,
                //   width: screenSize.width * .6,
                // ),
                ),
            Column(
                //textDirection: TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Gaps.vGap12,
                  SizedBox(
                    width: 200,
                    child: Text(
                      textAlign: TextAlign.center,
                      title,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Gaps.vGap15,
                  SizedBox(
                    width: screenSize.width - 25,
                    child: Text(
                      constText,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ])
          ],
        ),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    return BlocBuilder<IntroCubit, IntroState>(
      builder: (context, state) {
        if (state is FetchSuccessful) {
          List<Widget>? introPages = [];
          for (var i = 0; i < state.data!.length; i++) {
            introPages.add(getIntroPages(
                imagePath: state.data![i].imagePath!,
                constText: state.data![i].spalshDetailsAr!,
                screenSize: screenSize,
                title: state.data![i].spalshTitleAr!,
                context: context));
          }
          return IntroductionScreen(
              dotsDecorator: DotsDecorator(
                  // spacing: EdgeInsets.only(left: 2, right: 3),
                  color: Colors.white,
                  size: Size(screenSize.width * .023, screenSize.height * .025),
                  activeColor: kPrimaryColor),
              //  dotsContainerDecorator: BoxDecoration(color: Colors.red),
              //rtl: true,
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
              rawPages: introPages
              // getIntroPages(
              //     constText: "تطبيقــــك المميـز لخدمـات الميديــــا",
              //     imagePath: "assets/images/intro1.png",
              //     screenSize: screenSize,
              //     title:
              //         "يمكنــــك الآن استخــدام تطبيقنـا المميـــز فى جميع خدمات الميديا متوفرون دائما لخدمتك",
              //     context: context),

              // getIntroPages(
              //     constText: "تطبيقــــك المميـز لخدمـات الميديــــا",
              //     imagePath: "assets/images/intro2.png",
              //     screenSize: screenSize,
              //     title:
              //         "يمكنــــك الآن استخــدام تطبيقنـا المميـــز فى جميع خدمات الميديا متوفرون دائما لخدمتك",
              //     context: context),
              // getIntroPages(
              //     constText: locale.translate('finger_print_system')!,
              //     imagePath: "assets/images/intro3.png",
              //     screenSize: screenSize,
              //     title: locale
              //         .translate('the_employee_can_view_his_accrued_leave_balance')!),

              );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
