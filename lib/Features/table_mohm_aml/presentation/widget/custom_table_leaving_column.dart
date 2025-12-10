import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTableLeavingColumn extends StatelessWidget {
  const CustomTableLeavingColumn({super.key, required this.timeText});
  final String timeText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Text("$timeText ",

          // "$timeText ${locale.translate('pm')!}",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12.sp,
            fontStyle: FontStyle.normal,
          )),
    );
  }
}
