import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:elkhlod/Features/ehsaeyat/presentation/views/widgets/ehsaeyat_view_body.dart';

import '../widgets/custom_toggle_app_bar.dart';

class EhsaeyatView extends StatelessWidget {
  const EhsaeyatView({super.key});

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
              child: CustomToggleAppBar(appBarTitle: "احصائيات")),
          backgroundColor: Colors.white,
          body: const EhsaeyatViewBody(),
        ),
      ),
    );
  }
}
