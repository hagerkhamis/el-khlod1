import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/auth/login/domain/entities/employee_entity.dart';
import 'package:elkhlod/Features/bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import 'package:elkhlod/Features/mobadarat/presentation/manager/add_mobadarat_cubit/add_mobadarat_cubit.dart';
import 'package:elkhlod/core/utils/commons.dart';
import 'package:elkhlod/core/utils/constants.dart';
import 'package:elkhlod/core/utils/functions/registration_alert.dart';

import '../../../../core/locale/app_localizations.dart';
import '../../../../core/utils/gaps.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_orders_raw_icon.dart';
import '../../../../core/widgets/custom_request_text_field.dart';

class RequestMobadaratScreen extends StatefulWidget {
  const RequestMobadaratScreen({super.key});

  @override
  State<RequestMobadaratScreen> createState() => _RequestMobadaratScreenState();
}

class _RequestMobadaratScreenState extends State<RequestMobadaratScreen> {
  late TextEditingController reasonController;
  late TextEditingController titleController;

  @override
  void initState() {
    super.initState();
    reasonController = TextEditingController();
    titleController = TextEditingController();
  }

  @override
  void dispose() {
    reasonController.dispose();
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    // final reasonController = TextEditingController();
    // final titleController = TextEditingController();

    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;

    //double todouble(TimeOfDay mytime) => mytime.hour + mytime.minute / 60.0;
    return FadeInUp(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: screenSize * .1, child: const CustomAppBar()),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0, bottom: 30),
            child: BlocListener<AddMobadaratCubit, AddMobadaratState>(
              listener: (context, state) {
                if (state is AddMobadaratSuccessful) {
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
                } else if (state is AddMobadaratFailed) {
                  AlertDialog alert =
                      alertRegistration(context, state.message, () {
                    Navigator.pop(context);
                    FocusScope.of(context).requestFocus(FocusNode());

                    /*  BlocProvider.of<BottomNavCubit>(context)
                        .navigationQueue
                        .addLast(BlocProvider.of<BottomNavCubit>(context)
                            .bottomNavIndex);
                    BlocProvider.of<BottomNavCubit>(context)
                        .updateBottomNavIndex(kHomeViews);*/
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
                  const Text(
                    "إضافة مبادرة",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 20,
                    ),
                  ),
                  const CustomOrdersRawIcon(
                      rawText: "العنوان ",
                      iconImagePath: "assets/icons/vacation_icon.png"),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * .1,
                    child: CustomRequestsTextField(
                      controller: titleController,
                      hintTextField: "العنوان",
                    ),
                  ),
                  // BlocProvider(
                  //   create: (context) =>
                  //       getIt<TypeTalabatCubit>()..getTypesEzen(),
                  //   child: CustomDropDownList(
                  //       onTap: (value) {
                  //         //  debugPrint("value heeeere $value");
                  //         typeId = value;
                  //       },
                  //       hintText: locale.translate('permission_type')!),
                  // ),
                  const CustomOrdersRawIcon(
                    rawText: "الوصف",
                    iconImagePath: "assets/icons/notes_icon.png",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .2,
                    child: CustomRequestsTextField(
                      controller: reasonController,
                      hintTextField: "الوصف",
                      fieldLines: 10,
                    ),
                  ),
                  Gaps.vGap15,
                  BlocBuilder<AddMobadaratCubit, AddMobadaratState>(
                    builder: (context, state) {
                      return state is AddMobadaratLoading
                          ? const CircularProgressIndicator()
                          : CustomButton(
                              screenWidth:
                                  MediaQuery.of(context).size.width * .7,
                              buttonTapHandler: () {
                                if (titleController.text == "") {
                                  Commons.showToast(context,
                                      message: "العنوان مطلوب");
                                } else {
                                  var box = Hive.box<EmployeeEntity>(
                                      kEmployeeDataBox);
                                  BlocProvider.of<AddMobadaratCubit>(context)
                                      .addMobadarat(
                                          box
                                              .get(kEmployeeDataBox)!
                                              .employeeId!,
                                          titleController.text,
                                          reasonController.text);
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
