import '../../../../../core/locale/app_localizations.dart';
import '../../../../../core/utils/gaps.dart';
import '../../../../../core/widgets/custom_dot_stepper.dart';
import '../../../../../core/widgets/out_put_container.dart';
import 'package:flutter/material.dart';

class ChangeBankAccountViewStep1Body extends StatelessWidget {
  const ChangeBankAccountViewStep1Body({
    super.key,
    required this.locale,
    required this.screenSize,
  });

  final AppLocalizations locale;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 50),
        child: Column(
          children: [
            Gaps.vGap15,
            Text(
              locale.translate('bank_account_change')!,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            Gaps.vGap15,
            CustomDotStepper(
              isActive: false,
              firstText: locale.translate('current_account')!,
              secondText: locale.translate('new_account')!,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Gaps.vGap30,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutPutContainer(
                        containerIconPath: "assets/icons/user_icon.png",
                        containerTitle: locale.translate('employee_name')!,
                        containerWidth: screenSize.width * .40,
                        containerText: "أحمد محمد عبدالرحمن"),
                    OutPutContainer(
                        containerIconPath: "assets/icons/user_id_icon.png",
                        containerTitle: locale.translate('employee_id')!,
                        containerWidth: screenSize.width * .40,
                        containerText: "10035"),
                  ],
                ),
                OutPutContainer(
                    containerIconPath: "assets/icons/subtitle_icon.png",
                    containerTitle: locale.translate('jop_title')!,
                    containerWidth: screenSize.width,
                    containerText: locale.translate('user_services_officer')!),
                OutPutContainer(
                    containerIconPath: "assets/icons/administration_icon.png",
                    containerTitle: locale.translate('management')!,
                    containerWidth: screenSize.width,
                    containerText: locale.translate(
                        'management_of_care_and_development_programs')!),
                OutPutContainer(
                    containerIconPath: "assets/icons/department_icon.png",
                    containerTitle: locale.translate('department')!,
                    containerWidth: screenSize.width,
                    containerText: locale.translate('Social_Care_Department')!),
                OutPutContainer(
                    containerIconPath: "assets/icons/bank_name_icon.png",
                    containerTitle:
                        locale.translate('the_name_of_the_current_bank')!,
                    containerWidth: screenSize.width,
                    containerText: locale.translate('Bank')!),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutPutContainer(
                        containerIconPath: "assets/icons/bank_code_icon.png",
                        containerTitle: locale.translate('current_bank_code')!,
                        containerWidth: screenSize.width * .40,
                        containerText: "RHJI"),
                    OutPutContainer(
                        containerIconPath: "assets/icons/hashtag_icon.png",
                        containerTitle:
                            locale.translate('current_bank_number')!,
                        containerWidth: screenSize.width * .40,
                        containerText: "RHJI"),
                  ],
                ),
                Gaps.vGap20,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
