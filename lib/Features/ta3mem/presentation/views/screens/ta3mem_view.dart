import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:elkhlod/Features/ta3mem/presentation/views/widgets/ta3mem_view_body.dart';

import '../../../../../../core/locale/app_localizations.dart';
import '../widgets/custom_toggle_app_bar.dart';

class Ta3memView extends StatelessWidget {
  const Ta3memView({super.key});

  @override
  Widget build(BuildContext context) {
    late AppLocalizations locale;
    Size screenSize = MediaQuery.of(context).size;

    locale = AppLocalizations.of(context)!;
    return FadeInUp(
      duration: const Duration(milliseconds: 300),
      child: DefaultTabController(
        animationDuration: const Duration(milliseconds: 500),
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: screenSize * .12,
              child: CustomToggleAppBar(
                  appBarTitle: locale.translate('circulars')!)),
          backgroundColor: Colors.white,
          body: const Ta3memViewBody(),
        ),
      ),
    );
  }
}
