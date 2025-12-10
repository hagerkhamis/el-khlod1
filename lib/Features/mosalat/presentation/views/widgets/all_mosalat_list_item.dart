import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:elkhlod/core/utils/network/api/network_api.dart';

import '../../../../../../core/utils/constants.dart';
import '../../../data/models/my_messages_model/mosalat.dart';

class AllMosalatListItem extends StatelessWidget {
  const AllMosalatListItem({
    super.key,
    required this.ta3amemList,
    required this.itemIndex,
  });
  final AllMosalatList ta3amemList;
  final int itemIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeInLeft(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Card(
              shadowColor: Colors.black,
              shape: ta3amemList![itemIndex].empName == "0"
                  ? RoundedRectangleBorder(
                      side: const BorderSide(
                        color:
                            Color.fromARGB(255, 146, 146, 146), //<-- SEE HERE
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    )
                  : null,
              color: ta3amemList![itemIndex].empName == "0"
                  ? const Color.fromARGB(255, 245, 241, 241)
                  : Colors.white,
              child: ListTile(
                subtitle: Text(
                  ta3amemList![itemIndex].mosalaDateAr.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 10),
                ),
                title: const Text(
                  "تاريخ المسائلة",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12),
                ),
                trailing: Icon(
                    color: ta3amemList![itemIndex].haveEgraa == "no"
                        ? Colors.green
                        : Colors.red,
                    ta3amemList![itemIndex].haveEgraa == "no"
                        ? Icons.check
                        : Icons.question_mark_outlined),
                leading: CircleAvatar(
                  radius: 25,
                  onBackgroundImageError: (exception, stackTrace) {},
                  backgroundColor: kPrimaryColor.withOpacity(.4),
                  backgroundImage: CachedNetworkImageProvider(
                    NewApi.imageBaseUrl + (ta3amemList![itemIndex].empName!),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
