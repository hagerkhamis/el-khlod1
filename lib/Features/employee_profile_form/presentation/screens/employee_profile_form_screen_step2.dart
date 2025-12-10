import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../core/locale/app_localizations.dart';
import '../../../../core/utils/gaps.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_dot_stepper.dart';
import '../widgets/employee_form_step2.dart';

class EmployeeProfileFormScreenStep2 extends StatelessWidget {
  const EmployeeProfileFormScreenStep2({super.key});

  @override
  Widget build(BuildContext context) {
    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    final screenSize = MediaQuery.of(context).size;
    return ZoomIn(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: screenSize * .1, child: const CustomAppBar()),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(children: [
                  Text(
                    locale.translate('employee_identification_form')!,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Gaps.vGap15,
                  CustomDotStepper(
                      isActive: true,
                      firstText: locale.translate('employee_identification')!,
                      secondText: locale.translate('view_model')!),
                  SizedBox(
                    height: screenSize.height * .05,
                  ),
                  const EmployeeProfileStep2(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
