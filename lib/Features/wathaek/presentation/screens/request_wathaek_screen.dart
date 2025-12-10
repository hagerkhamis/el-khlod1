import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/auth/login/domain/entities/employee_entity.dart';
import 'package:elkhlod/Features/bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import 'package:elkhlod/core/utils/commons.dart';
import 'package:elkhlod/core/utils/constants.dart';
import 'package:elkhlod/core/utils/functions/registration_alert.dart';
import 'package:elkhlod/core/widgets/custom_elevated_container.dart';

import '../../../../core/locale/app_localizations.dart';
import '../../../../core/utils/gaps.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_orders_raw_icon.dart';
import '../../../../core/widgets/custom_request_text_field.dart';
import '../manager/add_wathaek_cubit/add_wathaek_cubit.dart';
import '../manager/select_multi_files/select_multi_file_cubit.dart';

class RequestWathaekScreen extends StatefulWidget {
  const RequestWathaekScreen({super.key});

  @override
  State<RequestWathaekScreen> createState() => _RequestWathaekScreenState();
}

class _RequestWathaekScreenState extends State<RequestWathaekScreen> {
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
    late AppLocalizations locale = AppLocalizations.of(context)!;
    List<File>? selectedFile = [];
    // MultipartFile? ss;

    // double todouble(TimeOfDay mytime) => mytime.hour + mytime.minute / 60.0;
    return FadeInUp(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: screenSize * .1, child: const CustomAppBar()),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0, bottom: 30),
            child: BlocListener<AddWathaekCubit, AddWathaekState>(
              listener: (context, state) {
                if (state is AddWathaekSuccessful) {
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
                } else if (state is AddWathaekFailed) {
                  AlertDialog alert =
                      alertRegistration(context, state.message, () {
                    Navigator.pop(context);
                    FocusScope.of(context).requestFocus(FocusNode());
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
                    "إضافة توثيق",
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
                    height: MediaQuery.of(context).size.height * .1,
                    child: CustomRequestsTextField(
                      controller: reasonController,
                      hintTextField: "الوصف",
                    ),
                  ),
                  Gaps.vGap15,

                  GestureDetector(
                    onTap: () async {
                      await BlocProvider.of<SelectMultiFileCubit>(context)
                          .pickFileFromDevice();
                    },
                    child: CustomElevatedContainer(
                      containerHeight: MediaQuery.of(context).size.height * .3,
                      containerWidth: MediaQuery.of(context).size.width,
                      containerChild: BlocBuilder<SelectMultiFileCubit,
                          SelectMultiFileState>(
                        builder: (context, state) {
                          if (state is PickImageState) {
                            selectedFile = state.imagePath;

                            return GridView.builder(
                                itemCount: selectedFile!.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                ),
                                itemBuilder: (context, index) {
                                  return Image.file(
                                    selectedFile![index],
                                    fit: BoxFit.fill,
                                    width:
                                        MediaQuery.of(context).size.width / 1.5,
                                    height: double.infinity,
                                  );
                                });
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
                  BlocBuilder<AddWathaekCubit, AddWathaekState>(
                    builder: (context, state) {
                      return state is AddWathaekLoading
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
                                  BlocProvider.of<AddWathaekCubit>(context)
                                      .addWathaek(
                                          box
                                              .get(kEmployeeDataBox)!
                                              .employeeId!,
                                          titleController.text,
                                          reasonController.text,
                                          selectedFile!);
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
