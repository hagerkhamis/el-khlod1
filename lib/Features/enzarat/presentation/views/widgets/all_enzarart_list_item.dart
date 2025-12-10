import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:elkhlod/core/utils/network/api/network_api.dart';

import '../../../../../../core/utils/constants.dart';
import '../../../data/models/enzarat_model/enzarat.dart';

class AllEnzarartListItem extends StatelessWidget {
  const AllEnzarartListItem({
    super.key,
    required this.enzaratList,
    required this.itemIndex,
  });
  final AllEnzaratList enzaratList;
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
              shape: enzaratList![itemIndex].seen == "0"
                  ? RoundedRectangleBorder(
                      side: const BorderSide(
                        color:
                            Color.fromARGB(255, 146, 146, 146), //<-- SEE HERE
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    )
                  : null,
              color: enzaratList![itemIndex].seen == "0"
                  ? const Color.fromARGB(255, 245, 241, 241)
                  : Colors.white,
              child: ListTile(
                subtitle: Text(
                  enzaratList![itemIndex].details!.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 10),
                ),
                title: Text(
                  enzaratList![itemIndex].enzarType.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12),
                ),
                trailing: Text(
                  enzaratList![itemIndex].enzarTime!,
                  style: const TextStyle(fontSize: 12),
                ),
                leading: CircleAvatar(
                  radius: 25,
                  onBackgroundImageError: (exception, stackTrace) {},
                  backgroundColor: kPrimaryColor.withOpacity(.4),
                  backgroundImage: CachedNetworkImageProvider(
                    NewApi.imageBaseUrl + (enzaratList![itemIndex].enzarType!),
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
