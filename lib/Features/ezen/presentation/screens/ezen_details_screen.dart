import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/auth/login/domain/entities/employee_entity.dart';
import 'package:elkhlod/Features/ezen/data/models/ezen.dart';
import 'package:elkhlod/Features/ezen/presentation/manager/delete_ezen_cubit/delete_ezen_cubit.dart';
import 'package:elkhlod/Features/ezen/presentation/manager/egraa_ezen_cubit/egraa_ezen_cubit.dart';
import 'package:elkhlod/Features/ezen/presentation/widgets/custom_ezen_row.dart';
import 'package:elkhlod/core/widgets/divider_custom.dart';
import 'package:elkhlod/core/utils/commons.dart';
import 'package:elkhlod/core/utils/gaps.dart';
import 'package:elkhlod/core/widgets/custom_button.dart';

import '../../../../core/locale/app_localizations.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/custom_orders_raw_icon.dart';
import '../../../../core/widgets/custom_request_text_field.dart';
import '../../../../core/widgets/custom_simple_app_bar.dart';
import '../../../bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';

class EzenDetailsScreen extends StatefulWidget {
  const EzenDetailsScreen({super.key});

  @override
  State<EzenDetailsScreen> createState() => _EzenDetailsScreenState();
}

class _EzenDetailsScreenState extends State<EzenDetailsScreen> {
  Ezen ezen = const Ezen();
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
    ezen = BlocProvider.of<BottomNavCubit>(context).details!;
    var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);
    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    final screenSize = MediaQuery.of(context).size;
    // final reasonController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: screenSize * .07,
        child: CustomSimpleAppBar(
          appBarTitle: locale.translate('order_details')!,
          leadingWidget: ezen.editDelete == "yes"
              ? Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: BlocListener<DeleteEzenCubit, DeleteEzenState>(
                    listener: (context, state) {
                      if (state is DeleteSuccessful) {
                        BlocProvider.of<BottomNavCubit>(context)
                            .updateBottomNavIndex(kListPermissionScreen);
                        BlocProvider.of<BottomNavCubit>(context)
                            .navigationQueue
                            .addLast(BlocProvider.of<BottomNavCubit>(context)
                                .bottomNavIndex);
                      }
                    },
                    child: Row(children: [
                      InkWell(
                        child: Image.asset(
                          "assets/icons/touch_icon.png",
                          color: kPrimaryColor,
                        ),
                        onTap: () {
                          BlocProvider.of<BottomNavCubit>(context)
                            ..updateBottomNavIndex(kEditePermissionScreen)
                            ..getDetails(ezen);
                          BlocProvider.of<BottomNavCubit>(context)
                              .navigationQueue
                              .addLast(BlocProvider.of<BottomNavCubit>(context)
                                  .bottomNavIndex);
                        },
                      ),
                      const Spacer(),

                      BlocBuilder<DeleteEzenCubit, DeleteEzenState>(
                        builder: (context, state) {
                          return state is DeleteLoading
                              ? const CircularProgressIndicator()
                              : InkWell(
                                  child: Icon(
                                    Icons.delete,
                                    color: kPrimaryColor,
                                  ),
                                  onTap: () {
                                    // BlocProvider.of<BottomNavCubit>(context)
                                    //     .navigationQueue
                                    //     .addLast(BlocProvider.of<BottomNavCubit>(context)
                                    //         .bottomNavIndex);
                                    BlocProvider.of<DeleteEzenCubit>(context)
                                        .deleteEzen(
                                            ezen.eznId!,
                                            box
                                                .get(kEmployeeDataBox)!
                                                .employeeId!);
                                  },
                                );
                        },
                      )
                      // InkWell(
                      //   child: Image.asset(
                      //     "assets/icons/follow_request_icon.png",
                      //     color: kPrimaryColor,
                      //   ),
                      //   onTap: () {
                      //     // BlocProvider.of<BottomNavCubit>(context)
                      //     //     .navigationQueue
                      //     //     .addLast(BlocProvider.of<BottomNavCubit>(context)
                      //     //         .bottomNavIndex);
                      //     BlocProvider.of<BottomNavCubit>(context)
                      //         .updateBottomNavIndex(kFollowingRequestsScreen);
                      //   },
                      // ),
                    ]),
                  ),
                )
              : null,
        ),
      ),
      body: SingleChildScrollView(
        child: BlocListener<EgraaEzenCubit, EgraaEzenState>(
          listener: (context, state) {
            if (state is EgraaSuccessful) {
              BlocProvider.of<BottomNavCubit>(context).navigationQueue.addLast(
                  BlocProvider.of<BottomNavCubit>(context).bottomNavIndex);
              BlocProvider.of<BottomNavCubit>(context)
                  .updateBottomNavIndex(kListPermissionScreen);
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              children: [
                CustomEzenItem(
                    hasStatusIcon: false,
                    imgScr: "assets/icons/hashtag_icon.png",
                    titleText: locale.translate('num_request')!,
                    subTitleText: ezen.eznRkm!),
                const CustomDivider(),
                CustomEzenItem(
                    hasStatusIcon: false,
                    imgScr: "assets/icons/calender_icon.png",
                    titleText: locale.translate('date_request')!,
                    subTitleText: ezen.eznDate!),
                const CustomDivider(),
                CustomEzenItem(
                    hasStatusIcon: false,
                    imgScr: "assets/icons/vacation_icon.png",
                    titleText: locale.translate('permission_type')!,
                    subTitleText: ezen.no3EznName!),
                const CustomDivider(),
                CustomEzenItem(
                    hasStatusIcon: false,
                    imgScr: "assets/icons/hashtag_icon.png",
                    titleText: locale.translate('num_hours')!,
                    subTitleText:
                        "${ezen.totalMin} ${locale.translate('minutes')!}"),
                const CustomDivider(),
                CustomEzenItem(
                    hasStatusIcon: false,
                    imgScr: "assets/icons/calender_icon.png",
                    titleText: locale.translate('from_hour')!,
                    subTitleText: ezen.fromHour!),
                const CustomDivider(),
                CustomEzenItem(
                    hasStatusIcon: false,
                    imgScr: "assets/icons/calender_icon.png",
                    titleText: locale.translate('to_hour')!,
                    subTitleText: ezen.toHour!),
                const CustomDivider(),
                CustomEzenItem(
                    hasStatusIcon: true,
                    imgScr: "assets/icons/status_icon.png",
                    titleText: locale.translate('status')!,
                    subTitleText: ezen.haletTalab!),
                const CustomDivider(),
                CustomEzenItem(
                    hasStatusIcon: false,
                    imgScr: "assets/icons/vacation_icon.png",
                    titleText: locale.translate('reason')!,
                    subTitleText: ezen.reason!),
                Gaps.vGap20,
                ezen.egrat != null
                    ? Column(children: [
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
                        BlocBuilder<EgraaEzenCubit, EgraaEzenState>(
                          builder: (context, state) {
                            return state is EgraaLoading
                                ? const CircularProgressIndicator()
                                : Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomButton(
                                            screenWidth: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .4,
                                            buttonTapHandler: () {
                                              if (reasonController
                                                  .text.isNotEmpty) {
                                                BlocProvider.of<EgraaEzenCubit>(
                                                        context)
                                                    .egraaEzen(
                                                        box
                                                            .get(
                                                                kEmployeeDataBox)!
                                                            .employeeId!,
                                                        ezen.eznId!,
                                                        "accept",
                                                        reasonController.text);
                                              } else {
                                                Commons.showToast(context,
                                                    message: "يجب كتابه السبب");
                                              }
                                            },
                                            buttonBackGroundColor: Colors.green,
                                            buttonText: locale
                                                .translate('acceptance')!),
                                        CustomButton(
                                            screenWidth: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .4,
                                            buttonTapHandler: () {
                                              if (reasonController
                                                  .text.isNotEmpty) {
                                                BlocProvider.of<EgraaEzenCubit>(
                                                        context)
                                                    .egraaEzen(
                                                        box
                                                            .get(
                                                                kEmployeeDataBox)!
                                                            .employeeId!,
                                                        ezen.eznId!,
                                                        "refuse",
                                                        reasonController.text);
                                              } else {
                                                Commons.showToast(context,
                                                    message: "يجب كتابه السبب");
                                              }
                                            },
                                            buttonBackGroundColor: Colors.red,
                                            buttonText:
                                                locale.translate('reject')!),
                                      ],
                                    ),
                                  );
                          },
                        )
                      ])
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
