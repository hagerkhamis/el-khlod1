import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/locale/app_localizations.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/gaps.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_dot_stepper.dart';
import '../../../bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import '../widgets/employee_form_step1.dart';

class EmployeeProfileFormScreenStep1 extends StatelessWidget {
  const EmployeeProfileFormScreenStep1({super.key});

  @override
  Widget build(BuildContext context) {
    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: ZoomIn(
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: screenSize * .1, child: const CustomAppBar()),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 50),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      Text(
                        locale.translate('employee_identification_form')!,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Gaps.vGap15,
                      CustomDotStepper(
                          isActive: false,
                          firstText:
                              locale.translate('employee_identification')!,
                          secondText: locale.translate('view_model')!),
                      //   SizedBox(height: screenSize.height*.1,),
                    ]),
                  ),
                  Gaps.vGap20,
                  const EmployeeProfileStep1(),
                ],
              ),
            ),
          ),
          floatingActionButton: CustomButton(
            screenWidth: screenSize.width * .35,
            buttonTapHandler: () {
              // BlocProvider.of<BottomNavCubit>(context).navigationQueue.addLast(
              //     BlocProvider.of<BottomNavCubit>(context).bottomNavIndex);
              BlocProvider.of<BottomNavCubit>(context)
                  .updateBottomNavIndex(kEmployeesProfileFormScreenStep2);
            },
            buttonText: locale.translate('view_model')!,
          ),
        ),
      ),
    );
  }
}
