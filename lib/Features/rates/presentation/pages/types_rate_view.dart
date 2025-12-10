import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/locale/app_localizations.dart';
import '../../../ta3mem/presentation/views/widgets/custom_toggle_app_bar.dart';
import '../widgets/types_rate_view_body.dart';

class TypesRateView extends StatelessWidget {
  const TypesRateView({super.key});

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
                  appBarTitle: locale.translate('Responsibilities')!)),
          backgroundColor: Colors.white,
          body: TypesRateViewBody(),
        ),
      ),
    );
  }
}
