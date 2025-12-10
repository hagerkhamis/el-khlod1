import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elkhlod/Features/rates/data/models/types_rate_model.dart';
import 'package:elkhlod/core/utils/constants.dart';
import 'package:elkhlod/core/utils/hex_color.dart';

import '../../../bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';

class TypesRateListItem extends StatelessWidget {
  const TypesRateListItem({
    super.key,
    required this.typeList,
    required this.itemIndex,
    required this.image,
  });
  final AllTypesRateList typeList;
  final int itemIndex;
  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<BottomNavCubit>(context)
          ..updateBottomNavIndex(kAllEmpTaqeemScreen)
          ..getDetails(typeList![itemIndex].id);
        BlocProvider.of<BottomNavCubit>(context)
            .navigationQueue
            .addLast(BlocProvider.of<BottomNavCubit>(context).bottomNavIndex);
      },
      child: FadeInLeft(
        child: Container(
          margin: const EdgeInsets.all(20),
          width: 150,
          height: 150,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                width: 70,
                height: 70,
              ),
              Text(
                typeList![itemIndex].title.toString(),
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
