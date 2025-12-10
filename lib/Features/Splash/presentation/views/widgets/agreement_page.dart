import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/Splash/domain/entities/alert_entity.dart';
import 'package:elkhlod/Features/Splash/presentation/manger/add_alert_cubit/add_alert_cubit.dart';
import 'package:elkhlod/Features/Splash/presentation/manger/alert_cubit/alert_cubit.dart';
import 'package:elkhlod/Features/auth/login/domain/entities/employee_entity.dart';
import 'package:elkhlod/core/utils/commons.dart';
import 'package:elkhlod/core/utils/constants.dart';
import 'package:elkhlod/core/widgets/custom_simple_app_bar.dart';

class AgreementPage extends StatefulWidget {
  const AgreementPage({super.key});

  @override
  State<AgreementPage> createState() => _AgreementPageState();
}

class _AgreementPageState extends State<AgreementPage> {
  bool _isChecked = false;
  var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: MediaQuery.of(context).size * .07,
        child: CustomSimpleAppBar(
          appBarTitle: "إقـــرار",
          backHandler: () {
            Commons.showToast(context,
                message: "يرجى الموافقة على جميع البنود المذكورة");
          },
        ),
      ),
      body: BlocListener<AddAlertCubit, AddAlertState>(
        listener: (context, state) {
          if (state is AddAlertSuccessful) {
            Navigator.pushReplacementNamed(context, kBottomNavRoute,
                arguments: 0);
          } else if (state is AddAlertFailed) {
            if (state.message == "تمت الإضافة مسبقًا لهذا الإقرار") {
              Navigator.pushReplacementNamed(context, kBottomNavRoute,
                  arguments: 0);
            } else {
              Commons.showToast(context, message: state.message);
            }
          }
        },
        child: BlocBuilder<AlertCubit, AlertState>(
          builder: (context, state) {
            if (state is AlertSuccessful) {
              AlertEntity data = state.data;
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      data.title ?? '',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          data.details ?? '',
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: _isChecked,
                          onChanged: (val) {
                            setState(() {
                              _isChecked = val ?? false;
                            });
                          },
                        ),
                        const Expanded(
                          child: Text(
                            "أقـر بأنــى قرأت جميــع الـبنــود أعــلاه",
                            style: TextStyle(fontSize: 16, color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              _isChecked ? Colors.green : Colors.grey,
                        ),
                        onPressed: _isChecked
                            ? () {
                                BlocProvider.of<AddAlertCubit>(context)
                                    .addAlert(
                                        box.get(kEmployeeDataBox)!.userId!,
                                        data.id!);
                                // send acceptance or navigate to main app
                              }
                            : null,
                        child: Text(
                          "موافق",
                          style: TextStyle(
                              color: _isChecked ? Colors.white : Colors.black),
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else if (state is AlertFailed) {
              return const Text("fail data");
            } else if (state is AlertLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const Text("fail data");
          },
        ),
      ),
    );
  }
}
