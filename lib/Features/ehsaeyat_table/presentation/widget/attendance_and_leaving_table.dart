import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elkhlod/Features/ehsaeyat_table/data/models/table_data_model/ehsaeyat_table_data.dart';
import 'package:elkhlod/Features/ehsaeyat_table/data/models/table_header_model/ehsaeyat_table.dart';
import 'package:elkhlod/Features/ehsaeyat_table/presentation/manager/cubit_table_horizental/ehsaeyat_table_cubit.dart';
import 'package:elkhlod/Features/ehsaeyat_table/presentation/manager/cubit_table_vertical/ehsaeyat_table_data_cubit.dart';
import 'package:elkhlod/core/widgets/empty_widget.dart';

import '../../../../core/locale/app_localizations.dart';
import '../../../../core/utils/constants.dart';
import 'table_column_cell.dart';

class AttendanceAndLeavingTable extends StatelessWidget {
  const AttendanceAndLeavingTable({super.key});
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable

    return BlocBuilder<EhsaeyatTableCubit, EhsaeyatTableState>(
      builder: (context, state) {
        if (state is FetchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FetchSuccessful) {
          TableList list = state.data;

          return BlocBuilder<EhsaeyatTableDataCubit, EhsaeyatTableDataState>(
            builder: (context, state) {
              if (state is FetchDataVerticalLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is FetchDataVerticalSuccessful) {
                TableDataList listData = state.data;

                return Table(
                  border: TableBorder.all(
                      width: 2,
                      color: const Color(0xfff1f1f1),
                      borderRadius: BorderRadius.circular(16)),
                  columnWidths: const {
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(1),
                    2: FlexColumnWidth(1),
                    3: FlexColumnWidth(1),
                    4: FlexColumnWidth(1),
                    5: FlexColumnWidth(1),
                  },
                  children: rows(context, list, listData),
                );
              } else {
                return const SizedBox();
              }
            },
          );
        } else if (state is FetchFailed) {
          return EmptyWidget(
            text: state.message,
          );
        } else {
          return Text(AppLocalizations.of(context)!.translate("choose_date")!);
        }
      },
    );
  }

  List<TableRow> rows(
      BuildContext context, TableList? list, TableDataList? listData) {
    final rows = <TableRow>[];

//////////////////////
    List<Widget> listHorizontal = [];
    listHorizontal.add(
      const TableColumnCell(
        columnText: "",
      ),
    );

    for (var rowData in list!) {
      listHorizontal.add(
        TableColumnCell(
          columnText: rowData.name ?? "",
        ),
      );
    }
///////////////////////

///////////////////////
    rows.add(
      TableRow(
          decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(.3),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16))),
          children: listHorizontal),
    );

    // rows.add(
    //   TableRow(
    //     decoration: BoxDecoration(
    //         color: kPrimaryColor.withOpacity(.3),
    //         borderRadius: const BorderRadius.only(
    //             topLeft: Radius.circular(16), topRight: Radius.circular(16))),
    //     children: const [
    //       Text("data"),
    //       TableColumnCell(
    //         columnText: 'التاريخ',
    //       ),
    //       TableColumnCell(
    //         columnText: 'الحضور',
    //       ),
    //       TableColumnCell(
    //         columnText: 'الانصراف',
    //       ),
    //       // TableColumnCell(
    //       //   columnText: 'ساعات العمل',
    //       // ),
    //     ],
    //   ),
    // );
    // for (var rowData in list!) {
    //   //   List<String> date = rowData.date!.split("-"); /// to get last date (date.last!)

    for (var rowData in listData!) {
      List<Widget> dataRow = [];
      dataRow.add(
        TableColumnCell(
          columnText: rowData.name ?? "",
        ),
      );

      for (var x in rowData.x!) {
        dataRow.add(
          TableColumnCell(
            columnText: int.parse(x).toString(),
          ),
        );
      }

      rows.add(TableRow(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12))),
          children: dataRow));
    }

    return rows;
  }
}
