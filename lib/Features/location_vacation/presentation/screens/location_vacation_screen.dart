




































import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/auth/login/domain/entities/employee_entity.dart';
import 'package:elkhlod/Features/bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import 'package:elkhlod/Features/location_vacation/presentation/manager/location_vacation_cubit/location_vacation_cubit.dart';
import 'package:elkhlod/Features/location_vacation/presentation/manager/location_vacation_cubit/location_vacation_state.dart';
import 'package:elkhlod/Features/location_vacation/presentation/widgets/data_pickar_field.dart';
import 'package:elkhlod/Features/location_vacation/presentation/widgets/label_text_field.dart';
import 'package:elkhlod/Features/location_vacation/presentation/widgets/vacation_type_field.dart';
import 'package:elkhlod/core/utils/constants.dart';
import 'package:elkhlod/core/locale/app_localizations.dart';


class LocationVacationScreen extends StatefulWidget {
  const LocationVacationScreen({super.key});

  @override
  State<LocationVacationScreen> createState() => _LocationVacationScreenState();
}

class _LocationVacationScreenState extends State<LocationVacationScreen> {
  final TextEditingController empPhoneController = TextEditingController();
  final TextEditingController empNameController = TextEditingController();
  final TextEditingController fromDateController = TextEditingController();
  final TextEditingController toDateController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();
  final TextEditingController typeController = TextEditingController();

  String? selectedTypeId;
  List<Map<String, dynamic>> vacationTypes = [];

  @override
  void initState() {
    super.initState();
    context.read<LocationVacationCubit>().fetchVacationTypes();
  }

  @override
  void dispose() {
    empPhoneController.dispose();
    empNameController.dispose();
    fromDateController.dispose();
    toDateController.dispose();
    reasonController.dispose();
    typeController.dispose();
    super.dispose();
  }

  void sendVacationRequest(EmployeeEntity? currentUser) {
    if (empPhoneController.text.isEmpty ||
        empNameController.text.isEmpty ||
        fromDateController.text.isEmpty ||
        toDateController.text.isEmpty ||
        reasonController.text.isEmpty ||
        selectedTypeId == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("يجب إدخال جميع الحقول")));
      return;
    }

    context.read<LocationVacationCubit>().sendVacation(
          moderEmpId: currentUser?.employeeId ?? "",
          empPhoneNum: empPhoneController.text,
          empName: empNameController.text,
          no3AgazaId: selectedTypeId!,
          fromDate: fromDateController.text,
          toDate: toDateController.text,
          reason: reasonController.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);
    final currentUser = box.get(kEmployeeDataBox);
    if ((empNameController.text.isEmpty) && (currentUser?.employeeName?.isNotEmpty ?? false)) {
      empNameController.text = currentUser!.employeeName!;
    }
    if ((empPhoneController.text.isEmpty) && (currentUser?.phoneNumber?.isNotEmpty ?? false)) {
      empPhoneController.text = currentUser!.phoneNumber!;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.grey.shade300,
              child: Text(
                (currentUser?.employeeName ?? "U").substring(0, 1),
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("أهلاً بك", style: TextStyle(fontSize: 14, color: Colors.grey)),
                Text(
                  currentUser?.employeeName ?? "",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 14),
            child: Image.asset('assets/icons/notification_icon.png', width: 28, height: 28),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: BlocConsumer<LocationVacationCubit, LocationVacationState>(
            listener: (context, state) {
              if (state is LocationVacationSuccess) {
                if (!mounted) return;
                final bottomNavCubit = context.read<BottomNavCubit>();
                bottomNavCubit.updateBottomNavIndex(kMyOrdersView);
                bottomNavCubit.navigationQueue.addLast(kMyOrdersView);
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop(state.message);
                }
              } else if (state is LocationVacationError) {
                if (!mounted) return;
                final messenger = ScaffoldMessenger.maybeOf(context);
                messenger?.showSnackBar(SnackBar(content: Text(state.message)));
              } else if (state is LocationVacationTypesLoaded) {
                setState(() {
                  vacationTypes = state.types;
                  if (selectedTypeId == null && vacationTypes.isNotEmpty) {
                    selectedTypeId = vacationTypes.first['vacation_id'].toString();
                  } else if (selectedTypeId != null &&
                      vacationTypes.every(
                        (element) => element['vacation_id'].toString() != selectedTypeId,
                      )) {
                    selectedTypeId = vacationTypes.isNotEmpty ? vacationTypes.first['vacation_id'].toString() : null;
                  }
                });
              }
            },
            builder: (context, state) {
              if (state is LocationVacationTypesLoaded) {
                vacationTypes = state.types;
                if (selectedTypeId == null && vacationTypes.isNotEmpty) {
                  selectedTypeId = vacationTypes.first['vacation_id'].toString();
                }
              }
              final bool isLoadingTypes = state is LocationVacationLoading && vacationTypes.isEmpty;
              final bool isSubmitting = state is LocationVacationLoading && vacationTypes.isNotEmpty;

              String selectedTypeName = typeController.text.trim();
              if (vacationTypes.isNotEmpty && selectedTypeId != null) {
                final selectedType = vacationTypes.firstWhere(
                  (element) => element['vacation_id'].toString() == selectedTypeId,
                  orElse: () => <String, dynamic>{},
                );
                final resolvedName = selectedType['vacation_name']?.toString();
                if (resolvedName != null && resolvedName.isNotEmpty) {
                  selectedTypeName = resolvedName;
                } else if (selectedTypeName.isEmpty) {
                  selectedTypeName =
                      vacationTypes.first['vacation_name']?.toString().trim() ?? selectedTypeName;
                }
              }
              debugPrint("📌 selectedTypeId: $selectedTypeId");
              debugPrint("📌 selectedTypeName: $selectedTypeName");
              debugPrint("📌 vacationTypes: $vacationTypes");

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(locale.translate('manager_vacation') ?? "إجازة المدرين",
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black)),
                  ),
                  const SizedBox(height: 25),
                  LabeledTextField(
                      label: locale.translate('employee_phone') ?? "رقم تليفون الموظف",
                      controller: empPhoneController),
                  LabeledTextField(
                      label: locale.translate('employee_name') ?? "اسم الموظف",
                      controller: empNameController),
                  if (isLoadingTypes)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Center(child: CircularProgressIndicator()),
                    )
                  else if (vacationTypes.isEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        locale.translate('no_vacation_types') ?? "لا توجد أنواع إجازة متاحة حالياً.",
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    )
                  else ...[
                    VacationTypeField(
                      types: vacationTypes,
                      selectedTypeId: selectedTypeId,
                      controller: typeController,
                      onSelected: (value) {
                        setState(() {
                          selectedTypeId = value;
                        });
                      },
                    ),
                    if (selectedTypeName.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${locale.translate('vacation_type') ?? 'نوع الإجازة'}  : ",
                                  style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 12),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  selectedTypeName,
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                  ],
                  DatePickerField(
                      label: locale.translate('from_date') ?? "تاريخ بداية الإجازة",
                      controller: fromDateController),
                  DatePickerField(
                      label: locale.translate('to_date') ?? "تاريخ نهاية الإجازة",
                      controller: toDateController),
                  LabeledTextField(label: locale.translate('reason') ?? "السبب", controller: reasonController),
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: isSubmitting ? null : () => sendVacationRequest(currentUser),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 15, 37, 55),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: isSubmitting
                              ? const SizedBox(
                                  height: 18,
                                  width: 18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                  ),
                                )
                              : const Text(
                                  "إرسال الطلب",
                                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}




































