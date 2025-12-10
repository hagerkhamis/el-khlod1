import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:elkhlod/Features/ehsaeyat/data/models/my_messages_model/ehsaeyat_model.dart';

class AllEhsaeyatListItem extends StatelessWidget {
  const AllEhsaeyatListItem({
    super.key,
    required this.ta3amemList,
    required this.itemIndex,
  });
  final EhsaeyatList ta3amemList;
  final int itemIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeInLeft(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(ta3amemList![itemIndex].title.toString()),
                      const VerticalDivider(
                        color: Colors.black,
                        thickness: 2,
                      ),
                      Text(ta3amemList![itemIndex].notes ?? ""),
                    ],
                  ),
                  const Divider()
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
