import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/auth/login/domain/entities/employee_entity.dart';
import 'package:elkhlod/Features/visits/presentation/manager/add_mobadarat_cubit/add_visits_cubit.dart';
import 'package:elkhlod/Features/visits/presentation/manager/all_bnod/all_bnod_cubit.dart';
import 'package:elkhlod/Features/visits/presentation/manager/all_teacher/all_teacher_cubit.dart';
import 'package:elkhlod/Features/visits/presentation/widgets/custom_drop_down_list.dart';
import 'package:elkhlod/core/utils/commons.dart';
import 'package:elkhlod/core/utils/constants.dart';
import 'package:elkhlod/core/utils/functions/registration_alert.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../core/utils/gaps.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_request_text_field.dart';

class RequestVisitsScreen extends StatefulWidget {
  const RequestVisitsScreen({super.key});

  @override
  State<RequestVisitsScreen> createState() => _RequestVisitsScreenState();
}

class _RequestVisitsScreenState extends State<RequestVisitsScreen> {
  var box;
  late TextEditingController reasonController;
  late TextEditingController faslController;
  late TextEditingController numStudentController;
  late TextEditingController hesaController;
  late TextEditingController titleController;

  String teacherId = "";

  List<Map<String, dynamic>> bnodItemList = [];

  @override
  void initState() {
    super.initState();
    box = Hive.box<EmployeeEntity>(kEmployeeDataBox);
    reasonController = TextEditingController();
    numStudentController = TextEditingController();
    faslController = TextEditingController();
    hesaController = TextEditingController();
    titleController = TextEditingController();
  }

  final List<String?> _errorTexts = [];

  @override
  void dispose() {
    reasonController.dispose();
    faslController.dispose();
    numStudentController.dispose();
    hesaController.dispose();
    titleController.dispose();
    super.dispose();
  }

  void _validateInput(String value, int index, String? maxDegree, String? id) {
    final enteredValue = int.tryParse(value);
    setState(() {
      if (value.isEmpty) {
        _errorTexts[index] = 'لا يمكن ترك الحقل فارغًا';
      } else if (enteredValue == null) {
        _errorTexts[index] = 'يرجى إدخال قيمة رقمية صحيحة';
      } else if (maxDegree != null && enteredValue > int.parse(maxDegree)) {
        _errorTexts[index] = 'القيمة المدخلة أكبر من الحد الأقصى المسموح';
      } else {
        _errorTexts[index] = null;
        // Clear error
        bnodItemList[index]["band_id"] = id;
        bnodItemList[index]["emp_degree"] = enteredValue;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0, bottom: 30),
            child: BlocListener<AddVisitsCubit, AddVisitsState>(
              listener: (context, state) {
                if (state is AddVisitsSuccessful) {
                  AlertDialog alert =
                      alertRegistration(context, state.message, () async {
                    Navigator.pop(context);
                    Navigator.pop(context, true);
                  }, "assets/images/intro1.png");

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
                } else if (state is AddVisitsFailed) {
                  AlertDialog alert =
                      alertRegistration(context, state.message, () {
                    Navigator.pop(context);
                    FocusScope.of(context).requestFocus(FocusNode());
                  }, "assets/images/intro1.png");

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
                  Gaps.vGap50,
                  const Text(
                    "إضافة زياره",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 20,
                    ),
                  ),
                  Gaps.vGap20,
                  BlocProvider(
                    create: (context) => getIt<AllTeacherCubit>()
                      ..fetchAllTeacher(box.get(kEmployeeDataBox)!.userId!),
                    child: CustomDropDownList(
                      onTap: (value) {
                        teacherId = value;
                        BlocProvider.of<AllBnodCubit>(context)
                            .fetchAllBnod(teacherId);
                      },
                      hintText: "اسم المعلم",
                    ),
                  ),
                  Gaps.vGap10,
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .08,
                    child: CustomRequestsTextField(
                      controller: titleController,
                      hintTextField: "العنوان",
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .09,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .08,
                            width: MediaQuery.of(context).size.width / 3.5,
                            child: CustomRequestsTextField(
                              controller: hesaController,
                              hintTextField: "الحصه",
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .08,
                            width: MediaQuery.of(context).size.width / 3.5,
                            child: CustomRequestsTextField(
                              controller: faslController,
                              hintTextField: "الفصل",
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .08,
                            width: MediaQuery.of(context).size.width / 3.5,
                            child: CustomRequestsTextField(
                              controller: numStudentController,
                              hintTextField: "عدد الطلاب",
                              textInputType: TextInputType.number,
                            ),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .15,
                    child: CustomRequestsTextField(
                      controller: reasonController,
                      hintTextField: "الملاحظات",
                      fieldLines: 10,
                    ),
                  ),
                  Gaps.vGap15,
                  BlocBuilder<AllBnodCubit, AllBnodState>(
                    builder: (context, state) {
                      if (state is AllBnodFetchSuccess) {
                        // Initialize bnodItemList with default values if not initialized
                        if (bnodItemList.isEmpty) {
                          bnodItemList = state.data!
                              .map((item) => {
                                    "band_id": item.bandId,
                                    "emp_degree": 0,
                                    "band_note": ""
                                  })
                              .toList();
                        }

                        return ListView.builder(
                          itemCount: state.data!.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            // Ensure the error list matches the number of fields
                            if (_errorTexts.length < state.data!.length) {
                              _errorTexts
                                  .add(null); // Initialize with no errors
                            }

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${state.data![index].bandName ?? ''} / ${state.data![index].maxDegree ?? ''}",
                                  style: const TextStyle(fontSize: 18),
                                ),
                                const SizedBox(height: 8),
                                TextField(
                                  onChanged: (value) {
                                    _validateInput(
                                        value,
                                        index,
                                        state.data![index].maxDegree,
                                        state.data![index].bandId);
                                  },
                                  onSubmitted: (value) {
                                    _validateInput(
                                        value,
                                        index,
                                        state.data![index].maxDegree,
                                        state.data![index].bandId);
                                  },
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    labelText: 'اضف الدرجه',
                                    errorText: _errorTexts[index],
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                                const SizedBox(height: 8),
                                TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      bnodItemList[index]["band_note"] = value;
                                    });
                                  },
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'اضف ملاحظة',
                                  ),
                                ),
                                const SizedBox(height: 16),
                              ],
                            );
                          },
                        );
                      } else if (state is AllBnodFetchFailure) {
                        return const SizedBox();
                      } else if (state is FetchBnodLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return const SizedBox();
                    },
                  ),
                  BlocBuilder<AddVisitsCubit, AddVisitsState>(
                    builder: (context, state) {
                      return state is AddVisitsLoading
                          ? const CircularProgressIndicator()
                          : CustomButton(
                              screenWidth:
                                  MediaQuery.of(context).size.width * .7,
                              buttonTapHandler: () {
                                if (teacherId.isEmpty) {
                                  Commons.showToast(context,
                                      message: "الرجاء اختيار المعلم ");
                                } else if (faslController.text == "" ||
                                    numStudentController.text == "" ||
                                    hesaController.text == "" ||
                                    titleController.text == "" ||
                                    reasonController.text == "") {
                                  Commons.showToast(context,
                                      message: "الحقول المطلوبة فارغة");
                                } else {
                                  print("bnodItemList: $bnodItemList");

                                  var box = Hive.box<EmployeeEntity>(
                                      kEmployeeDataBox);
                                  BlocProvider.of<AddVisitsCubit>(context)
                                      .addVisits(
                                          box
                                              .get(kEmployeeDataBox)!
                                              .employeeId!,
                                          teacherId,
                                          titleController.text,
                                          reasonController.text,
                                          hesaController.text,
                                          numStudentController.text,
                                          faslController.text,
                                          bnodItemList);
                                }
                              },
                              buttonText: "توثيق",
                            );
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
