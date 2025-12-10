import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/ehsaeyat_table/domain/entities/new_table_entity.dart';



import 'attendance_and_leaving_table.dart';

class TableViewBody extends StatefulWidget {
  const TableViewBody({super.key});

  @override
  State<TableViewBody> createState() => _TableViewBodyState();
}

class _TableViewBodyState extends State<TableViewBody> {
  int current = 0;
  Box<TableEntity>? dataBox;
  late TableEntity tableData;
  @override
   Widget build(BuildContext context) {
  //   late AppLocalizations locale;
  //   locale = AppLocalizations.of(context)!;

    return const SingleChildScrollView(child: AttendanceAndLeavingTable());
  }


}
