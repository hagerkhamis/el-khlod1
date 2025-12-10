import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/locale/app_localizations.dart';
import '../../../../bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';

// ignore: must_be_immutable
class CustomToggleAppBar extends StatelessWidget {
  CustomToggleAppBar(
      {super.key, required this.appBarTitle, this.leadingWidget});
  Widget? leadingWidget;
  final String appBarTitle;
  @override
  Widget build(BuildContext context) {
    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    final screenSize = MediaQuery.of(context).size;
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
      leadingWidth: screenSize.width * .2,
      leading: leadingWidget,
      elevation: 0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            onTap: () {
              BlocProvider.of<BottomNavCubit>(context).updateBottomNavIndex(4);
            },
            child:

                //   const Icon(Icons.arrow_forward,color: Colors.black,),
                Icon(
              locale.isEnLocale
                  ? FontAwesomeIcons.arrowRightLong
                  : FontAwesomeIcons.arrowLeftLong,
              color: Colors.black,
            ),
          ),
        ),
      ],
      backgroundColor: Colors.white,
      title: Center(
        child: Text(
          appBarTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
