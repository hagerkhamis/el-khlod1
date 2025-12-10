import '../../../../core/locale/app_localizations.dart';
import '../../../../core/widgets/custom_request_text_field.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_orders_raw_icon.dart';
import '../../../../core/widgets/out_put_container.dart';
import '../../../ezen/presentation/widgets/custom_drop_down_list.dart';

class EmployeeProfileStep1 extends StatelessWidget {
  const EmployeeProfileStep1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Row(
          //   children: [
          //     const CustomOrdersRawIcon(
          //         rawText: "رقم الخطاب",
          //         iconImagePath: "assets/icons/hashtag_icon.png"),
          //     SizedBox(
          //       width: screenSize.width * .25,
          //     ),
          //     const CustomOrdersRawIcon(
          //         rawText: "التاريخ",
          //         iconImagePath: "assets/icons/calender_icon.png"),
          //   ],
          // ),
          Row(
            children: [
              OutPutContainer(
                  containerTitle: locale.translate('letter_number')!,
                  containerIconPath: "assets/icons/hashtag_icon.png",
                  containerWidth: screenSize.width * .35,
                  containerText: "125"),
              const Spacer(),
              OutPutContainer(
                  containerIconPath: "assets/icons/calender_icon.png",
                  containerTitle: locale.translate('date')!,
                  containerWidth: screenSize.width * .41,
                  containerText: "25/9/2023"),
            ],
          ),
          CustomOrdersRawIcon(
            rawText: locale.translate('surname')!,
            iconImagePath: "assets/icons/subtitle_icon.png",
          ),
          CustomDropDownList(hintText: locale.translate('esquire')!),
          CustomOrdersRawIcon(rawText: locale.translate('the_side')!),
          CustomRequestsTextField(
              hintTextField: locale.translate('to_whom_does_it_matter')!),
          Row(
            children: [
              CustomOrdersRawIcon(
                  rawText: locale.translate('the_end_of_the_surname')!,
                  iconImagePath: "assets/icons/subtitle_icon.png"),
              SizedBox(
                width: screenSize.width * .25,
              ),
              CustomOrdersRawIcon(
                  rawText: locale.translate('templates')!,
                  iconImagePath: "assets/icons/diamond_icon.png"),
            ],
          ),
          Row(
            children: [
              CustomDropDownList(
                hintText: locale.translate('god_delivered')!,
                width: screenSize.width * .41,
              ),
              const Spacer(),
              CustomDropDownList(
                hintText: locale.translate('choose')!,
                width: screenSize.width * .41,
              ),
            ],
          ),
          CustomOrdersRawIcon(
            rawText: locale.translate('subject')!,
            iconImagePath: "assets/icons/notes_icon.png",
          ),
          CustomRequestsTextField(
            containerHeight: 80,
            hintTextField: locale.translate('subject')!,
            fieldLines: 3,
          ),
        ],
      ),
    );
  }
}
