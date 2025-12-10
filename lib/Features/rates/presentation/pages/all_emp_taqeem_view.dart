import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elkhlod/Features/bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import 'package:elkhlod/Features/rates/presentation/widgets/all_emp_taqeem_view_body.dart';
import 'package:elkhlod/Features/rates/presentation/widgets/arguments.dart';

import '../../../ta3mem/presentation/views/widgets/custom_toggle_app_bar.dart';

class AllEmpTaqeemView extends StatelessWidget {
  const AllEmpTaqeemView({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    String idType = "";
    ArgumentIds argumentIds;
    if (BlocProvider.of<BottomNavCubit>(context).details! is ArgumentIds) {
      argumentIds = BlocProvider.of<BottomNavCubit>(context).details!;
      idType = argumentIds.typeId!;
    } else {
      idType = BlocProvider.of<BottomNavCubit>(context).details!!;
    }

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
                  appBarTitle: idType == "2" ? "المديرين" : "الموظفيين")),
          backgroundColor: Colors.white,
          body: AllEmpTaqeemViewBody(idType: idType),
        ),
      ),
    );
  }
}
