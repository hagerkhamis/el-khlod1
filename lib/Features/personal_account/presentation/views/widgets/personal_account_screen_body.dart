import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/personal_account/presentation/manager/cubit/get_profile_cubit.dart';
import 'package:elkhlod/core/widgets/custom_button.dart';
import 'package:elkhlod/core/widgets/custom_cached_network_image.dart';

import '../../../../../core/locale/app_localizations.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/media_query_sizes.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../auth/login/domain/entities/employee_entity.dart';
import '../../../../bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import 'custom_setting_row.dart';

class PersonalAccountScreenBody extends StatelessWidget {
  const PersonalAccountScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);

    //var boxLogOut = Hive.box<int>(kLogoutOptionDataBox);
    BlocProvider.of<GetProfileCubit>(context)
        .getProfile(box.get(kEmployeeDataBox)!.userId!);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 15),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .80,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, kUpdateProfileScreenRoute);
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width * .15,
                          height: MediaQuery.of(context).size.height * .07,
                          decoration: BoxDecoration(
                              color: kPrimaryColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12)),
                          child: CustomCashedNetworkImage(
                            imageUrl: box.get(kEmployeeDataBox) != null
                                ? box.get(kEmployeeDataBox)!.image!
                                : "",
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            locale.translate("welcome")!,
                            style: TextStyle(
                              color: const Color(0xff8b8989),
                              fontSize: 11.sp,
                            ),
                          ),
                          Text(
                            box.get(kEmployeeDataBox) != null
                                ? box.get(kEmployeeDataBox)!.employeeName!
                                : " ",
                            style: TextStyle(
                                color: const Color(0xff4e4d4d),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w900),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    // Container(
                    //   width: 43,
                    //   height: 43,
                    //   decoration: BoxDecoration(
                    //       color: kPrimaryColor.withOpacity(0.2),
                    //       borderRadius: BorderRadius.circular(12)),
                    //   child: IconButton(
                    //     onPressed: () {
                    //       BlocProvider.of<BottomNavCubit>(context)
                    //           .navigationQueue
                    //           .addLast(BlocProvider.of<BottomNavCubit>(context)
                    //               .bottomNavIndex);
                    //       BlocProvider.of<BottomNavCubit>(context)
                    //           .updateBottomNavIndex(kEditProfileScreen);
                    //     },
                    //     icon: Icon(
                    //       Icons.edit,
                    //       color: kSecondaryColor,
                    //       size: 22.sp,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.02,
              ),
              Text(
                locale.translate('setting')!,
                style: Styles.textStyle20.copyWith(
                  color: Colors.black,
                  fontSize: 16.sp,
                ),
              ),
              const SizedBox(height: 15),
              // CustomSettingRow(
              //     text: locale.translate('language')!,
              //     path: 'assets/icons/language_icon.png',
              //     function: () {
              //       Navigator.pushNamed(context, kLanguageScreenRoute);
              //     }),
              // CustomSettingRow(
              //     text: locale.translate('messages')!,
              //     path: 'assets/icons/message_icon.png',
              //     function: () {
              //       BlocProvider.of<BottomNavCubit>(context)
              //           .updateBottomNavIndex(1);
              //     }),
              // CustomSettingRow(
              //     text: locale.translate('attendance_and_leaving')!,
              //     path: 'assets/icons/calender_icon.png',
              //     function: () {
              //       BlocProvider.of<BottomNavCubit>(context)
              //           .updateBottomNavIndex(3);
              //     }),
              CustomSettingRow(
                  text: locale.translate('notifications')!,
                  path: 'assets/icons/notification_icon.png',
                  function: () {
                    BlocProvider.of<BottomNavCubit>(context)
                        .updateBottomNavIndex(kNotificationView);
                    BlocProvider.of<BottomNavCubit>(context)
                        .navigationQueue
                        .addLast(BlocProvider.of<BottomNavCubit>(context)
                            .bottomNavIndex);
                  }),

              CustomSettingRow(
                  text: "الملف الشخصي",
                  path: 'assets/icons/user_id_icon.png',
                  function: () {
                    BlocProvider.of<BottomNavCubit>(context)
                        .updateBottomNavIndex(kProfileScreen);
                    BlocProvider.of<BottomNavCubit>(context)
                        .navigationQueue
                        .addLast(BlocProvider.of<BottomNavCubit>(context)
                            .bottomNavIndex);
                  }),
              CustomSettingRow(
                  text: locale.translate('about_app')!,
                  path: 'assets/icons/list_icon.png',
                  function: () {
                    BlocProvider.of<BottomNavCubit>(context)
                        .updateBottomNavIndex(kAboutAppView);
                    BlocProvider.of<BottomNavCubit>(context)
                        .navigationQueue
                        .addLast(BlocProvider.of<BottomNavCubit>(context)
                            .bottomNavIndex);
                  }),

              BlocBuilder<GetProfileCubit, GetProfileState>(
                builder: (context, state) {
                  return state is GetProfileSuccessful &&
                          state.data.data.showZeyara == "yes"
                      ? CustomSettingRow(
                          text: "زيارات",
                          path: 'assets/icons/list_icon.png',
                          function: () {
                            BlocProvider.of<BottomNavCubit>(context)
                                .updateBottomNavIndex(kStatusVisitsScreen);
                            BlocProvider.of<BottomNavCubit>(context)
                                .navigationQueue
                                .addLast(
                                    BlocProvider.of<BottomNavCubit>(context)
                                        .bottomNavIndex);
                          })
                      : const SizedBox();
                },
              ),
              CustomSettingRow(
                  text: locale.translate('privacy_policy')!,
                  path: 'assets/icons/secure_icon.png',
                  function: () {
                    BlocProvider.of<BottomNavCubit>(context)
                        .updateBottomNavIndex(kPrivecyAndPolicyView);

                    BlocProvider.of<BottomNavCubit>(context)
                        .navigationQueue
                        .addLast(BlocProvider.of<BottomNavCubit>(context)
                            .bottomNavIndex);
                  }),
              // CustomSettingRow(
              //     text: locale.translate('contact_with_us')!,
              //     path: 'assets/icons/contact_us_icon.png',
              //     function: () {
              //       BlocProvider.of<BottomNavCubit>(context)
              //           .navigationQueue
              //           .addLast(BlocProvider.of<BottomNavCubit>(context)
              //               .bottomNavIndex);
              //       BlocProvider.of<BottomNavCubit>(context)
              //           .updateBottomNavIndex(kNewMessageView);
              //     }),
              CustomSettingRow(
                  text: locale.translate('change_password')!,
                  path: 'assets/icons/lock_icon.png',
                  function: () {
                    Navigator.pushNamed(context, kChangePasswordScreenRoute);
                  }),

              CustomSettingRow(
                  text: "تغيير الصورة الشخصية",
                  path: 'assets/icons/secure_icon.png',
                  function: () {
                    Navigator.pushNamed(context, kUpdateProfileScreenRoute);
                  }),

              CustomSettingRow(
                  text: "تغيير التوقيع",
                  path: 'assets/icons/secure_icon.png',
                  function: () {
                    Navigator.pushNamed(context, kUpdateSignatureScreenRoute);
                  }),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomCashedNetworkImage(
                    width: 100,
                    height: 100,
                    imageUrl: box.get(kEmployeeDataBox) != null
                        ? box.get(kEmployeeDataBox)!.empSignature!
                        : "",
                  ),
                ],
              ),
              // CustomSettingRow(
              //     text: locale.translate('delete_account')!,
              //     deleteAccountColor: 0xfff16056,
              //     path: 'assets/icons/delete_account_icon.png',
              //     function: () {
              //       Navigator.pushNamed(context, kBottomNavRoute, arguments: 0);
              //     }),

              BlocBuilder<GetProfileCubit, GetProfileState>(
                builder: (context, state) {
                  if (state is getProfileLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is GetProfileSuccessful) {
                    return state.data.logoutOption == 1
                        ? Center(
                            child: Padding(
                            padding: EdgeInsets.only(bottom: 12.h),
                            child: CustomButton(
                              onTapAvailable: true,
                              buttonText: locale.translate('logout')!,
                              buttonTapHandler: () {
                                var box =
                                    Hive.box<EmployeeEntity>(kEmployeeDataBox);
                                box.clear();
                                Navigator.pushReplacementNamed(
                                    context, kLoginScreenRoute);
                              },
                              screenWidth:
                                  MediaQuery.of(context).size.width * .7,
                            ),
                          ))
                        : const SizedBox();
                  }

                  return const SizedBox();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
