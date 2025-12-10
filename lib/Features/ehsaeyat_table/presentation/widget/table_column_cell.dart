import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:elkhlod/core/utils/gaps.dart';

import '../../../../core/utils/constants.dart';

class TableColumnCell extends StatelessWidget {
  const TableColumnCell({super.key, required this.columnText});
  final String columnText;
  @override
  Widget build(BuildContext context) {
    return TableCell(

        // verticalAlignment:TableCellVerticalAlignment.baseline ,
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        columnText.contains("0") && columnText.length == 1
            ? SpinKitRotatingCircle(
                size: 10,
                itemBuilder: (context, index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index.isEven ? Colors.red : Colors.teal),
                  );
                },
              )
            : const SizedBox(
                width: 0,
              ),
        Gaps.hGap10,
        Container(
          //padding: const EdgeInsets.only(top: 10),
          padding: columnText.isNum
              ? const EdgeInsets.symmetric(horizontal: 10, vertical: 10)
              : const EdgeInsets.only(
                  top: 10,
                ),
          decoration: BoxDecoration(
            color: columnText.isNum
                ? columnText.contains("0") && columnText.length == 1
                    ? Colors.red.withOpacity(.5)
                    : Colors.green.withOpacity(.5)
                : null,
            borderRadius: BorderRadius.circular(12),
          ),
          child: SizedBox(
            child: Text(columnText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 3.5.sp,
                  overflow: TextOverflow.ellipsis,
                )),
          ),
        ),
      ],
    ));
  }
}
