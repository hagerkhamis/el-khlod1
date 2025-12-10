import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:elkhlod/Features/rates/presentation/widgets/bnod_taqeem_view_body.dart';

import '../../../ta3mem/presentation/views/widgets/custom_toggle_app_bar.dart';

class BnodTaqeemView extends StatelessWidget {
  const BnodTaqeemView({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return FadeInUp(
      duration: const Duration(milliseconds: 300),
      child: DefaultTabController(
        animationDuration: const Duration(milliseconds: 500),
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: screenSize * .12,
              child: CustomToggleAppBar(appBarTitle: "البنود")),
          backgroundColor: Colors.white,
          body: const BnodTaqeemViewBody(),
        ),
      ),
    );
  }
}
