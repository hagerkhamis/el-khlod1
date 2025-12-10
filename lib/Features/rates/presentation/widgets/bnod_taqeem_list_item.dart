import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elkhlod/Features/rates/data/models/bnod_taqeem_model.dart';
import 'package:elkhlod/Features/rates/data/models/submitAnswer.dart';
import 'package:elkhlod/core/utils/hex_color.dart';

class BnodTaqeemListItem extends StatefulWidget {
  const BnodTaqeemListItem({
    super.key,
    required this.ta3amemList,
    required this.itemIndex,
    required this.image,
    this.answer,
  });
  final BnodTaqeemList ta3amemList;
  final int itemIndex;
  final String image;
  final ValueChanged<SubmitAnswer>? answer;

  @override
  State<BnodTaqeemListItem> createState() => _BnodTaqeemListItemState();
}

class _BnodTaqeemListItemState extends State<BnodTaqeemListItem> {
  @override
  Widget build(BuildContext context) {
    double ratingValue = 0.0;
    SubmitAnswer? submitAnswer;

    return GestureDetector(
      onTap: () {
        // BlocProvider.of<BottomNavCubit>(context)
        //     .navigationQueue
        //     .addLast(BlocProvider.of<BottomNavCubit>(context).bottomNavIndex);
        // BlocProvider.of<BottomNavCubit>(context)
        //     .updateBottomNavIndex(kAllEmpTaqeemScreen);
      },
      child: FadeInLeft(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 10),
          margin: const EdgeInsets.all(10),
          // width: 70,
          // height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: HexColor("F6F6F6"),
              border: Border.all(color: HexColor("C1C1C1")),
              boxShadow: const [
                BoxShadow(
                    color: Color(0x29000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                    spreadRadius: 0)
              ]),
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                widget.ta3amemList![widget.itemIndex].title.toString(),
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 15),
              ),
              RatingBar(
                initialRating: ratingValue,
                minRating: 1,
                maxRating: double.parse(
                    widget.ta3amemList![widget.itemIndex].maxDegree!),
                itemCount: 5,
                itemSize: 40.r,
                updateOnDrag: true,
                allowHalfRating: true,
                ratingWidget: RatingWidget(
                  empty: const Icon(Icons.star_border_rounded,
                      color: Colors.amber),
                  half:
                      const Icon(Icons.star_half_rounded, color: Colors.amber),
                  full:
                      const Icon(Icons.star_rate_rounded, color: Colors.amber),
                ),
                onRatingUpdate: (double value) {
                  ratingValue = value;

                  submitAnswer = SubmitAnswer(
                      bandId:
                          int.parse(widget.ta3amemList![widget.itemIndex].id!),
                      empDegree: ratingValue.toInt());

                  widget.answer!.call(submitAnswer!);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
