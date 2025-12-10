import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/custom_elevated_container.dart';

class CustomTimePicker extends StatefulWidget {
  const CustomTimePicker({super.key, required this.timePickerText, this.onTap});
  final String timePickerText;
  final onTap;

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  // ignore: prefer_typing_uninitialized_variables
  var pickedTime;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    String formatTimeOfDay(TimeOfDay tod) {
      final now = DateTime.now();
      final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
      final format = DateFormat.jm(); //"6:00 AM"
      return format.format(dt);
    }

    return InkWell(
      onTap: () {
        showTimePicker(
                builder: (context, Widget? child) {
                  return MediaQuery(
                    data: MediaQuery.of(context)
                        .copyWith(alwaysUse24HourFormat: false),
                    child: child!,
                  );
                },
                context: context,
                initialTime: TimeOfDay.now())
            .then((value) {
          setState(() {
            pickedTime = formatTimeOfDay(value!);
          });

          widget.onTap?.call(value!);

          debugPrint("SWWRER ${formatTimeOfDay(value!)}");
        });
      },
      child: CustomElevatedContainer(
          alignment: Alignment.centerRight,
          containerWidth: screenSize.width * .4,
          containerHeight: screenSize.height * .045,
          containerChild: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              pickedTime == null
                  ? widget.timePickerText
                  : pickedTime.toString(),
              textAlign: TextAlign.left,
              style: const TextStyle(color: kTextColor),
            ),
          )),
    );
  }
}
