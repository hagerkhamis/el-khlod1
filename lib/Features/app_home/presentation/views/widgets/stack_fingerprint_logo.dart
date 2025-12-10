import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/app_home/presentation/manger/toggle_cubit.dart';
import 'package:elkhlod/Features/new_bsama_add_Fingerprint/presentation/manger/new_finger_print_cubit.dart';

import '../../../../../core/locale/app_localizations.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/functions/registration_alert.dart';
import '../../../../../core/utils/media_query_sizes.dart';
import '../../../../auth/login/domain/entities/employee_entity.dart';

class StackFingerPrintLogo extends StatefulWidget {
  final bool withAdd;

  const StackFingerPrintLogo({super.key, required this.withAdd});

  @override
  State<StackFingerPrintLogo> createState() => _StackFingerPrintLogoState();
}

class _StackFingerPrintLogoState extends State<StackFingerPrintLogo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return BlocConsumer<NewFingerPrintCubit, NewFingerPrintState>(
      listener: (context, state) async {
        if (state is FingerPrintSuccessful) {
          AlertDialog alert = alertRegistration(context,
              AppLocalizations.of(context)!.translate('Attendance_leaving')!,
              () {
            Navigator.pop(context);
          });

          // show the dialog
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return alert;
            },
          );
        } else if (state is FingerPrintFailed) {
          AlertDialog alert = alertRegistration(context, state.message, () {
            Navigator.pop(context);
          });

          // show the dialog
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return alert;
            },
          );
        }
      },
      builder: (context, state) {
        if (state is FingerPrintLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        } else {
          return BlocBuilder<ToggleCubit, int>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () async {
                  var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);

                  if (box.get(kEmployeeDataBox) != null) {
                    Navigator.pushNamed(context, kCameraScreen);
                  }
                },
                child: Image.asset(
                  AssetsData.fingerPrint,
                  width: !widget.withAdd
                      ? SizeConfig.screenWidth! * 0.2
                      : SizeConfig.screenWidth! * 0.09,
                  color: !widget.withAdd ? Colors.white : kPrimaryColor,
                ),
              );
            },
          );
        }
      },
    );
  }
}
