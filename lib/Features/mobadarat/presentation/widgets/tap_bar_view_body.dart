import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/media_query_sizes.dart';
import 'current_tap.dart';

class TapBarViewBody extends StatefulWidget {
  const TapBarViewBody({super.key});

  @override
  State<TapBarViewBody> createState() => _TapBarViewBodyState();
}

List<String> taps = const [
  'طلبات جديدة',
  "طلباتي",
];

List<Widget> body = [
  const CurrentTap(status: "gari"),
  const CurrentTap(status: "accepted"),
];
int current = 0;

class _TapBarViewBodyState extends State<TapBarViewBody> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 50, top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  //  physics: const NeverScrollableScrollPhysics(),
                  itemCount: taps.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              current = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 7),
                            width: MediaQuery.of(context).size.width / 2.3,
                            height: 35,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 3.0,
                                    offset: const Offset(-1, 0))
                              ],
                              borderRadius: BorderRadius.circular(12),
                              color: current == index
                                  ? kPrimaryColor
                                  : Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                taps[index],
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    color: current == index
                                        ? Colors.white
                                        : kPrimaryColor),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Visibility(
                            visible: current == index,
                            child: Container(
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                  color: kPrimaryColor, shape: BoxShape.circle),
                            ))
                      ],
                    );
                  }),
            ),
            body[current],
          ],
        ),
      ),
    );
  }
}
