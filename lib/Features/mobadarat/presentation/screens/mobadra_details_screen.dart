import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/mobadarat/domain/entities/mobadarat_entity.dart';
import 'package:elkhlod/Features/mobadarat/presentation/manager/delete_mobadarat_cubit/delete_mobadarat_cubit.dart';
import 'package:elkhlod/core/utils/commons.dart';
import 'package:elkhlod/core/utils/gaps.dart';
import 'package:elkhlod/core/utils/hex_color.dart';
import 'package:elkhlod/core/widgets/custom_button.dart';

import '../../../../core/locale/app_localizations.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/functions/registration_alert.dart';
import '../../../../core/widgets/custom_simple_app_bar.dart';
import '../../../../core/widgets/divider_custom.dart';
import '../../../auth/login/domain/entities/employee_entity.dart';
import '../../../bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';

class MobadraDetailsScreen extends StatefulWidget {
  const MobadraDetailsScreen({super.key});

  @override
  State<MobadraDetailsScreen> createState() => _MobadraDetailsScreenState();
}

class _MobadraDetailsScreenState extends State<MobadraDetailsScreen> {
  MobadaratEntity mobadarat = const MobadaratEntity();

  @override
  Widget build(BuildContext context) {
    mobadarat = BlocProvider.of<BottomNavCubit>(context).details!;
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
          appBarTitle: locale.translate('detatils_mobadara')!,
        ),
      ),
      body: SingleChildScrollView(
        child: BlocListener<DeleteMobadaratCubit, DeleteMobadaratState>(
          listener: (context, state) {
            if (state is DeleteMobadaratSuccessful) {
              Commons.showToast(context,
                  message: state.message, color: Colors.green);

              BlocProvider.of<BottomNavCubit>(context)
                  .updateBottomNavIndex(kStatusMobadarat);

              BlocProvider.of<BottomNavCubit>(context).navigationQueue.addLast(
                  BlocProvider.of<BottomNavCubit>(context).bottomNavIndex);
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
                            color: mobadarat.haletTalab!.contains("تم الإعتماد")
                                ? HexColor("#a8ffb3")
                                : mobadarat.haletTalab!.contains("تم رفض الطلب")
                                    ? HexColor("#ffb3be")
                                    : Colors.amber.withOpacity(.5)),
                        child: Text(
                          mobadarat.haletTalab!,
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
                mobadarat.radNotes == null || mobadarat.radNotes!.isEmpty
                    ? const SizedBox()
                    : Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: HexColor("#a8ffb3"),
                        ),
                        child: Text(
                          mobadarat.radNotes ?? "",
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                Gaps.vGap50,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      mobadarat.editDelete == "yes"
                          ? CustomButton(
                              screenWidth:
                                  MediaQuery.of(context).size.width * .4,
                              buttonTapHandler: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext contextx) {
                                    return alertDelete(context, () {
                                      BlocProvider.of<DeleteMobadaratCubit>(
                                              context)
                                          .deleteMobadarat(
                                        mobadarat.id!,
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
