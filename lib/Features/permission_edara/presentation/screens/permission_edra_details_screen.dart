import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/permission_edara/domain/entities/talabat_list_entity.dart';
import 'package:elkhlod/Features/permission_edara/presentation/manager/delete_ezen_cubit/delete_talabat_cubit.dart';
import 'package:elkhlod/Features/permission_edara/presentation/widgets/dowenload.dart';
import 'package:elkhlod/core/utils/commons.dart';
import 'package:elkhlod/core/utils/gaps.dart';
import 'package:elkhlod/core/widgets/custom_button.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../core/locale/app_localizations.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/functions/registration_alert.dart';
import '../../../../core/widgets/custom_simple_app_bar.dart';
import '../../../../core/widgets/divider_custom.dart';
import '../../../auth/login/domain/entities/employee_entity.dart';
import '../../../bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';

class PermissionEdraDetailsScreen extends StatefulWidget {
  const PermissionEdraDetailsScreen({super.key});

  @override
  State<PermissionEdraDetailsScreen> createState() =>
      _PermissionEdraDetailsScreenState();
}

class _PermissionEdraDetailsScreenState
    extends State<PermissionEdraDetailsScreen> {
  TalabatListEntity talab = const TalabatListEntity();

  @override
  Widget build(BuildContext context) {
    talab = BlocProvider.of<BottomNavCubit>(context).details!;
    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    final screenSize = MediaQuery.of(context).size;

    var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: screenSize * .07,
        child: CustomSimpleAppBar(
          appBarTitle: locale.translate('order_details')!,
        ),
      ),
      body: SingleChildScrollView(
        child: BlocListener<DeleteTalabatCubit, DeleteTalabatState>(
          listener: (context, state) {
            if (state is DeleteSuccessful) {
              Commons.showToast(context, message: state.message);

              BlocProvider.of<BottomNavCubit>(context)
                  .updateBottomNavIndex(kRequestPermissionEdaraScreen);
              BlocProvider.of<BottomNavCubit>(context).navigationQueue.addLast(
                  BlocProvider.of<BottomNavCubit>(context).bottomNavIndex);
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(talab.no3TalabName!,
                          style: const TextStyle(fontSize: 15)),
                      Column(
                        children: [
                          Text(talab.talabDateAr!,
                              style: const TextStyle(fontSize: 15)),
                          Text(talab.talabTime!,
                              style: const TextStyle(fontSize: 15)),
                        ],
                      ),
                    ],
                  ),
                ),
                const CustomDivider(),
                Gaps.vGap15,
                Row(
                  children: [
                    Text(talab.notes ?? "",
                        style: const TextStyle(fontSize: 15)),
                  ],
                ),
                Gaps.vGap15,
                Text(talab.radNote ?? "",
                    style: const TextStyle(fontSize: 15, color: Colors.green)),
                Gaps.vGap15,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      talab.radFile != null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "الإطلاع علي الملف : ",
                                  style: TextStyle(
                                      color: kPrimaryColor, fontSize: 12),
                                ),
                                Gaps.vGap10,
                                SizedBox(
                                  height: 400,
                                  child: SfPdfViewer.network(talab.radFile!),
                                ),
                              ],
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
                Gaps.vGap30,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //    DownloadWidget(),
                      // _progress != null
                      //     ? const CircularProgressIndicator()
                      //     : GestureDetector(
                      //         onTap: () async {
                      //           String fileName =
                      //               talab.radFile!.split('/').last;

                      //         },
                      //         child: Icon(
                      //           Icons.share,
                      //           color: kPrimaryColor,
                      //           size: 35,
                      //         ),
                      //       ),
                      DownloadWidget(
                          url: talab.radFile!,
                          fileName: talab.radFile!.split('/').last),

                      talab.editDelete == "yes"
                          ? CustomButton(
                              screenWidth:
                                  MediaQuery.of(context).size.width * .4,
                              buttonTapHandler: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext contextx) {
                                    return alertDelete(context, () {
                                      BlocProvider.of<DeleteTalabatCubit>(
                                              context)
                                          .deleteTalab(
                                        talab.id!,
                                        box.get(kEmployeeDataBox)!.employeeId!,
                                      );
                                      Navigator.pop(contextx);
                                    });
                                  },
                                );
                              },
                              buttonBackGroundColor: Colors.red,
                              buttonText: "إلغاء الطلب")
                          : const SizedBox(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
