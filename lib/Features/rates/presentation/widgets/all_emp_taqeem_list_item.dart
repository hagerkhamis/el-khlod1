import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:elkhlod/Features/auth/login/domain/entities/employee_entity.dart';
import 'package:elkhlod/Features/bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import 'package:elkhlod/Features/rates/presentation/widgets/arguments.dart';
import 'package:elkhlod/core/utils/constants.dart';
import 'package:elkhlod/core/utils/gaps.dart';
import 'package:elkhlod/core/utils/hex_color.dart';
import 'package:elkhlod/core/widgets/custom_cached_network_image.dart';

class AllEmpTaqeemItem extends StatelessWidget {
  const AllEmpTaqeemItem({
    super.key,
    required this.employee,
    required this.itemIndex,
    required this.typeId,
  });
  final EmployeeEntity employee;
  final int itemIndex;
  final String typeId;
  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Stack(
          children: [
            Container(
              height: 120,
              margin: const EdgeInsets.only(right: 15),
              padding: const EdgeInsets.only(
                  right: 70, top: 10, bottom: 5, left: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: HexColor("F6F6F6"),
                  border: Border.all(color: HexColor("C1C1C1")),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0x29000000),
                        offset: Offset(0, 3),
                        blurRadius: 6,
                        spreadRadius: 0)
                  ]),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    employee.employeeName!,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 15),
                  ),
                  Gaps.vGap10,
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/rate.svg"),
                      Gaps.hGap5,
                      Text(
                        "(${employee.percent!}) آخر تقييم",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                  Gaps.vGap10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<BottomNavCubit>(context)
                            ..updateBottomNavIndex(kBnodTaqeemView)
                            ..getDetails(
                                ArgumentIds(typeId, id: employee.employeeId))
                            ..getForIdEmployee(employee.employeeId!);
                          BlocProvider.of<BottomNavCubit>(context)
                              .navigationQueue
                              .addLast(BlocProvider.of<BottomNavCubit>(context)
                                  .bottomNavIndex);
                        },
                        child: Container(
                          padding: const EdgeInsets.only(right: 5),
                          height: 30,
                          width: 110.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(color: kPrimaryColor),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0x29000000),
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                    spreadRadius: 0)
                              ]),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/frame.svg",
                                color: kPrimaryColor,
                              ),
                              Gaps.hGap10,
                              Text(
                                "أضف تقييم",
                                style: TextStyle(
                                    color: kPrimaryColor, fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<BottomNavCubit>(context)
                            ..updateBottomNavIndex(kLastTaqeemScreen)
                            ..getDetails(employee);
                          BlocProvider.of<BottomNavCubit>(context)
                              .navigationQueue
                              .addLast(BlocProvider.of<BottomNavCubit>(context)
                                  .bottomNavIndex);
                        },
                        child: Container(
                          // padding: const EdgeInsets.symmetric(horizontal: 5),
                          height: 30,
                          width: 110.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: kPrimaryColor,
                              border: Border.all(color: kPrimaryColor),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0x29000000),
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                    spreadRadius: 0)
                              ]),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/star.svg",
                                color: Colors.white,
                              ),
                              Gaps.hGap5,
                              const Text(
                                "التقييمات السابقة",
                                style:
                                    TextStyle(color: Colors.white, fontSize: 9),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: CircleAvatar(
                radius: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    40,
                  ),
                  child: CustomCashedNetworkImage(
                    imageUrl: employee.image!,
                    height: 75,
                    width: 75,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
