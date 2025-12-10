import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:elkhlod/Features/enzarat/presentation/views/widgets/enzarat_view_body.dart';

import '../../../../../../core/locale/app_localizations.dart';
import '../widgets/custom_toggle_app_bar.dart';

class EnzaratView extends StatelessWidget {
  const EnzaratView({super.key});

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
                  appBarTitle: locale.translate('draw_attention')!)),
          backgroundColor: Colors.white,
          body: const EnzaratViewBody(),
        ),
      ),
    );
  }
}
