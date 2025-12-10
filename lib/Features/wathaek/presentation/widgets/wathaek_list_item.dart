import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elkhlod/Features/bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import 'package:elkhlod/core/utils/gaps.dart';
import 'package:elkhlod/core/utils/hex_color.dart';

import '../../../../../core/utils/constants.dart';
import '../../domain/entities/wathaek_entity.dart';

class WathaekListItem extends StatelessWidget {
  const WathaekListItem(
      {super.key, required this.status, required this.wathaek});

  final String status;
  final WathaekEntity wathaek;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 7, left: 10),
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<BottomNavCubit>(context)
            ..updateBottomNavIndex(kWathaekDetailsScreen)
            ..getDetails(wathaek);
          BlocProvider.of<BottomNavCubit>(context)
              .navigationQueue
              .addLast(BlocProvider.of<BottomNavCubit>(context).bottomNavIndex);
         
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  color: kTextColor.withOpacity(0.4),
                  blurRadius: 3.0,
                  offset: const Offset(0.0, 0.8))
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        wathaek.title ?? "",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Gaps.vGap10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "التاريخ : ",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 12.sp),
                      ),
                      Text(
                        wathaek.sendDate ?? "",
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: wathaek.haletTalab!.contains("تم الإعتماد")
                                ? HexColor("#a8ffb3")
                                : wathaek.haletTalab!.contains("تم رفض الطلب")
                                    ? HexColor("#ffb3be")
                                    : Colors.amber.withOpacity(.5)),
                        child: Text(
                          wathaek.haletTalab!,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Gaps.vGap10,
            ],
          ),
        ),
      ),
    );
  }
}
