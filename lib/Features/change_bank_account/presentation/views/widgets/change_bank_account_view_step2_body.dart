import '../../../../../core/utils/constants.dart';
import '../../../../bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import '../../../../select_file/presentation/cubit/select_file_cubit.dart';
import '../../../../ezen/presentation/widgets/custom_drop_down_list.dart';
import '../../../../../core/utils/gaps.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_dot_stepper.dart';
import '../../../../../core/widgets/custom_elevated_container.dart';
import '../../../../../core/widgets/custom_orders_raw_icon.dart';
import '../../../../../core/widgets/custom_request_text_field.dart';
import '../../../../../core/widgets/out_put_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ChangeBankAccountViewStep2Body extends StatelessWidget {
  const ChangeBankAccountViewStep2Body({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
      child: Column(
        children: [
          Gaps.vGap15,
          const Text(
            "تغيير حساب بنكي ",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Gaps.vGap15,
          CustomDotStepper(
            isActive: true,
            firstText: "حساب حالي",
            secondText: "حساب جديدة",
          ),
          Column(
            children: [
              Gaps.vGap15,
              OutPutContainer(
                containerIconPath: "assets/icons/calender_icon.png",
                containerTitle: "التاريخ",
                containerWidth: screenSize.width,
                containerText: DateFormat.yMMMd().format(DateTime.now()),
              ),
              const CustomOrdersRawIcon(
                rawText: "اسم البنك الجديد",
                iconImagePath: "assets/icons/bank_name_icon.png",
              ),
              Gaps.vGap15,
              CustomDropDownList(hintText: "بنك "),
              Gaps.vGap15,
              OutPutContainer(
                  containerIconPath: "assets/icons/bank_code_icon.png",
                  containerTitle: "كود البنك الجديد",
                  containerWidth: screenSize.width,
                  containerText: "RHJI"),
              const CustomOrdersRawIcon(
                rawText: "رقم الحساب الجديد",
                iconImagePath: "assets/icons/hashtag_icon.png",
              ),
              CustomRequestsTextField(hintTextField: "رقم الحساب "),
              const CustomOrdersRawIcon(
                rawText: "صورة الحساب الجديد",
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
                  containerChild: SizedBox(
                    child: BlocProvider.of<SelectFileCubit>(context)
                                .fileName !=
                            null
                        ? Center(
                            child: Text(
                                BlocProvider.of<SelectFileCubit>(context)
                                    .fileName!),
                          )
                        : Center(
                            child:
                                BlocProvider.of<SelectFileCubit>(context)
                                                .selectedFile ==
                                            null &&
                                        BlocProvider.of<SelectFileCubit>(
                                                    context)
                                                .fileName ==
                                            null
                                    ? Image.asset(
                                        "assets/images/upload_cloud.png",
                                        alignment: Alignment.center,
                                        width: 50,
                                        height: 50,
                                        //  MediaQuery.of(context).size.width * 1
                                      )
                                    : Image.file(
                                        BlocProvider.of<SelectFileCubit>(
                                                context)
                                            .selectedFile!),
                          ),
                  ),
                ),
              ),
              Gaps.vGap12,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                      screenWidth: MediaQuery.of(context).size.width * .3,
                      buttonTapHandler: () {},
                      buttonText: "تأكيد"),
                  CustomButton(
                    buttonBackGroundColor: Colors.white,
                    screenWidth: MediaQuery.of(context).size.width * .3,
                    buttonTapHandler: () {
                      // BlocProvider.of<BottomNavCubit>(context)
                      //     .navigationQueue
                      //     .addLast(BlocProvider.of<BottomNavCubit>(context)
                      //         .bottomNavIndex);
                      BlocProvider.of<BottomNavCubit>(context)
                          .updateBottomNavIndex(kChangeBankAccountViewStep1);
                    },
                    buttonText: "إلغاء",
                    haveBorder: true,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
