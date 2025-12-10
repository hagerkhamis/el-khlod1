import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/auth/login/domain/entities/employee_entity.dart';
import 'package:elkhlod/Features/vacation/data/models/vacation.dart';
import 'package:elkhlod/Features/vacation/presentation/manager/delete_vacation_cubit/delete_vacation_cubit.dart';
import 'package:elkhlod/Features/vacation/presentation/manager/egraa_vacation_cubit/egraa_vaction_cubit.dart';
import 'package:elkhlod/Features/vacation/presentation/widgets/custom_row.dart';
import 'package:elkhlod/core/utils/commons.dart';
import 'package:elkhlod/core/utils/network/api/network_api.dart';
import 'package:elkhlod/core/widgets/custom_button.dart';
import 'package:elkhlod/core/widgets/custom_orders_raw_icon.dart';
import 'package:elkhlod/core/widgets/custom_request_text_field.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../core/locale/app_localizations.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/gaps.dart';
import '../../../../core/widgets/custom_simple_app_bar.dart';
import '../../../../core/widgets/divider_custom.dart';
import '../../../bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';

class OrderVacationDetailsScreen extends StatefulWidget {
  const OrderVacationDetailsScreen({super.key});

  @override
  State<OrderVacationDetailsScreen> createState() =>
      _OrderVacationDetailsScreenState();
}

class _OrderVacationDetailsScreenState
    extends State<OrderVacationDetailsScreen> {
  Vacation vacation = Vacation();

  late TextEditingController reasonController;
  late TextEditingController numDaysController;




@override
void initState() {
  super.initState();
  reasonController = TextEditingController();
  numDaysController = TextEditingController(text: vacation.numDays?.toString() ?? "1");
}


  @override
void dispose() {
  reasonController.dispose();
  numDaysController.dispose();
  super.dispose();
}


  @override
  Widget build(BuildContext context) {
    vacation = BlocProvider.of<BottomNavCubit>(context).details!;
    // final reasonController = TextEditingController();
    var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);

    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: screenSize * .07,
        child: CustomSimpleAppBar(
          appBarTitle: locale.translate('order_details')!,
          leadingWidget: vacation.editDelete == "yes"
              ? Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: BlocListener<EgraaVactionCubit, EgraaVactionState>(
                    listener: (context, state) {
                      if (state is EgraaSuccessful) {
                        BlocProvider.of<BottomNavCubit>(context)
                            .updateBottomNavIndex(kListVacationScreen);
                        BlocProvider.of<BottomNavCubit>(context)
                            .navigationQueue
                            .addLast(BlocProvider.of<BottomNavCubit>(context)
                                .bottomNavIndex);
                      }
                    },
                    child:
                        BlocListener<DeleteVacationCubit, DeleteVacationState>(
                      listener: (context, state) {
                        if (state is DeleteSuccessful) {
                          BlocProvider.of<BottomNavCubit>(context)
                              .updateBottomNavIndex(kListVacationScreen);
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
                              ..updateBottomNavIndex(kEditeVacationScreen)
                              ..getDetails(vacation);
                            BlocProvider.of<BottomNavCubit>(context)
                                .navigationQueue
                                .addLast(
                                    BlocProvider.of<BottomNavCubit>(context)
                                        .bottomNavIndex);
                            // showModalBottomSheet(
                            //   isScrollControlled: true,
                            //   shape: const RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.only(
                            //       topLeft: Radius.circular(50),
                            //       topRight: Radius.circular(50),
                            //     ),
                            //   ),
                            //   context: context,
                            //   builder: (context) {
                            //     return AnimatedPadding(
                            //         duration: const Duration(seconds: 1),
                            //         padding: EdgeInsets.only(
                            //           bottom: MediaQuery.of(context).viewInsets.bottom,
                            //         ),
                            //         child: const ShowModalBottomSheet());
                            //   },
                            // );
                          },
                        ),
                        const Spacer(),
                        BlocBuilder<DeleteVacationCubit, DeleteVacationState>(
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
                                      var box = Hive.box<EmployeeEntity>(
                                          kEmployeeDataBox);
                                      BlocProvider.of<DeleteVacationCubit>(
                                              context)
                                          .deleteVacation(
                                              vacation.agazaId!,
                                              box
                                                  .get(kEmployeeDataBox)!
                                                  .employeeId!);
                                    },
                                  );
                          },
                        )
                      ]),
                    ),
                  ),
                )
              : null,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomOrderItem(
                hasStatusIcon: false,
                imgScr: "assets/icons/hashtag_icon.png",
                titleText: locale.translate('num_request')!,
                subTitleText: vacation.agazaRkm!),
            const CustomDivider(),
            CustomOrderItem(
                hasStatusIcon: false,
                imgScr: "assets/icons/calender_icon.png",
                titleText: locale.translate('date_request')!,
                subTitleText: vacation.agazaDate!),
            const CustomDivider(),
            CustomOrderItem(
                hasStatusIcon: false,
                imgScr: "assets/icons/vacation_icon.png",
                titleText: locale.translate('vacation_type')!,
                subTitleText: vacation.no3AgazaName!),
            const CustomDivider(),
            CustomOrderItem(
                hasStatusIcon: false,
                imgScr: "assets/icons/hashtag_icon.png",
                titleText: locale.translate('num_days')!,
                subTitleText:
                    "${vacation.numDays} ${locale.translate('day')!}"),
            const CustomDivider(),
            CustomOrderItem(
                hasStatusIcon: false,
                imgScr: "assets/icons/calender_icon.png",
                titleText: locale.translate('The_start_date_of_the_leave')!,
                subTitleText: vacation.agazaFromDateM!),
            const CustomDivider(),
            CustomOrderItem(
                hasStatusIcon: false,
                imgScr: "assets/icons/calender_icon.png",
                titleText: locale.translate('the_end_date_of_the_leave')!,
                subTitleText: vacation.agazaToDateM!),
            const CustomDivider(),
            CustomOrderItem(
                hasStatusIcon: true,
                imgScr: "assets/icons/status_icon.png",
                titleText: locale.translate('status')!,
                subTitleText: vacation.haletTalab!),
            const CustomDivider(),
            CustomOrderItem(
                hasStatusIcon: false,
                imgScr: "assets/icons/vacation_icon.png",
                titleText: locale.translate('reason')!,
                subTitleText: vacation.reason!),
            vacation.fFile != "null"
                ? Builder(
                    builder: (_) {
                      final fileUrl = "${NewApi.mainAppUrl}${vacation.fFile!}";
                      final isPdf =
                          vacation.fFile!.toLowerCase().endsWith(".pdf");

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "الإطلاع علي الملف : ",
                            style:
                                TextStyle(color: kPrimaryColor, fontSize: 12),
                          ),
                          Gaps.vGap10,
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 500,
                              child: isPdf
                                  ? SfPdfViewer.network(
                                      fileUrl,
                                      canShowScrollStatus: false,
                                    )
                                  : Image.network(
                                      fileUrl,
                                      fit: BoxFit.contain,
                                      errorBuilder: (context, error,
                                              stackTrace) =>
                                          const Text('حدث خطأ في تحميل الصورة'),
                                    ),
                            ),
                          ),
                        ],
                      );
                    },
                  )
                : const SizedBox(),
            Gaps.vGap10,
            Gaps.vGap30,
            vacation.egrat != null
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
                    const CustomOrdersRawIcon(
                      rawText: 'عدد الأيام',
                      iconImagePath: "assets/icons/hashtag_icon.png", 
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * .1,
                        child: CustomRequestsTextField(
                            controller: numDaysController,
                            hintTextField: 'عدد الأيام',
                            textInputType: TextInputType.number,
  ),),
                    BlocBuilder<EgraaVactionCubit, EgraaVactionState>(
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
                                        screenWidth:
                                            MediaQuery.of(context).size.width *
                                                .4,
                                        buttonTapHandler: () {
                                          if (reasonController
                                              .text.isNotEmpty) {
                                            BlocProvider.of<EgraaVactionCubit>(
                                                    context)
                                                .egraavacation(
                                                    box
                                                        .get(kEmployeeDataBox)!
                                                        .employeeId!,
                                                    vacation.agazaId!,
                                                    "accept",
                                                    reasonController.text,
                                                    numDaysController.text,);
                                          } else {
                                            Commons.showToast(context,
                                                message: "يجب كتابه السبب");
                                          }
                                        },
                                        buttonBackGroundColor: Colors.green,
                                        buttonText:
                                            locale.translate('acceptance')!),
                                    CustomButton(
                                        screenWidth:
                                            MediaQuery.of(context).size.width *
                                                .4,
                                        buttonTapHandler: () {
                                          if (reasonController
                                              .text.isNotEmpty) {
                                            BlocProvider.of<EgraaVactionCubit>(
                                                    context)
                                                .egraavacation(
                                                    box
                                                        .get(kEmployeeDataBox)!
                                                        .employeeId!,
                                                    vacation.agazaId!,
                                                    "refuse",
                                                    reasonController.text,
                                                    numDaysController.text,);
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
    );
  }
}
