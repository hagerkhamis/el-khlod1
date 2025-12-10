import '../../../../core/locale/app_localizations.dart';
import '../../../../core/widgets/out_put_container.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_orders_raw_icon.dart';
import '../../../../core/widgets/custom_request_text_field.dart';
import 'package:flutter/material.dart';

class PaymentPermissionScreen extends StatelessWidget {
  const PaymentPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: MediaQuery.of(context).size * .07,
          child: const CustomAppBar()),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 27,
          right: 25,
        ),
        child: SizedBox(
          height: screenSize.height * .8,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Text(
                  locale.translate('payment_permission')!,
                  style: const TextStyle(fontSize: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutPutContainer(
                        containerIconPath: "assets/icons/hashtag_icon.png",
                        containerTitle: locale.translate('number_permission')!,
                        containerWidth: screenSize.width * .4,
                        containerText: "125"),
                    const Spacer(),
                    OutPutContainer(
                        containerIconPath: "assets/icons/calender_icon.png",
                        containerTitle: locale.translate('date_permission')!,
                        containerWidth: screenSize.width * .4,
                        containerText: "25/9/2023"),
                  ],
                ),
                CustomOrdersRawIcon(
                  rawText: locale.translate('the_amount')!,
                  iconImagePath: "assets/icons/money_icon.png",
                ),
                CustomRequestsTextField(
                    hintTextField: locale.translate('the_amount')!),
                CustomOrdersRawIcon(
                  rawText:
                      "${locale.translate('the_side')!}/${locale.translate('beneficiary')!}",
                  iconImagePath: "assets/icons/language_icon.png",
                ),
                CustomRequestsTextField(
                    hintTextField: locale.translate('to_whom_does_it_matter')!),
                CustomOrdersRawIcon(
                  rawText: locale.translate('phone')!,
                  iconImagePath: "assets/icons/phone_icon.png",
                ),
                CustomRequestsTextField(hintTextField: ""),
                CustomOrdersRawIcon(
                    rawText: locale.translate('is_about')!,
                    iconImagePath: "assets/icons/notes_icon.png"),
                CustomRequestsTextField(hintTextField: ""),
                CustomOrdersRawIcon(
                    rawText:
                        "${locale.translate('project')!}/${locale.translate('initiative')!}",
                    iconImagePath: "assets/icons/notes_icon.png"),
                CustomRequestsTextField(hintTextField: ""),
                Row(
                  children: [
                    CustomButton(
                        screenWidth: screenSize.width * .31,
                        buttonTapHandler: () {},
                        buttonText: locale.translate('confirm')!),
                    const Spacer(),
                    CustomButton(
                        buttonBackGroundColor: Colors.white,
                        screenWidth: screenSize.width * .31,
                        buttonTapHandler: () {},
                        buttonText: locale.translate('cancel')!)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
