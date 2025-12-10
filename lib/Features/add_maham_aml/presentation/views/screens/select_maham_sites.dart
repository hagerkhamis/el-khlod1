import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:elkhlod/Features/bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import 'package:elkhlod/core/utils/commons.dart';
import 'package:elkhlod/core/utils/constants.dart';
import 'package:elkhlod/core/utils/gaps.dart';
import 'package:elkhlod/core/widgets/custom_button.dart';
import 'package:elkhlod/core/widgets/custom_orders_raw_icon.dart';

import '../../../../../core/widgets/custom_request_text_field.dart';
import '../widgets/custom_toggle_app_bar.dart';

class SelectMahamScreen extends StatefulWidget {
  const SelectMahamScreen({super.key});

  @override
  State<SelectMahamScreen> createState() => _SelectMahamScreenState();
}

class _SelectMahamScreenState extends State<SelectMahamScreen> {
  TextEditingController reasonController = TextEditingController();
  TextEditingController nameEmpController = TextEditingController();
  TextEditingController nameGehaController = TextEditingController();

  @override
  void dispose() {
    reasonController.dispose();
    nameEmpController.dispose();
    nameGehaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Column(children: [
      PreferredSize(
          preferredSize: screenSize * .07,
          child: CustomToggleAppBar(appBarTitle: "مامورية عمل ")),
      Gaps.vGap40,
      const CustomOrdersRawIcon(
        rawText: "اسم الموظف",
        iconImagePath: "assets/icons/notes_icon.png",
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * .08,
        width: MediaQuery.of(context).size.width * .8,
        child: CustomRequestsTextField(
            controller: nameEmpController, hintTextField: "اسم الموظف"),
      ),
      Gaps.vGap10,
      const CustomOrdersRawIcon(
        rawText: "جهة المامورية",
        iconImagePath: "assets/icons/notes_icon.png",
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * .08,
        width: MediaQuery.of(context).size.width * .8,
        child: CustomRequestsTextField(
          controller: nameGehaController,
          hintTextField: "جهة المهمة",
        ),
      ),
      Gaps.vGap5,
      const CustomOrdersRawIcon(
        rawText: "السبب",
        iconImagePath: "assets/icons/notes_icon.png",
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * .2,
        width: MediaQuery.of(context).size.width * .8,
        child: CustomRequestsTextField(
          controller: reasonController,
          hintTextField: "السبب",
        ),
      ),
      Gaps.vGap40,
      CustomButton(
          textColor: Colors.white,
          onTapAvailable: true,
          buttonBackGroundColor: kPrimaryColor,
          screenWidth: MediaQuery.of(context).size.width * 0.7,
          buttonTapHandler: () {
            if (nameEmpController.text.isEmpty ||
                nameGehaController.text.isEmpty ||
                reasonController.text.isEmpty) {
              Commons.showToast(context,
                  message: "  يرجى تعبئة جميع الحقول اولا");
            } else {
              BlocProvider.of<BottomNavCubit>(context)
                ..updateBottomNavIndex(kStatusAddMahamScreen)
                ..getDetails([
                  nameEmpController.text,
                  nameGehaController.text,
                  reasonController.text,
                ]);
              BlocProvider.of<BottomNavCubit>(context).navigationQueue.addLast(
                  BlocProvider.of<BottomNavCubit>(context).bottomNavIndex);
            }
          },
          haveBorder: true,
          buttonText: "اضافة مامورية "),
    ]);
  }
}
