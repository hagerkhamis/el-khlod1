import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/auth/login/domain/entities/employee_entity.dart';
import 'package:elkhlod/Features/bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import 'package:elkhlod/Features/table/presentation/manager/cubit/pick_date_cubit.dart';
import 'package:elkhlod/Features/vacation/data/models/vacation.dart';
import 'package:elkhlod/Features/vacation/presentation/manager/add_vacation_cubit/add_vacation_cubit.dart';
import 'package:elkhlod/Features/vacation/presentation/manager/type_vacation_cubit/type_vacation_cubit.dart';
import 'package:elkhlod/Features/vacation/presentation/widgets/custom_date_picker.dart';
import 'package:elkhlod/core/utils/commons.dart';
import 'package:elkhlod/core/utils/constants.dart';
import 'package:elkhlod/core/utils/functions/registration_alert.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../core/locale/app_localizations.dart';
import '../../../../core/utils/gaps.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_orders_raw_icon.dart';
import '../../../../core/widgets/custom_request_text_field.dart';
import '../widgets/custom_drop_down_list.dart';

class EditeVacationScreen extends StatefulWidget {
  const EditeVacationScreen({super.key});

  @override
  State<EditeVacationScreen> createState() => _EditeVacationScreenState();
}

class _EditeVacationScreenState extends State<EditeVacationScreen> {
  Vacation vacation = Vacation();

  @override
  void dispose() {
    BlocProvider.of<AddVacationCubit>(context).close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    vacation = BlocProvider.of<BottomNavCubit>(context).details!;
    final screenSize = MediaQuery.of(context).size;
    String typeId = "";
    final reasonController = TextEditingController(text: vacation.reason);
    BlocProvider.of<PickDateCubit>(context).to = vacation.agazaToDateM;
    BlocProvider.of<PickDateCubit>(context).from = vacation.agazaFromDateM;

    BlocProvider.of<PickDateCubit>(context).valueTo =
        DateTime.parse(vacation.agazaToDateM!);
    BlocProvider.of<PickDateCubit>(context).valueFrom =
        DateTime.parse(vacation.agazaFromDateM!);
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
            child: BlocListener<AddVacationCubit, AddVacationState>(
              listener: (context, state) {
                if (state is DeleteSuccessful) {
                  AlertDialog alert = alertRegistration(
                    context,
                    state.message,
                    () {
                      Navigator.pop(context);

                      BlocProvider.of<BottomNavCubit>(context)
                          .updateBottomNavIndex(kHomeViews);

                      BlocProvider.of<BottomNavCubit>(context)
                          .navigationQueue
                          .addLast(BlocProvider.of<BottomNavCubit>(context)
                              .bottomNavIndex);
                    },
                  );

                  // show the dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
                } else if (state is DeleteFailed) {
                  AlertDialog alert =
                      alertRegistration(context, state.message, () {
                    Navigator.pop(context);
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
                    locale.translate('order_vacation')!,
                    style: const TextStyle(
                      color: Color(0xff000000),
                      fontSize: 20,
                    ),
                  ),
                  CustomOrdersRawIcon(
                      rawText: locale.translate('vacation_type')!,
                      iconImagePath: "assets/icons/vacation_icon.png"),
                  BlocProvider(
                    create: (context) =>
                        getIt<TypeVacationCubit>()..getTypesVacation(),
                    child: CustomDropDownList(
                        initValue: vacation.no3Agaza,
                        onTap: (value) {
                          //  debugPrint("value heeeere $value");
                          typeId = value;
                        },
                        hintText: locale.translate('vacation_type')!),
                  ),
                  // CustomOrdersRawIcon(
                  //     rawText: locale.translate('Period')!,
                  //     iconImagePath: "assets/icons/vacation_icon.png"),
                  // CustomDropDownList(
                  //   hintText: locale.translate('Period')!,
                  // ),

                  BlocBuilder<PickDateCubit, RequestPickDateState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          CustomOrdersRawIcon(
                              rawText: locale
                                  .translate('The_start_date_of_the_leave')!,
                              iconImagePath: "assets/icons/time_icon.png"),
                          CustomDatePicker(
                              onTap: () {
                                BlocProvider.of<PickDateCubit>(context)
                                    .pickDate(context, "from");
                              },
                              //containerWidth: MediaQuery.of(context).size.width / 1.2,
                              customDatePickerText: BlocProvider.of<
                                              PickDateCubit>(context)
                                          .from !=
                                      null
                                  ? "${locale.translate("from_date")!}  ${BlocProvider.of<PickDateCubit>(context).from!}"
                                  : locale.translate("from_date")!),
                          SizedBox(
                            width: screenSize.width * .27,
                          ),
                          CustomOrdersRawIcon(
                              rawText: locale
                                  .translate('the_end_date_of_the_leave')!,
                              iconImagePath: "assets/icons/time_icon.png"),
                          CustomDatePicker(
                              onTap: () async {
                                if (BlocProvider.of<PickDateCubit>(context)
                                        .from ==
                                    null) {
                                  Commons.showToast(context,
                                      message: "يجب اختيار تاريخ البداية اولا");
                                  await BlocProvider.of<PickDateCubit>(context)
                                      .pickDate(context, "to");
                                }
                              },
                              //   containerWidth: MediaQuery.of(context).size.width / 1.2,
                              customDatePickerText: BlocProvider.of<
                                              PickDateCubit>(context)
                                          .to !=
                                      null
                                  ? "${locale.translate("to_date")!}  ${BlocProvider.of<PickDateCubit>(context).to!}"
                                  : locale.translate("to_date")!),
                        ],
                      );
                    },
                  ),

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<AddVacationCubit, AddVacationState>(
                        builder: (context, state) {
                          return state is DeleteLoading
                              ? const CircularProgressIndicator()
                              : CustomButton(
                                  screenWidth:
                                      MediaQuery.of(context).size.width * .3,
                                  buttonTapHandler: () {
                                    {
                                      if (BlocProvider.of<PickDateCubit>(
                                                      context)
                                                  .to !=
                                              null &&
                                          BlocProvider.of<PickDateCubit>(
                                                      context)
                                                  .from !=
                                              null) {
                                        if (BlocProvider.of<PickDateCubit>(
                                                        context)
                                                    .valueFrom !=
                                                null &&
                                            BlocProvider.of<PickDateCubit>(
                                                        context)
                                                    .valueTo !=
                                                null) {
                                          if (BlocProvider.of<PickDateCubit>(
                                                  context)
                                              .valueTo!
                                              .isBefore(BlocProvider.of<
                                                      PickDateCubit>(context)
                                                  .valueFrom!)) {
                                            Commons.showToast(context,
                                                message:
                                                    "يجب اختيار تاريخ بعد هذا");
                                          } else {
                                            var box = Hive.box<EmployeeEntity>(
                                                kEmployeeDataBox);

                                            BlocProvider.of<AddVacationCubit>(
                                                    context)
                                                .editVacation(
                                                    vacation.agazaId!,
                                                    box
                                                        .get(kEmployeeDataBox)!
                                                        .employeeId!,
                                                    typeId.isEmpty
                                                        ? vacation.no3Agaza!
                                                        : typeId,
                                                    BlocProvider.of<
                                                                PickDateCubit>(
                                                            context)
                                                        .from!,
                                                    BlocProvider.of<
                                                                PickDateCubit>(
                                                            context)
                                                        .to!,
                                                    reasonController.text);
                                          }
                                        }
                                      } else {
                                        Commons.showToast(context,
                                            message:
                                                "يجب اختيار تاريخ بعد هذا");
                                      }
                                    }
                                  },
                                  buttonText: locale.translate('accept')!);
                        },
                      ),
                      // CustomButton(
                      //     screenWidth: MediaQuery.of(context).size.width * .3,
                      //     buttonTapHandler: () {
                      //       // Navigator.pop(context);
                      //     },
                      //     buttonText: locale.translate('reject')!)
                    ],
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
