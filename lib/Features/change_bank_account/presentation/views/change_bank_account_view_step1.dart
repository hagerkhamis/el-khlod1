import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/locale/app_localizations.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import 'widgets/change_bank_account_view_step1_body.dart';

class ChangeBankAccountViewStep1 extends StatelessWidget {
  const ChangeBankAccountViewStep1({super.key});

  @override
  Widget build(BuildContext context) {
    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    Size screenSize = MediaQuery.of(context).size;
    return ZoomIn(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: screenSize * .07, child: const CustomAppBar()),
        body: ChangeBankAccountViewStep1Body(
            locale: locale, screenSize: screenSize),
        floatingActionButton: CustomButton(
            screenWidth: screenSize.width * .33,
            buttonTapHandler: () {
              // BlocProvider.of<BottomNavCubit>(context).navigationQueue.addLast(
              //     BlocProvider.of<BottomNavCubit>(context).bottomNavIndex);
              BlocProvider.of<BottomNavCubit>(context)
                  .updateBottomNavIndex(kChangeBankAccountViewStep2);
            },
            buttonText: "التالي"),
      ),
    );
  }
}
