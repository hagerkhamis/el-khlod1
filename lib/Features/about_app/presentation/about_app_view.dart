import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'widgets/about_app_view_body.dart';

class AboutAppView extends StatelessWidget {
  const AboutAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FadeInUp(child: const AboutAppViewBody()),
    );
  }
}
