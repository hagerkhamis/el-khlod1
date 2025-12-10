import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/auth/login/domain/entities/employee_entity.dart';
import 'package:elkhlod/Features/bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import 'package:elkhlod/Features/table/presentation/manager/cubit/pick_date_cubit.dart';
import 'package:elkhlod/Features/vacation/presentation/manager/add_vacation_cubit/add_vacation_cubit.dart';
import 'package:elkhlod/Features/vacation/presentation/manager/select_file/presentation/cubit/select_file_vacation_cubit.dart';
import 'package:elkhlod/Features/vacation/presentation/manager/type_vacation_cubit/type_vacation_cubit.dart';
import 'package:elkhlod/Features/vacation/presentation/widgets/custom_date_picker.dart';
import 'package:elkhlod/core/utils/commons.dart';
import 'package:elkhlod/core/utils/constants.dart';
import 'package:elkhlod/core/utils/functions/registration_alert.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';
import 'package:elkhlod/core/widgets/custom_elevated_container.dart';

import '../../../../core/locale/app_localizations.dart';
import '../../../../core/utils/gaps.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_orders_raw_icon.dart';
import '../../../../core/widgets/custom_request_text_field.dart';
import '../widgets/custom_drop_down_list.dart';

class RequestVacationScreen extends StatefulWidget {
  const RequestVacationScreen({super.key});

  @override
  State<RequestVacationScreen> createState() => _RequestVacationScreenState();
}

class _RequestVacationScreenState extends State<RequestVacationScreen> {
  late TextEditingController reasonController;
  File? selectedFile;

  @override
  void initState() {
    super.initState();
    reasonController = TextEditingController();
  }

  @override
  void dispose() {
    reasonController.dispose();

    BlocProvider.of<AddVacationCubit>(context).close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PickDateCubit>(context).to = null;
    BlocProvider.of<PickDateCubit>(context).from = null;
    final screenSize = MediaQuery.of(context).size;
    String typeId = "";

    // final reasonController = TextEditingController();

    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;

    //  double todouble(TimeOfDay mytime) => mytime.hour + mytime.minute / 60.0;
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
                                      message: "يجب اختيار تاريخ البدء اولا");
                                } else {
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
                  GestureDetector(
                    onTap: () async {
                      await BlocProvider.of<SelectFileVacationCubit>(context)
                          .pickFileFromDevice();
                    },
                    child: CustomElevatedContainer(
                      containerHeight: MediaQuery.of(context).size.height * .1,
                      containerWidth: MediaQuery.of(context).size.width,
                      containerChild: BlocBuilder<SelectFileVacationCubit,
                          SelectFileVacationState>(
                        builder: (context, state) {
                          if (state is PickFileState) {
                            selectedFile = state.filePath;

                            return Center(
                              child: Text(state.fileName),
                            );
                          } else if (state is PickImageState) {
                            selectedFile = state.imagePath;
                            return Image.file(
                              state.imagePath,
                              fit: BoxFit.fill,
                              width: MediaQuery.of(context).size.width / 1.5,
                              height: double.infinity,
                            );
                          } else {
                            return Image.asset(
                              "assets/images/upload_cloud.png",
                              alignment: Alignment.center,
                              width: 50,
                              height: 50,
                              //  MediaQuery.of(context).size.width * 1
                            );
                          }
                        },
                      ),
                    ),
                  ),

                  Gaps.vGap15,
                  BlocBuilder<AddVacationCubit, AddVacationState>(
                    builder: (context, state) {
                      return state is DeleteLoading
                          ? const CircularProgressIndicator()
                          : CustomButton(
                              screenWidth:
                                  MediaQuery.of(context).size.width * .7,
                              buttonTapHandler: () {
                                if (typeId.isEmpty) {
                                  Commons.showToast(context,
                                      message: "نوع الاجازة ضروري");
                                } else {
                                  if (BlocProvider.of<PickDateCubit>(context)
                                              .to !=
                                          null &&
                                      BlocProvider.of<PickDateCubit>(context)
                                              .from !=
                                          null) {
                                    if (BlocProvider.of<PickDateCubit>(context)
                                                .valueFrom !=
                                            null &&
                                        BlocProvider.of<PickDateCubit>(context)
                                                .valueTo !=
                                            null) {
                                      if (BlocProvider.of<PickDateCubit>(
                                              context)
                                          .valueTo!
                                          .isBefore(
                                              BlocProvider.of<PickDateCubit>(
                                                      context)
                                                  .valueFrom!)) {
                                        Commons.showToast(context,
                                            message:
                                                "يجب اختيار تاريخ بعد تاريخ البدء");
                                      } else {
                                        var box = Hive.box<EmployeeEntity>(
                                            kEmployeeDataBox);
                                        BlocProvider.of<AddVacationCubit>(
                                                context)
                                            .addVacation(
                                                box
                                                    .get(kEmployeeDataBox)!
                                                    .employeeId!,
                                                typeId,
                                                BlocProvider.of<PickDateCubit>(
                                                        context)
                                                    .from!,
                                                BlocProvider.of<PickDateCubit>(
                                                        context)
                                                    .to!,
                                                reasonController.text,
                                                selectedFile);
                                      }
                                    }
                                  } else {
                                    Commons.showToast(context,
                                        message:
                                            "يجب اختيار تاريخ البدء والانتهاء");
                                  }
                                }
                              },
                              buttonText: locale.translate('send_order')!);
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
