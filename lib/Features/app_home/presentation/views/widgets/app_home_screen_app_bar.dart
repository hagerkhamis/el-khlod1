import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/notification_view/presentation/manager/all_talabat_cubit/all_notification_cubit.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../auth/login/domain/entities/employee_entity.dart';
import '../../../../bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import 'notification_count.dart';

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);
    // box.isEmpty ? null : updateToken(context);
    //
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            width: 35,
          ),
          Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(40.0),
                  child: CustomCashedNetworkImage(
                    imageUrl: box.get(kEmployeeDataBox) != null
                        ? box.get(kEmployeeDataBox)!.image!
                        : "",
                  )),
              Text(
                box.get(kEmployeeDataBox) != null
                    ? box.get(kEmployeeDataBox)!.employeeName!
                    : "",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.normal,
                    fontSize: 12.sp),
              ),
            ],
          ),
          GestureDetector(
              onTap: () {
                // BlocProvider.of<BottomNavCubit>(context).navigationQueue.addLast(
                //     BlocProvider.of<BottomNavCubit>(context).bottomNavIndex);
                BlocProvider.of<BottomNavCubit>(context)
                    .updateBottomNavIndex(kNotificationView);
              },
              child: BlocProvider(
                create: (_) => getIt<AllNotificationCubit>()
                  ..getAllNotification(box.get(kEmployeeDataBox)!.employeeId!),
                child: BlocBuilder<AllNotificationCubit, AllNotificationState>(
                  builder: (context, state) {
                    if (state is FetchSuccessful) {
                      return NotificationIcon(count: state.data!.length);
                    }
                    return const NotificationIcon(count: 0);
                  },
                ),
              )),
        ],
      ),
    );
  }
}
