import 'package:flutter/material.dart';
import 'package:elkhlod/Features/visits/domain/entities/visits_entity.dart';
import 'package:elkhlod/core/utils/gaps.dart';
import 'package:elkhlod/core/utils/hex_color.dart';

import '../../../../../core/utils/constants.dart';

class VisitsListItem extends StatelessWidget {
  const VisitsListItem({super.key, required this.status, required this.visits});

  final String status;
  final VisitEntity visits;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 7, left: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(KVisitDetailsRoute, arguments: visits);
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  color: kTextColor.withOpacity(0.4),
                  blurRadius: 3.0,
                  offset: const Offset(0.0, 0.8))
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    visits.visitTitle ?? "",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    visits.visitDate ?? "",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Gaps.vGap10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    visits.teacherName!,
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.6), fontSize: 12),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: visits.numStd!.contains("تم الإعتماد")
                                ? HexColor("#a8ffb3")
                                : visits.numStd!.contains("تم رفض الطلب")
                                    ? HexColor("#ffb3be")
                                    : Colors.amber.withOpacity(.5)),
                        child: Text(
                          visits.percent!,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Gaps.vGap10,
            ],
          ),
        ),
      ),
    );
  }
}
