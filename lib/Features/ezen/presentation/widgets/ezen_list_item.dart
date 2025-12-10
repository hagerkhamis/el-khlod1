import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elkhlod/Features/bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import 'package:elkhlod/Features/ezen/domain/entities/ezen_entity.dart';
import 'package:elkhlod/core/utils/hex_color.dart';

import '../../../../../core/locale/app_localizations.dart';
import '../../../../../core/utils/constants.dart';

class EzenListItem extends StatelessWidget {
  const EzenListItem({super.key, required this.status, required this.ezen});

  final String status;
  final EzenEntity ezen;

  @override
  Widget build(BuildContext context) {
    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 7, left: 10),
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<BottomNavCubit>(context)
            ..updateBottomNavIndex(kOrderDetailsScreen)
            ..getDetails(ezen);
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
                        "${locale.translate('order_number')!}  : ",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 12.sp),
                      ),
                      Text(
                        ezen.eznRkm!,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Text(
                    ezen.eznDate ?? "",
                    style:
                        TextStyle(fontWeight: FontWeight.w900, fontSize: 12.sp),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "${locale.translate('permission_type')!}  : ",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 12.sp),
                      ),
                      Text(
                        ezen.no3EznName!,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Container(
                    width: 100,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: ezen.haletTalab!.contains("تم الإعتماد")
                            ? HexColor("#a8ffb3")
                            : ezen.haletTalab!.contains("تم رفض الطلب")
                                ? HexColor("#ffb3be")
                                : Colors.amber.withOpacity(.5)),
                    child: Text(
                      ezen.haletTalab!,
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
