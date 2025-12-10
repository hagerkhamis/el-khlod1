import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/custom_cached_network_image.dart';

class FollowingRequestCustomWidget extends StatefulWidget {
  const FollowingRequestCustomWidget({super.key});

  @override
  State<FollowingRequestCustomWidget> createState() =>
      _FollowingRequestCustomWidgetState();
}

class _FollowingRequestCustomWidgetState
    extends State<FollowingRequestCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Bounce(
                child: const CustomCashedNetworkImage(
                    imageUrl:
                        " https://sportsmatik.com/uploads/world-events/players/lionel-messi_1564492648.jpg,")),
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'أحمد محمد عبدالرحمن',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w900),
              ),
              Text(
                'تم قبول الطلب المقدم بخصوص الأجازة',
                style: TextStyle(
                  fontSize: 11.sp,
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
