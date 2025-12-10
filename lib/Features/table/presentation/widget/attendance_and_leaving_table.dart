import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elkhlod/Features/table/data/models/table_model/table_hodoor.dart';
import 'package:elkhlod/core/widgets/empty_widget.dart';

import '../../../../core/locale/app_localizations.dart';
import '../../../../core/utils/constants.dart';
import '../manager/cubit/attendance_table_cubit.dart';
import 'custom_table_attendance_column.dart';
import 'custom_table_date_column_item.dart';
import 'custom_table_leaving_column.dart';
import 'table_column_cell.dart';

class AttendanceAndLeavingTable extends StatelessWidget {
  const AttendanceAndLeavingTable({super.key});
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable

    return BlocBuilder<AttendanceTableCubit, AttendanceTableState>(
      builder: (context, state) {
        if (state is FetchSuccessful) {
          TableList list = state.data;

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
            },
            children: rows(context, list),
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

  List<TableRow> rows(BuildContext context, TableList? list) {
    final rows = <TableRow>[];
    rows.add(
      TableRow(
        decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(.3),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        children: const [
          TableColumnCell(
            columnText: 'التاريخ',
          ),
          TableColumnCell(
            columnText: 'الحضور',
          ),
          TableColumnCell(
            columnText: 'الانصراف',
          ),
          // TableColumnCell(
          //   columnText: 'ساعات العمل',
          // ),
        ],
      ),
    );
    for (var rowData in list!) {
      //   List<String> date = rowData.date!.split("-"); /// to get last date (date.last!)

      rows.add(TableRow(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12))),
        children: [
          CustomTableDateColumnItem(
            dayNumber: rowData.basmaDate ?? "",
            dayName: rowData.dayName ?? "",
          ),
          CustomTableAttendanceColumn(
            timeText: rowData.hdoorTime ?? "لم يتم تسجيل الحضور",
            lateMin: rowData.lateMin,
          ),
          CustomTableLeavingColumn(
            timeText: rowData.ensrafTime ?? "لم يتم تسجيل الانصراف",
          ),
          // CustomTableWorkHourColumn(
          //     amountHours: rowData.minutes == 0 && rowData.hours == 0
          //         ? "--"
          //         : " ${rowData.hours!} ${locale.translate('hours')}  ${rowData.minutes!}  ${locale.translate('minutes')}"),
        ],
      ));
    }
    return rows;
  }
}
