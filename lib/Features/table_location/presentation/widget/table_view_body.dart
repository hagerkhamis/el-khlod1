import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/table/presentation/manager/cubit/pick_date_cubit.dart';
import 'package:elkhlod/Features/table_location/presentation/manager/cubit/location_table_cubit.dart';
import 'package:elkhlod/Features/table_location/presentation/widget/attendance_and_leaving_table.dart';

import '../../../../core/locale/app_localizations.dart';
import '../../../../core/utils/commons.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/gaps.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../auth/login/domain/entities/employee_entity.dart';
import '../../../vacation/presentation/widgets/custom_date_picker.dart';
import '../../domain/entities/new_table_entity.dart';

class TableViewBody extends StatefulWidget {
  const TableViewBody({super.key});

  @override
  State<TableViewBody> createState() => _TableViewBodyState();
}

class _TableViewBodyState extends State<TableViewBody> {
  int current = 0;
  Box<LocationTableEntity>? dataBox;
  late LocationTableEntity tableData;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PickDateCubit>(context).to = null;
    BlocProvider.of<PickDateCubit>(context).from = null;

    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;

    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Gaps.vGap20,

        BlocListener<PickDateCubit, RequestPickDateState>(
          listener: (context, state) {
            if (state is PickDateToSuccess) {}
          },
          child: BlocBuilder<PickDateCubit, RequestPickDateState>(
              builder: (context, state) {
            var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);

            return Column(
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: CustomDatePicker(
                            onTap: () {
                              BlocProvider.of<PickDateCubit>(context)
                                  .pickDate(context, "from");
                            },
                            containerWidth:
                                MediaQuery.of(context).size.width / 1.2,
                            customDatePickerText: BlocProvider.of<
                                            PickDateCubit>(context)
                                        .from !=
                                    null
                                ? "${locale.translate("from_date")!}  ${BlocProvider.of<PickDateCubit>(context).from!}"
                                : locale.translate("from_date")!),
                      ),
                      CustomDatePicker(
                          onTap: () async {
                            if (BlocProvider.of<PickDateCubit>(context).from ==
                                null) {
                              Commons.showToast(context,
                                  message: "يجب اختيار تاريخ البداية اولا ");
                            } else {
                              await BlocProvider.of<PickDateCubit>(context)
                                  .pickDate(context, "to");
                            }
                          },
                          containerWidth:
                              MediaQuery.of(context).size.width / 1.2,
                          customDatePickerText: BlocProvider.of<PickDateCubit>(
                                          context)
                                      .to !=
                                  null
                              ? "${locale.translate("to_date")!}  ${BlocProvider.of<PickDateCubit>(context).to!}"
                              : locale.translate("to_date")!),
                    ]),
                BlocBuilder<PickDateCubit, RequestPickDateState>(
                  builder: (context, state) {
                    return BlocBuilder<LocationTableCubit, LocationTableState>(
                      builder: (context, state) {
                        return state is FetchLoading
                            ? CircularProgressIndicator(
                                color: kPrimaryColor,
                              )
                            : CustomButton(
                                onTapAvailable: false,
                                screenWidth:
                                    MediaQuery.of(context).size.width / 1.7,
                                buttonTapHandler: () {
                                  if (BlocProvider.of<PickDateCubit>(context)
                                              .to !=
                                          null &&
                                      BlocProvider.of<PickDateCubit>(context)
                                              .from !=
                                          null) {
                                    if (BlocProvider.of<PickDateCubit>(context)
                                                .valueFrom !=
                                            null &&
                                        BlocProvider.of<PickDateCubit>(context)
                                                .valueTo !=
                                            null) {
                                      if (BlocProvider.of<PickDateCubit>(
                                              context)
                                          .valueTo!
                                          .isBefore(
                                              BlocProvider.of<PickDateCubit>(
                                                      context)
                                                  .valueFrom!)) {
                                        Commons.showToast(context,
                                            message:
                                                "يجب اختيار تاريخ بعد هذا");
                                      } else {
                                        BlocProvider.of<LocationTableCubit>(
                                                context)
                                            .getTableData(
                                                BlocProvider.of<PickDateCubit>(
                                                        context)
                                                    .from!,
                                                BlocProvider.of<PickDateCubit>(
                                                        context)
                                                    .to!,
                                                box
                                                    .get(kEmployeeDataBox)!
                                                    .employeeId!);
                                      }
                                    }
                                  } else {
                                    Commons.showToast(context,
                                        message: "يجب اختيار تاريخ اولا ");
                                  }
                                },
                                buttonText: locale.translate("search")!);
                      },
                    );
                  },
                ),
              ],
            );
          }),
        ),
        Gaps.vGap10,

        // CustomDatePicker(
        //     containerWidth: MediaQuery.of(context).size.width / 2.5,
        //     customDatePickerText: locale.translate('to_date')!),
        const AttendanceAndLeavingTable()
      ],
    ));
  }

  // SizedBox(
  //   height: 40,
  //   child: ListView.builder(
  //       padding: const EdgeInsets.all(5),
  //       physics: const BouncingScrollPhysics(),
  //       itemCount: months.length,
  //       scrollDirection: Axis.horizontal,
  //       itemBuilder: (ctx, index) {
  //         return GestureDetector(
  //           onTap: () {
  //             setState(() {
  //               current = index;

  //             });
  //           },
  //           child: Container(
  //             alignment: Alignment.center,
  //             margin: const EdgeInsets.symmetric(horizontal: 9),
  //             width: MediaQuery.of(context).size.width / 7,
  //             height: 40,
  //             decoration: BoxDecoration(
  //               boxShadow: const [
  //                 BoxShadow(
  //                     color: Colors.grey,
  //                     blurRadius: 2.0,
  //                     offset: Offset(-1, 2))
  //               ],
  //               borderRadius: current == index
  //                   ? BorderRadius.circular(20)
  //                   : BorderRadius.circular(20),
  //               color: current == index ? kPrimaryColor : Colors.white,
  //             ),
  //             child: Text(
  //               months[index],
  //               style: TextStyle(
  //                   fontSize: 10.sp,
  //                   color: current == index
  //                       ? Colors.white
  //                       : const Color(0xff989898)),
  //             ),
  //           ),
  //         );
  //       }),
  // ),
  // Gaps.vGap20,

  // const
}
