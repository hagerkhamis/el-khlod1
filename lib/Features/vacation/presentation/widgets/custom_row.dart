import 'package:flutter/material.dart';
import 'package:elkhlod/core/utils/hex_color.dart';

import '../../../../../../../core/utils/constants.dart';

class CustomOrderItem extends StatelessWidget {
  final String titleText;
  final String subTitleText;
  final String imgScr;
  final bool hasStatusIcon;
  const CustomOrderItem(
      {super.key,
      required this.hasStatusIcon,
      required this.titleText,
      required this.subTitleText,
      required this.imgScr});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(children: [
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(.1),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Center(
            child: Image.asset(
              imgScr,
              color: kPrimaryColor,
            ),
          ),
        ),
        Text(
          "   $titleText : ",
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
        Row(
          children: [
            hasStatusIcon
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: subTitleText.contains("تم الإعتماد")
                              ? HexColor("#a8ffb3")
                              : subTitleText.contains("تم رفض الطلب")
                                  ? HexColor("#ffb3be")
                                  : Colors.amber.withOpacity(.5)),
                      child: Text(
                        subTitleText,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                  )
                : Container(),
            Text(
              hasStatusIcon ? " " : subTitleText,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
