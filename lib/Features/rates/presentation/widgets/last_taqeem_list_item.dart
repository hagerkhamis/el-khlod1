import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/auth/login/domain/entities/employee_entity.dart';
import 'package:elkhlod/Features/rates/data/models/last_taqeem_model.dart';
import 'package:elkhlod/Features/rates/domain/entities/last_taqeem_entity.dart';
import 'package:elkhlod/Features/rates/presentation/cubit/delete_taqeem_cubit/delete_taqeem_cubit.dart';
import 'package:elkhlod/Features/rates/presentation/cubit/last_taqeem_cubit/last_taqeem_cubit.dart';
import 'package:elkhlod/core/utils/constants.dart';
import 'package:elkhlod/core/utils/gaps.dart';
import 'package:elkhlod/core/utils/hex_color.dart';
import 'package:elkhlod/core/widgets/custom_button.dart';

import '../../../bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';

class LastTaqeemListItem extends StatefulWidget {
  const LastTaqeemListItem({
    super.key,
    required this.ta3amemList,
    required this.itemIndex,
  });
  final LastTaqeemList ta3amemList;
  final int itemIndex;

  @override
  State<LastTaqeemListItem> createState() => _LastTaqeemListItemState();
}

class _LastTaqeemListItemState extends State<LastTaqeemListItem> {
  @override
  Widget build(BuildContext context) {
    var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);
    List<TableRow> rows(LastTaqeemEntity lastTaqeemEntity, BuildContext context,
        List<TaqeemDetailsEntity> taqeemDetails) {
      final rows = <TableRow>[];
      rows.add(TableRow(children: [
        BlocListener<DeleteTaqeemCubit, DeleteTaqeemState>(
          listener: (context, state) {
            if (state is DeleteTaqeemSuccessful) {
              BlocProvider.of<LastTaqeemCubit>(context).getLastTaqeemList(
                  box.get(kEmployeeDataBox)!.employeeId!,
                  widget.ta3amemList![widget.itemIndex].id!);
            }
          },
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  "بند التقييم",
                  presetFontSizes: [15, 13, 11],
                  // style: theme.bodySmall,
                  //   textAlign: isRTL ? TextAlign.right : TextAlign.left,
                ),
                Text(
                  "النتيجة",
                )
              ],
            ),
          ),
        )
      ]));

      for (int i = 0; i < taqeemDetails.length; i++) {
        rows.add(TableRow(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(taqeemDetails[i].bandName ?? "",
                    style: const TextStyle(fontSize: 12)),
                Text(
                  "${taqeemDetails[i].maxDegree!} / ${taqeemDetails[i].degree!} ",
                )
              ],
            ),
          )
        ]));
      }

      rows.add(TableRow(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(
                "الإجمالي",
                presetFontSizes: const [15, 13, 11],
                style: TextStyle(color: Colors.red[900]),
              ),
              Text(
                "(${lastTaqeemEntity.percent!})  ${lastTaqeemEntity.total!} ",
                style: TextStyle(color: Colors.red[900]),
              )
            ],
          ),
        )
      ]));

      return rows;
    }

    return GestureDetector(
      onTap: () {
        BlocProvider.of<BottomNavCubit>(context)
            .updateBottomNavIndex(kAllEmpTaqeemScreen);
        BlocProvider.of<BottomNavCubit>(context)
            .navigationQueue
            .addLast(BlocProvider.of<BottomNavCubit>(context).bottomNavIndex);
      },
      child: FadeInLeft(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 10),
          margin: const EdgeInsets.all(10),
          // width: 70,
          // height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: HexColor("F6F6F6"),
              border: Border.all(color: HexColor("C1C1C1")),
              boxShadow: const [
                BoxShadow(
                    color: Color(0x29000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                    spreadRadius: 0)
              ]),
          alignment: Alignment.center,
          child: ExpansionTile(
            tilePadding: const EdgeInsets.all(0),
            childrenPadding: const EdgeInsets.symmetric(vertical: 8),
            title: Row(
              children: [
                Image.asset("assets/icons/finger.png"),
                Gaps.hGap5,
                AutoSizeText(
                    "تقييم شهر  ${widget.ta3amemList![widget.itemIndex].forMonth!}",
                    presetFontSizes: const [14, 12, 10],
                    style: TextStyle(color: kPrimaryColor)),
              ],
            ),
            children: [
              Column(
                children: [
                  Table(
                    border: TableBorder.all(
                      width: 3,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    columnWidths: const {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(1),
                      2: FlexColumnWidth(1),
                      3: FlexColumnWidth(1),
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.top,
                    children: rows(
                        widget.ta3amemList![widget.itemIndex],
                        context,
                        widget.ta3amemList![widget.itemIndex].taqeemDetails ??
                            []),
                  ),
                  Gaps.vGap15,
                  widget.ta3amemList![widget.itemIndex].haveEgraa == "yes"
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BlocBuilder<DeleteTaqeemCubit, DeleteTaqeemState>(
                              builder: (context, state) {
                                return (state is DeleteTaqeemLoading)
                                    ? const Center(
                                        child: CircularProgressIndicator())
                                    : CustomButton(
                                        onTapAvailable: true,
                                        buttonText: "حذف",
                                        buttonTapHandler: () async {
                                          BlocProvider.of<DeleteTaqeemCubit>(
                                                  context)
                                              .deleteTaqeem(widget
                                                  .ta3amemList![
                                                      widget.itemIndex]
                                                  .taqeemId!);
                                        },
                                        screenWidth:
                                            MediaQuery.of(context).size.width *
                                                .30,
                                      );
                              },
                            ),
                            CustomButton(
                              onTapAvailable: true,
                              buttonText: "تعديل",
                              buttonTapHandler: () async {
                                BlocProvider.of<BottomNavCubit>(context)
                                  ..updateBottomNavIndex(kEditTaqeemScreen)
                                  ..getDetails(
                                      widget.ta3amemList![widget.itemIndex]);
                                BlocProvider.of<BottomNavCubit>(context)
                                    .navigationQueue
                                    .addLast(
                                        BlocProvider.of<BottomNavCubit>(context)
                                            .bottomNavIndex);
                              },
                              screenWidth:
                                  MediaQuery.of(context).size.width * .30,
                            )
                          ],
                        )
                      : const SizedBox()
                ],
              )
              // Container(
              //   //width: screenWidth,
              //   constraints: const BoxConstraints(maxHeight: 250),
              //   child: ListView.builder(
              //       physics: const BouncingScrollPhysics(),
              //       itemCount: widget
              //           .ta3amemList![widget.itemIndex].taqeemDetails!.length,
              //       itemBuilder: (context, index) {
              //         return Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             AutoSizeText(
              //               widget.ta3amemList![widget.itemIndex]
              //                   .taqeemDetails![index].bandName!,
              //               presetFontSizes: const [15, 13, 11],
              //               // style: theme.bodySmall,
              //               //   textAlign: isRTL ? TextAlign.right : TextAlign.left,
              //             ),
              //             Text(
              //               widget.ta3amemList![widget.itemIndex]
              //                   .taqeemDetails![index].degree!,
              //             )
              //           ],
              //         );
              //       }),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
