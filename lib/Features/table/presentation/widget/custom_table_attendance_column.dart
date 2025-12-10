import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTableAttendanceColumn extends StatelessWidget {
  const CustomTableAttendanceColumn(
      {super.key, required this.timeText, required this.lateMin});
  final String timeText;
  final dynamic lateMin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          Text(
            "$timeText ",

            //     "$timeText ${locale.translate('am')!}",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12.sp,
            ),
          ),
          Text(
            lateMin != null ? "تأخير ($lateMin ) دقيقة" : "",

            //     "$timeText ${locale.translate('am')!}",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              fontSize: 10.sp,
            ),
          ),
        ],
      ),
    );
  }
}
