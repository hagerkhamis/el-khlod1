import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'widgets/home_screen_body.dart';

class HomeViews extends StatelessWidget {
  const HomeViews({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 235, 235, 235),
        body: FadeInUp(child: const HomeScreenBody()),
      ),
    );
  }
}
