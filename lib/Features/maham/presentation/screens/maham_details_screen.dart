import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/maham/domain/entities/maham_entity.dart';
import 'package:elkhlod/core/utils/commons.dart';
import 'package:elkhlod/core/utils/gaps.dart';
import 'package:elkhlod/core/utils/hex_color.dart';
import 'package:elkhlod/core/widgets/custom_button.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/functions/registration_alert.dart';
import '../../../../core/widgets/custom_simple_app_bar.dart';
import '../../../../core/widgets/divider_custom.dart';
import '../../../auth/login/domain/entities/employee_entity.dart';
import '../../../bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import '../manager/delete_maham_cubit/delete_maham_cubit.dart';

class MahamDetailsScreen extends StatefulWidget {
  const MahamDetailsScreen({super.key});

  @override
  State<MahamDetailsScreen> createState() => _MahamDetailsScreenState();
}

class _MahamDetailsScreenState extends State<MahamDetailsScreen> {
  MahamEntity mobadarat = const MahamEntity();

  @override
  Widget build(BuildContext context) {
    mobadarat = BlocProvider.of<BottomNavCubit>(context).details!;

    final screenSize = MediaQuery.of(context).size;

    var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: screenSize * .07,
        child: CustomSimpleAppBar(
          appBarTitle: "تفاصيل المهمة",
        ),
      ),
      body: SingleChildScrollView(
        child: BlocListener<DeleteMahamCubit, DeleteMahamState>(
          listener: (context, state) {
            if (state is DeleteMahamSuccessful) {
              Commons.showToast(context,
                  message: state.message, color: Colors.green);

              BlocProvider.of<BottomNavCubit>(context)
                  .navigationQueue
                  .removeLast();

              BlocProvider.of<BottomNavCubit>(context).updateBottomNavIndex(
                  BlocProvider.of<BottomNavCubit>(context)
                      .navigationQueue
                      .last);
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              children: [
                Gaps.vGap20,
                Text(mobadarat.title ?? "",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 17,
                        fontWeight: FontWeight.bold)),
                Gaps.vGap20,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(mobadarat.sendDateAr ?? " ",
                              style: const TextStyle(fontSize: 15)),
                          Text(mobadarat.sendTime!,
                              style: const TextStyle(fontSize: 15)),
                        ],
                      ),
                      Container(
                        width: 100,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: mobadarat.haletTask!.contains("منتهي")
                                ? HexColor("#a8ffb3")
                                : mobadarat.haletTask!.contains("تم رفض الطلب")
                                    ? HexColor("#ffb3be")
                                    : Colors.amber.withOpacity(.5)),
                        child: Text(
                          mobadarat.haletTask!,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                const CustomDivider(),
                Gaps.vGap15,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(mobadarat.notes ?? "",
                      textAlign: TextAlign.justify,
                      style: const TextStyle(fontSize: 15, height: 2)),
                ),
                Gaps.vGap15,
                // mobadarat.radNotes == null
                //     ? const SizedBox()
                //     : Container(
                //         padding: const EdgeInsets.all(10),
                //         alignment: Alignment.center,
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(40),
                //           color: HexColor("#a8ffb3"),
                //         ),
                //         child: Text(
                //           mobadarat.radNotes ?? "",
                //           style: const TextStyle(
                //             fontSize: 15,
                //             color: Colors.black,
                //           ),
                //         ),
                //       ),
                Gaps.vGap50,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      mobadarat.editDelete == "yes"
                          ? BlocBuilder<DeleteMahamCubit, DeleteMahamState>(
                              builder: (context, state) {
                                return state is DeleteMobadaratLoading
                                    ? const CircularProgressIndicator()
                                    : CustomButton(
                                        screenWidth:
                                            MediaQuery.of(context).size.width *
                                                .4,
                                        buttonTapHandler: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext contextx) {
                                              return alertDelete(context, () {
                                                BlocProvider.of<
                                                            DeleteMahamCubit>(
                                                        context)
                                                    .deleteMaham(
                                                  mobadarat.id!,
                                                  box
                                                      .get(kEmployeeDataBox)!
                                                      .employeeId!,
                                                );
                                                Navigator.pop(contextx);
                                              });
                                            },
                                          );
                                        },
                                        buttonBackGroundColor: Colors.red,
                                        buttonText: "إلغاء ");
                              },
                            )
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
