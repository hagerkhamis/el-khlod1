import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/core/utils/gaps.dart';

import '../../../../../../core/locale/app_localizations.dart';
import '../../../../../../core/utils/commons.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/utils/functions/validation_mixin.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_login_text_field.dart';
import '../../../domain/entities/employee_entity.dart';
import '../../manger/login_cubit.dart';

class LoginViewForm extends StatefulWidget {
  const LoginViewForm({super.key});

  @override
  State<LoginViewForm> createState() => _LoginViewFormState();
}

class _LoginViewFormState extends State<LoginViewForm> with ValidationMixin {
  late TextEditingController phoneController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final phoneController = TextEditingController();
    // final passwordController = TextEditingController();

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessful) {
          var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);
          box.put(kEmployeeDataBox, state.user.data);
          Navigator.pushReplacementNamed(context, kBottomNavRoute,
              arguments: 0);
          Commons.showToast(context, message: "تم التسجيل بنجاح");
        } else if (state is LoginFailed) {
          Commons.showToast(context, message: state.message);
        }
      },
      child: Column(
        children: [
          Text(
            locale.translate("login")!,
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: 17.sp,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 25,
          ),
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.only(right: 0.0, left: 0),
              child: Column(
                children: [
                  CustomLoginTextField(
                    key: const Key('phone'),
                    imagePath: "assets/icons/phone_icon.png",
                    controller: phoneController,
                    stringInTextField: "رقم الهاتف",
                    obscureText: false,
                    textInputType: TextInputType.number,
                    validator: validateUserPhone,
                  ),
                  CustomLoginTextField(
                    key: const Key('password'),
                    imagePath: "assets/icons/lock_icon.png",
                    controller: passwordController,
                    stringInTextField: locale.translate('password')!,
                    obscureText: true,
                    textInputType: TextInputType.text,
                    validator: validatePassWord,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return state is LoginLoading
                  ? CircularProgressIndicator(
                      color: kPrimaryColor,
                    )
                  : CustomButton(
                      onTapAvailable: true,
                      buttonText: locale.translate('login')!,
                      buttonTapHandler: () async {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<LoginCubit>(context).getUserData(
                              phoneController.text, passwordController.text);
                        }
                      },
                      screenWidth: MediaQuery.of(context).size.width * .50,
                    );
            },
          ),

          Gaps.vGap30
          // Padding(
          //   padding: const EdgeInsets.only(
          //     left: 20.0,
          //     // top: 20,
          //     bottom: 10,
          //     right: 20,
          //   ),
          //   child: Align(
          //     alignment: locale.isEnLocale
          //         ? Alignment.bottomLeft
          //         : Alignment.bottomRight,
          //     child: TextButton(
          //       child: Text(
          //         locale.translate('forgot_password')!,
          //         style: const TextStyle(
          //           fontSize: 12,
          //           color: kPrimaryColor,
          //           fontWeight: FontWeight.w700,
          //         ),
          //       ),
          //       onPressed: () {
          //         Navigator.pushNamed(context, kChangePasswordScreenRoute);
          //       },
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
