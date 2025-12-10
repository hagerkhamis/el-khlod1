import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/constants.dart';

class TableColumnCell extends StatelessWidget {
  const TableColumnCell({super.key, required this.columnText});
  final String columnText;
  @override
  Widget build(BuildContext context) {
    return TableCell(

        // verticalAlignment:TableCellVerticalAlignment.baseline ,
        child: Container(
      width: 50,
      height: 50,
      padding: const EdgeInsets.only(top: 10),
      child: Text(columnText,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 11.sp,
          )),
    ));
  }
}
