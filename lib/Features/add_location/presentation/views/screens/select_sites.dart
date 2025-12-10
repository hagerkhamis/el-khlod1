import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elkhlod/Features/add_location/presentation/views/widgets/custom_toggle_app_bar.dart';
import 'package:elkhlod/Features/add_location/presentation/views/widgets/hodor_drop_down_list.dart';
import 'package:elkhlod/Features/add_location/presentation/views/widgets/sites_drop_down_list.dart';
import 'package:elkhlod/Features/bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import 'package:elkhlod/core/utils/commons.dart';
import 'package:elkhlod/core/utils/constants.dart';
import 'package:elkhlod/core/utils/gaps.dart';
import 'package:elkhlod/core/widgets/custom_button.dart';
import 'package:elkhlod/core/widgets/custom_orders_raw_icon.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({super.key});

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  String typeSiteId = "";
  String typeHodorId = "";

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Column(children: [
      PreferredSize(
          preferredSize: screenSize * .07,
          child: CustomToggleAppBar(appBarTitle: "بصمة المواقع")),
      Gaps.vGap40,
      const CustomOrdersRawIcon(
          rawText: "الموقع", iconImagePath: "assets/icons/vacation_icon.png"),
      CustomDropDownList(
          onTap: (value) {
            //  debugPrint("value heeeere $value");
            typeSiteId = value;
          },
          hintText: "اختر الموقع"),
      Gaps.vGap40,
      const CustomOrdersRawIcon(
          rawText: "نوع البصمة",
          iconImagePath: "assets/icons/vacation_icon.png"),
      HodorCustomDropDownList(
          onTap: (value) {
            //  debugPrint("value heeeere $value");
            typeHodorId = value.toString();
          },
          hintText: "نوع البصمة"),
      Gaps.vGap40,
      Gaps.vGap40,
      CustomButton(
          textColor: Colors.white,
          onTapAvailable: true,
          buttonBackGroundColor: kPrimaryColor,
          screenWidth: MediaQuery.of(context).size.width * 0.7,
          buttonTapHandler: () {
            if (typeSiteId.isEmpty || typeHodorId.isEmpty) {
              Commons.showToast(context, message: "  يرجى اختيار الاول");
            } else {
              BlocProvider.of<BottomNavCubit>(context)
                ..updateBottomNavIndex(kStatusAddLocationScreen)
                ..getDetails([typeSiteId, typeHodorId]);
              BlocProvider.of<BottomNavCubit>(context).navigationQueue.addLast(
                  BlocProvider.of<BottomNavCubit>(context).bottomNavIndex);
            }
          },
          haveBorder: true,
          buttonText: "بصمة الوجه"),
    ]);
  }
}
