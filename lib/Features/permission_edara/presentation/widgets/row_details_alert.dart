import '../../../../../core/utils/gaps.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RowDetailsAlert extends StatelessWidget {
  final String staticText;
  final String comeText;

  const RowDetailsAlert({
    super.key,
    required this.staticText,
    required this.comeText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const FaIcon(
          FontAwesomeIcons.arrowLeftLong,
          color: Color(0xd97350cb),
          size: 20,
        ),
        Gaps.hGap10,
        Text(staticText,
            style: const TextStyle(color: Color(0xff282828), fontSize: 15.0),
            textAlign: TextAlign.left),
        Gaps.hGap10,
        Text(comeText,
            style: const TextStyle(color: Color(0xff282828), fontSize: 15.0),
            textAlign: TextAlign.right),
        Gaps.hGap10,
      ],
    );
  }
}
