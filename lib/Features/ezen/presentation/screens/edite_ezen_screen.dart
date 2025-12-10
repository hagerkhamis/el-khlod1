import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/auth/login/domain/entities/employee_entity.dart';
import 'package:elkhlod/Features/bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import 'package:elkhlod/Features/ezen/data/models/ezen.dart';
import 'package:elkhlod/Features/ezen/presentation/manager/add_ezen_cubit/add_ezen_cubit.dart';
import 'package:elkhlod/Features/ezen/presentation/manager/type_ezen_cubit/type_ezen_cubit.dart';
import 'package:elkhlod/core/utils/constants.dart';
import 'package:elkhlod/core/utils/functions/registration_alert.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../core/locale/app_localizations.dart';
import '../../../../core/utils/gaps.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_orders_raw_icon.dart';
import '../../../../core/widgets/custom_request_text_field.dart';
import '../../../table/presentation/manager/cubit/pick_date_cubit.dart';
import '../widgets/custom_drop_down_list.dart';
import '../widgets/custom_time_picker_widget.dart';

class EditeEzenScreen extends StatefulWidget {
  const EditeEzenScreen({super.key});

  @override
  State<EditeEzenScreen> createState() => _EditeEzenScreenState();
}

class _EditeEzenScreenState extends State<EditeEzenScreen> {
  Ezen ezen = const Ezen();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PickDateCubit>(context).to = null;

    ezen = BlocProvider.of<BottomNavCubit>(context).details!;
    final screenSize = MediaQuery.of(context).size;
    String fromTime = "", toTime = "", typeId = "";
    final reasonController = TextEditingController(text: ezen.reason);

    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    return FadeInUp(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: screenSize * .1, child: const CustomAppBar()),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0, bottom: 30),
            child: BlocListener<AddEzenCubit, AddEzenState>(
              listener: (context, state) {
                if (state is AddEzenSuccessful) {
                  AlertDialog alert = alertRegistration(
                    context,
                    state.message,
                    () {
                      Navigator.pop(context);
                      BlocProvider.of<BottomNavCubit>(context)
                          .navigationQueue
                          .removeLast();

                      BlocProvider.of<BottomNavCubit>(context)
                          .updateBottomNavIndex(
                              BlocProvider.of<BottomNavCubit>(context)
                                  .navigationQueue
                                  .last);
                    },
                  );

                  // show the dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
                } else if (state is AddEzenFailed) {
                  AlertDialog alert =
                      alertRegistration(context, state.message, () {
                    Navigator.pop(context);
                    BlocProvider.of<BottomNavCubit>(context)
                        .navigationQueue
                        .removeLast();

                    BlocProvider.of<BottomNavCubit>(context)
                        .updateBottomNavIndex(
                            BlocProvider.of<BottomNavCubit>(context)
                                .navigationQueue
                                .last);
                  }, "assets/images/intro1.png");

                  // show the dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
                }
              },
              child: Column(
                children: [
                  Text(
                    locale.translate('permission_request')!,
                    style: const TextStyle(
                      color: Color(0xff000000),
                      fontSize: 20,
                    ),
                  ),
                  CustomOrdersRawIcon(
                      rawText: locale.translate('permission_type')!,
                      iconImagePath: "assets/icons/vacation_icon.png"),
                  BlocProvider(
                    create: (context) => getIt<TypeEzenCubit>()..getTypesEzen(),
                    child: CustomDropDownList(
                        initValue: ezen.no3Ezn,
                        onTap: (value) {
                          //  debugPrint("value heeeere $value");
                          typeId = value;
                        },
                        hintText: locale.translate('permission_type')!),
                  ),
                  // CustomOrdersRawIcon(
                  //     rawText: locale.translate('Period')!,
                  //     iconImagePath: "assets/icons/vacation_icon.png"),
                  // CustomDropDownList(
                  //   hintText: locale.translate('Period')!,
                  // ),
                  Row(
                    children: [
                      CustomOrdersRawIcon(
                          rawText: locale.translate('start_permission')!,
                          iconImagePath: "assets/icons/time_icon.png"),
                      SizedBox(
                        width: screenSize.width * .27,
                      ),
                      CustomOrdersRawIcon(
                          rawText: locale.translate('end_permission')!,
                          iconImagePath: "assets/icons/time_icon.png"),
                    ],
                  ),
                  Row(
                    children: [
                      CustomTimePicker(
                          timePickerText: ezen.fromHour!,
                          onTap: (value) {
                            // debugPrint("value heeeere $value");
                            fromTime = value;
                          }),
                      const Spacer(),
                      CustomTimePicker(
                        timePickerText: ezen.toHour!,
                        onTap: (value) {
                          //  debugPrint("value heeeere $value");
                          toTime = value;
                        },
                      ),
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     CustomOrdersRawIcon(
                  //         rawText: locale.translate('Period')!,
                  //         iconImagePath: "assets/icons/time_icon.png"),
                  //     SizedBox(
                  //       width: screenSize.width * .32,
                  //     ),
                  //     CustomOrdersRawIcon(
                  //         rawText: locale.translate('remaining_time')!,
                  //         iconImagePath: "assets/icons/time_icon.png"),
                  //   ],
                  // ),
                  // Row(
                  //   children: [
                  //     CustomTimePicker(
                  //       timePickerText: locale.translate('Period')!,
                  //     ),
                  //     const Spacer(),
                  //     CustomTimePicker(
                  //       timePickerText: locale.translate('remaining_time')!,
                  //     )
                  //   ],
                  // ),
                  // OutPutContainer(
                  //   containerIconPath: "assets/icons/hashtag_icon.png",
                  //   containerTitle:
                  //       locale.translate('the_number_of_permissions_left')!,
                  //   containerWidth: double.infinity,
                  //   containerText:
                  //       locale.translate('the_number_of_permissions_left')!,
                  // ),
                  CustomOrdersRawIcon(
                    rawText: locale.translate('the_reason')!,
                    iconImagePath: "assets/icons/notes_icon.png",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .1,
                    child: CustomRequestsTextField(
                      controller: reasonController,
                      hintTextField: locale.translate('the_reason')!,
                    ),
                  ),
                  Gaps.vGap15,
                  BlocBuilder<AddEzenCubit, AddEzenState>(
                    builder: (context, state) {
                      return state is AddEzenLoading
                          ? const CircularProgressIndicator()
                          : CustomButton(
                              screenWidth:
                                  MediaQuery.of(context).size.width * .7,
                              buttonTapHandler: () {
                                var box =
                                    Hive.box<EmployeeEntity>(kEmployeeDataBox);
                                BlocProvider.of<AddEzenCubit>(context).editEzen(
                                    ezen.eznId!,
                                    box.get(kEmployeeDataBox)!.employeeId!,
                                    typeId.isEmpty ? ezen.no3Ezn! : typeId,
                                    fromTime.isEmpty
                                        ? ezen.fromHour!
                                        : fromTime,
                                    toTime.isEmpty ? ezen.toHour! : toTime,
                                    reasonController.text,
                                    BlocProvider.of<PickDateCubit>(context)
                                        .to!);
                              },
                              buttonText: locale.translate('accept')!);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
