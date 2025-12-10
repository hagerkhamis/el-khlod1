import 'package:flutter/material.dart';

import '../../../../../core/utils/constants.dart';

class MyOrdersGridViewItem extends StatelessWidget {
  const MyOrdersGridViewItem({
    super.key,
    required this.gridItemTapHandler,
    required this.gridText,
    required this.gridImagePath,
    required this.navScreenIndex,
  });
  final Function gridItemTapHandler;
  final String gridText;
  final String gridImagePath;
  final int navScreenIndex;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        gridItemTapHandler();
      },
      child: Tooltip(
        decoration: const BoxDecoration(color: Colors.black),
        // textStyle: ,
        message: "icon messege",
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(.2),
              borderRadius: BorderRadius.circular(12)),
          width: MediaQuery.of(context).size.width / 2.7,
          height: MediaQuery.of(context).size.height / 7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                gridImagePath,
                height: MediaQuery.of(context).size.height * .08,
              ),
              SizedBox(
                //height: 40,
                child: Text(
                  gridText,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xff403f3f),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
