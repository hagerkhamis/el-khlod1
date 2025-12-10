import '../../../../core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTableDateColumnItem extends StatelessWidget {
  const CustomTableDateColumnItem(
      {super.key, required this.dayName, required this.dayNumber});

  final String dayName;
  final String dayNumber;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(dayNumber,
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 9.sp,
              )),
          Text(dayName,
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 9.sp,
              )),
        ],
      ),
    );
  }
}
