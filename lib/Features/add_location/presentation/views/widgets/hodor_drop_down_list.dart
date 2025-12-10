import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HodorCustomDropDownList extends StatefulWidget {
  HodorCustomDropDownList({
    super.key,
    required this.hintText,
    this.width,
    this.onTap,
    this.initValue = "",
  });

  String hintText;
  String? initValue;
  double? width;
  final Function(String?)? onTap;

  @override
  State<HodorCustomDropDownList> createState() =>
      _HodorCustomDropDownListState();
}

class _HodorCustomDropDownListState extends State<HodorCustomDropDownList> {
  // ليستة ثابتة
  final List<Map<String, String>> items = [
    {"id": "1", "name": "حضور"},
    {"id": "2", "name": "انصراف"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: MediaQuery.of(context).size.height * .06,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xfff9f9f9),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1c000000),
            offset: Offset(0, 2),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: DropdownMenu<String>(
        // 👈 هنا حددنا النوع String
        initialSelection: widget.initValue,
        //  label: Text(widget.hintText),
        width: MediaQuery.of(context).size.width * .9,
        onSelected: (value) {
          debugPrint("Selected: $value");
          widget.onTap?.call(value);
        },
        inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
        ),
        dropdownMenuEntries: items
            .map(
              (item) => DropdownMenuEntry<String>(
                value: item["id"]!, // 👈 لازم نحدد إن value من النوع String
                label: item["name"]!,
              ),
            )
            .toList(),
      ),
    );
  }
}
