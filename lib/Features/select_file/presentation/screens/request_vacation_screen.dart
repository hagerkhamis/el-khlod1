import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elkhlod/Features/select_file/presentation/cubit/select_file_cubit.dart';

import '../../../../core/locale/app_localizations.dart';
import '../../../../core/utils/gaps.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_elevated_container.dart';
import '../../../../core/widgets/custom_orders_raw_icon.dart';
import '../../../../core/widgets/custom_request_text_field.dart';
import '../../../ezen/presentation/widgets/custom_drop_down_list.dart';
import '../../../vacation/presentation/widgets/custom_date_picker.dart';

class RequestVacationScreen extends StatelessWidget {
  const RequestVacationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: screenSize * .1, child: const CustomAppBar()),
        backgroundColor: Colors.white,
        body: FadeInUp(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding:
                  const EdgeInsets.only(right: 20.0, left: 20.0, bottom: 30),
              child: Column(
                children: [
                  //  const CustomAppBar(),
                  Text(
                    locale.translate('order_vacation')!,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  CustomOrdersRawIcon(
                      rawText: locale.translate('vacation_type')!,
                      iconImagePath: "assets/icons/vacation_icon.png"),
                  CustomDropDownList(
                      hintText: locale.translate('vacation_type')!),
                  CustomOrdersRawIcon(
                      rawText: locale.translate('The_start_date_of_the_leave')!,
                      iconImagePath: "assets/icons/calender_icon.png"),
                  CustomDatePicker(
                      customDatePickerText: locale.translate('from_date')!),
                  CustomOrdersRawIcon(
                      rawText: locale.translate('the_end_date_of_the_leave')!,
                      iconImagePath: "assets/icons/calender_icon.png"),
                  CustomDatePicker(
                      customDatePickerText: locale.translate('to_date')!),
                  CustomOrdersRawIcon(
                    rawText: locale.translate('attachments')!,
                    iconImagePath: "assets/icons/attach_icon.png",
                  ),
                  GestureDetector(
                    onTap: () async {
                      await BlocProvider.of<SelectFileCubit>(context)
                          .pickFileFromDevice();
                    },
                    child: CustomElevatedContainer(
                      containerHeight: MediaQuery.of(context).size.height * .12,
                      containerWidth: MediaQuery.of(context).size.width,
                      containerChild:
                          BlocBuilder<SelectFileCubit, SelectFileState>(
                        builder: (context, state) {
                          if (state is PickFileState) {
                            return Center(
                              child: Text(state.fileName),
                            );
                          } else if (state is PickImageState) {
                            return Image.file(state.imagePath);
                          } else {
                            return Image.asset(
                              "assets/images/upload_cloud.png",
                              alignment: Alignment.center,
                              width: 50,
                              height: 50,
                              //  MediaQuery.of(context).size.width * 1
                            );
                          }
                        },
                      ),
                    ),
                  ),

                  CustomOrdersRawIcon(
                    rawText: locale.translate('notes')!,
                    iconImagePath: "assets/icons/notes_icon.png",
                  ),
                  CustomRequestsTextField(
                      containerHeight: MediaQuery.of(context).size.height * .1,
                      hintTextField: ""),
                  Gaps.vGap15,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                          screenWidth: MediaQuery.of(context).size.width * .3,
                          buttonTapHandler: () {},
                          buttonText: locale.translate('accept')!),
                      CustomButton(
                          buttonBackGroundColor: Colors.white,
                          screenWidth: MediaQuery.of(context).size.width * .3,
                          buttonTapHandler: () {},
                          buttonText: locale.translate('cancel')!)
                    ],
                  ),
                  // BottomNav()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
