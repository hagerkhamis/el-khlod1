import 'package:flutter/material.dart';

class MessagesFilterWidget extends StatelessWidget {
  const MessagesFilterWidget(
      {super.key, required this.filterName, required this.filterTapHandler});
  final String filterName;
  final Function filterTapHandler;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          filterTapHandler();
        },
        child: Card(
          elevation: 4,
          child: Container(
            height: 40,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * .3,
            child: Text(filterName),
          ),
        ),
      ),
    );
  }
}
