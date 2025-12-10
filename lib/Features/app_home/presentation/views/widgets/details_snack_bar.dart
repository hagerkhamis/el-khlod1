import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/app_home/presentation/manger/finger_print_cubit.dart';
import 'package:elkhlod/Features/app_home/presentation/views/widgets/stack_fingerprint_logo.dart';
import 'package:elkhlod/Features/auth/login/domain/entities/employee_entity.dart';
import 'package:elkhlod/core/utils/gaps.dart';

import '../../../../../core/locale/app_localizations.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/media_query_sizes.dart';
import 'details_snack_bar_item.dart';

// ignore: must_be_immutable
class DetailsSnackBar extends StatefulWidget {
  final bool withAdd;

  const DetailsSnackBar({
    super.key,
    required this.withAdd,
  });

  @override
  State<DetailsSnackBar> createState() => _DetailsSnackBarState();
}

class _DetailsSnackBarState extends State<DetailsSnackBar> {
  late AppLocalizations locale;
  var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);

  @override
  void initState() {
    _onInit();
    super.initState();
  }

  // @override
  // void dispose() {
  //   BlocProvider.of<FingerPrintCubit>(context).close();
  //   super.dispose();
  // }

  void _onInit() async {
    if (box.get(kEmployeeDataBox) != null) {
      await BlocProvider.of<FingerPrintCubit>(context)
          .getUserData(box.get(kEmployeeDataBox)!.employeeCode!);
    }
  }

  @override
  Widget build(BuildContext context) {
    locale = AppLocalizations.of(context)!;

    SizeConfig().init(context);

    // var now = DateTime.now();
    // var formatterDate = DateFormat('yyyy-MM-dd');
    //String formattedDate = formatterDate.format(now);

    return Container(
        width: 300.w,
        // height: SizeConfig.screenHeight! * 0.1,
        margin: const EdgeInsets.only(
          top: 10,
        ),
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
                color: Color(0x29000000),
                offset: Offset(0, 3),
                blurRadius: 6,
                spreadRadius: 0)
          ],
        ),
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.defaultSize! * 4,
                vertical: SizeConfig.defaultSize! * 0.4),
            child: BlocBuilder<FingerPrintCubit, FingerPrintState>(
              builder: (context, state) {
                if (state is FingerPrintLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is FingerPrintSuccessful) {
                  return Row(
                    children: [
                      DetailsSnackBarItem(
                        icon: Icons.login_rounded,
                        timeText: state.data.hdoorTime ?? '---- ',
                        actionText: locale.translate("attendance_register")!,
                      ),
                      state.data.lateMin != null
                          ? int.parse(state.data.lateMin) > 0
                              ? Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                      Text(state.data.lateMin ?? '---- ',
                                          style: TextStyle(
                                            //fontFamily: 'HacenTunisia',
                                            color: Colors.red,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w900,
                                            fontStyle: FontStyle.normal,
                                          )),
                                      Gaps.vGap5,
                                      Text("دقايق التأخير",
                                          style: TextStyle(
                                            //fontFamily: 'HacenTunisia',
                                            color: Colors.red,
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.bold,
                                          ))
                                    ])
                              : const SizedBox()
                          : const SizedBox(),
                      DetailsSnackBarItem(
                        icon: Icons.logout_outlined,
                        timeText: state.data.ensrafTime ?? '---- ',
                        actionText: locale.translate("leaving_register")!,
                        rotate: true,
                      ),
                      widget.withAdd == false
                          ? const SizedBox()
                          : StackFingerPrintLogo(
                              withAdd: widget.withAdd,
                            ),
                    ],
                  );
                }
                return Row(
                  children: [
                    DetailsSnackBarItem(
                      icon: Icons.login_rounded,
                      timeText: '---- ',
                      actionText: locale.translate("attendance_register")!,
                    ),
                    DetailsSnackBarItem(
                      icon: Icons.logout_outlined,
                      timeText: '---- ',
                      actionText: locale.translate("leaving_register")!,
                      rotate: true,
                    ),
                    widget.withAdd == false
                        ? const SizedBox()
                        : StackFingerPrintLogo(
                            withAdd: widget.withAdd,
                          ),
                  ],
                );
              },
            )));
  }
}
