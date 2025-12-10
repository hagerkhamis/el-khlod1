import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/auth/login/domain/entities/employee_entity.dart';
import 'package:elkhlod/Features/bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import 'package:elkhlod/Features/permission_edara/presentation/manager/add_talabat_cubit/add_talabt_cubit.dart';
import 'package:elkhlod/Features/permission_edara/presentation/manager/type_talabat_cubit/type_talabat_cubit.dart';
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

class RequestPermissionEdaraScreen extends StatefulWidget {
  const RequestPermissionEdaraScreen({super.key});

  @override
  State<RequestPermissionEdaraScreen> createState() =>
      _RequestPermissionEdaraScreenState();
}

class _RequestPermissionEdaraScreenState
    extends State<RequestPermissionEdaraScreen> {
  late TextEditingController reasonController;

  @override
  void initState() {
    super.initState();
    reasonController = TextEditingController();
  }

  @override
  void dispose() {
    reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    String typeId = "";

    // final reasonController = TextEditingController();

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
            child: BlocListener<AddTalabtCubit, AddTalabatState>(
              listener: (context, state) {
                if (state is AddTalabatSuccessful) {
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
                } else if (state is AddTalabatFailed) {
                  AlertDialog alert =
                      alertRegistration(context, state.message, () {
                    Navigator.pop(context);
                    FocusScope.of(context).requestFocus(FocusNode());

                    /* BlocProvider.of<BottomNavCubit>(context)
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
                    "طلب إداري",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 20,
                    ),
                  ),
                  const CustomOrdersRawIcon(
                      rawText: "نوع الطلب",
                      iconImagePath: "assets/icons/vacation_icon.png"),
                  BlocProvider(
                    create: (context) =>
                        getIt<TypeTalabatCubit>()..getTypesEzen(),
                    child: CustomDropDownList(
                        onTap: (value) {
                          //  debugPrint("value heeeere $value");
                          typeId = value;
                        },
                        hintText: locale.translate('permission_type')!),
                  ),
                  const CustomOrdersRawIcon(
                    rawText: "الوصف",
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
                  BlocBuilder<AddTalabtCubit, AddTalabatState>(
                    builder: (context, state) {
                      return state is AddTalabatLoading
                          ? const CircularProgressIndicator()
                          : CustomButton(
                              screenWidth:
                                  MediaQuery.of(context).size.width * .7,
                              buttonTapHandler: () {
                                if (typeId.isEmpty) {
                                  Commons.showToast(context,
                                      message: "نوع الطلب ضروري");
                                } else {
                                  var box = Hive.box<EmployeeEntity>(
                                      kEmployeeDataBox);
                                  BlocProvider.of<AddTalabtCubit>(context)
                                      .addTalabat(
                                          box
                                              .get(kEmployeeDataBox)!
                                              .employeeId!,
                                          typeId,
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
