import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/constants.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  // late Timer _timer;
  Future checkFirstSeen(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool seen = (pref.getBool('seen') ?? false);
    if (seen) {
      Navigator.pushReplacementNamed(context, kHomeScreen);
      // Navigator.of(context).pushReplacement(
      //     new MaterialPageRoute(builder: (context) => new Home()));
    } else {
      await pref.setBool('seen', true);

      Future.delayed(
        const Duration(seconds: 2),
      );
      Navigator.pushReplacementNamed(context, kLanguageScreenRoute);

      // Navigator.of(context).pushReplacement(
      //     new MaterialPageRoute(builder: (context) => new IntroScreen()));
    }
  }

  @override
  void initState() {
    super.initState();
    // _timer = Timer(const Duration(seconds: 3), () {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => const MyHomePage()),
    //   );
    // });
    Future.delayed(
      const Duration(seconds: 3),
      () {
        checkFirstSeen(context);
      },
    );
  }

  @override
  void dispose() {
    // _timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Colors.white.withOpacity(0.5)],
                stops: const [10, 50]),
          ),
        ),
        Center(
          child: Roulette(
            child: Image.asset(
              AssetsData.logo,
              width: 180.w,
            ),
          ),
        ),
      ],
    );
  }
}
