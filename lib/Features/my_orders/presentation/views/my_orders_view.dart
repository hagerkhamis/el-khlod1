import 'package:flutter/material.dart';

import '../../../../core/locale/app_localizations.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/my_orders_view_body.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: MediaQuery.of(context).size * .1,
          child: const CustomAppBar(),
        ),
        backgroundColor: Colors.white,
        body: MyOrdersViewBody(locale: locale),
      ),
    );
  }
}
