import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/constants.dart';
import '../../../data/models/locations.dart';

class AllLocationsListItem extends StatelessWidget {
  const AllLocationsListItem({
    super.key,
    required this.locationsList,
    required this.itemIndex,
  });
  final AllLocationsList locationsList;
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
              shape: locationsList![itemIndex].empName == "0"
                  ? RoundedRectangleBorder(
                      side: const BorderSide(
                        color:
                            Color.fromARGB(255, 146, 146, 146), //<-- SEE HERE
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    )
                  : null,
              color: locationsList![itemIndex].empName == "0"
                  ? const Color.fromARGB(255, 245, 241, 241)
                  : Colors.white,
              child: ListTile(
                title: Text(
                  locationsList![itemIndex].empName.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12),
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      locationsList![itemIndex].sendDateAr.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 10),
                    ),
                    Text(
                      locationsList![itemIndex].sendTime!,
                      style: const TextStyle(fontSize: 10),
                    ),
                  ],
                ),
                leading: CircleAvatar(
                  radius: 25,
                  onBackgroundImageError: (exception, stackTrace) {},
                  backgroundColor: kPrimaryColor.withOpacity(.4),
                  backgroundImage: CachedNetworkImageProvider(
                    locationsList![itemIndex].imgPath!,
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
