import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/locale/app_localizations.dart';
import '../../../../../../core/utils/commons.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/utils/functions/validation_mixin.dart';
import '../../../../../../core/utils/gaps.dart';
import '../../../../../../core/utils/media_query_sizes.dart';
import '../../../../../../core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/widgets/custom_login_text_field.dart';
import '../../manager/cubit/register_cubit.dart';

class RegisterViewForm extends StatefulWidget {
  const RegisterViewForm({super.key});

  @override
  State<RegisterViewForm> createState() => _RegisterViewFormState();
}

class _RegisterViewFormState extends State<RegisterViewForm>
    with ValidationMixin {
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
    // final nameController = TextEditingController();
    // final phoneController = TextEditingController();
    // final addressController = TextEditingController();
    // final emailController = TextEditingController();
    // final passwordController = TextEditingController();

    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    SizeConfig().init(context);

    return MultiBlocListener(
      listeners: [
        BlocListener<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSuccessful) {
              Navigator.pushNamed(context, kLoginScreenRoute);
              Commons.showToast(context, message: state.data.responseMessage);
            } else if (state is RegisterFailed) {
              Commons.showToast(context, message: state.failMessage);
            }
          },
        ),
      ],
      child: Column(
        children: [
          Text(
            locale.translate('create_account')!,
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: 17.sp,
                fontWeight: FontWeight.w700),
          ),
          Gaps.vGap10,
          Form(
            key: registerFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomLoginTextField(
                    validator: validateNameText,
                    controller: nameController,
                    imagePath: "assets/icons/person_icon.png",
                    textInputType: TextInputType.text,
                    obscureText: false,
                    stringInTextField: locale.translate('name')!),
                CustomLoginTextField(
                    validator: validatePhoneNumber,
                    controller: phoneController,
                    imagePath: "assets/icons/mobile_icon.png",
                    textInputType: TextInputType.number,
                    obscureText: false,
                    stringInTextField: locale.translate('phone')!),
                CustomLoginTextField(
                    validator: validateAddress,
                    controller: addressController,
                    imagePath: "assets/icons/identity_icon.png",
                    textInputType: TextInputType.text,
                    obscureText: false,
                    stringInTextField: locale.translate('address')!),
                CustomLoginTextField(
                    validator: validateEmail,
                    controller: emailController,
                    imagePath: "assets/icons/message_icon.png",
                    textInputType: TextInputType.emailAddress,
                    obscureText: false,
                    stringInTextField: locale.translate('email')!),
                CustomLoginTextField(
                    validator: validatePassWord,
                    controller: passwordController,
                    imagePath: "assets/icons/lock_icon.png",
                    textInputType: TextInputType.text,
                    obscureText: true,
                    stringInTextField: locale.translate('password')!),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 30.0),
                //   child: Text(
                //     locale.translate('the_kind')!,
                //     style: Styles.textStyle20.copyWith(
                //         fontWeight: FontWeight.w700,
                //         fontSize: 15,
                //         color: kTextColor),
                //   ),
                // ),
                //const GenderSelection(),
              ],
            ),
          ),
          Gaps.vGap10,
          BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) {
              return state is RegisterLoading
                  ? CircularProgressIndicator(
                      color: kPrimaryColor,
                    )
                  : CustomButton(
                      onTapAvailable: true,
                      buttonText: locale.translate('create_account')!,
                      buttonTapHandler: () {
                        if (registerFormKey.currentState!.validate()) {
                          BlocProvider.of<RegisterCubit>(context).registerUser(
                            nameController.text,
                            emailController.text,
                            addressController.text,
                            phoneController.text,
                            passwordController.text,
                          );
                        }
                        if (state is RegisterSuccessful) {
                          Commons.showToast(
                            context,
                            message: state.data.responseMessage,
                          );
                        }
                      },
                      screenWidth: 190.0,
                    );
            },
          ),
          Gaps.vGap20,
        ],
      ),
    );
  }
}
