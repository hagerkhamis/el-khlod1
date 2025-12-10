import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../data/models/my_messages_model/lwae7.dart';

class AllLwae7ListItem extends StatelessWidget {
  const AllLwae7ListItem({
    super.key,
    required this.lwae7List,
    required this.itemIndex,
  });
  final AllLwae7List lwae7List;
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
              shape: lwae7List![itemIndex].seen == "0"
                  ? RoundedRectangleBorder(
                      side: const BorderSide(
                        color:
                            Color.fromARGB(255, 146, 146, 146), //<-- SEE HERE
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    )
                  : null,
              color: lwae7List![itemIndex].seen == "0"
                  ? const Color.fromARGB(255, 245, 241, 241)
                  : Colors.white,
              child: ListTile(
                  title: Text(
                    lwae7List![itemIndex].layhaName.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12),
                  ),
                  trailing: const Icon(
                    Icons.download,
                  ),
                  leading: const Icon(
                    Icons.download_done_rounded,
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
