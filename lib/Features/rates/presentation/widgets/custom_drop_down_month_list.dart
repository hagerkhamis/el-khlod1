import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elkhlod/Features/rates/presentation/cubit/month_cubit/month_cubit.dart';

// ignore: must_be_immutable
class CustomDropDownMonthList extends StatefulWidget {
  CustomDropDownMonthList(
      {super.key,
      required this.hintText,
      this.width,
      this.onTap,
      this.initValue = ""});
  String hintText;
  String? initValue;

  double? width;
  final onTap;
  @override
  State<CustomDropDownMonthList> createState() =>
      _CustomDropDownMonthListState();
}

class _CustomDropDownMonthListState extends State<CustomDropDownMonthList> {
  List<String> items = ["1", "2"];
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
        // alignment: Alignment.center,
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
        child: BlocBuilder<MonthCubit, MonthState>(
          builder: (context, state) {
            if (state is FetchSuccessful) {
              return DropdownMenu(
                  initialSelection: widget.initValue,
                  width: MediaQuery.of(context).size.width * .9,
                  // label: const Text("اختر شهر "),
                  hintText: "اختر شهر ",
                  onSelected: (value) {
                    debugPrint(value as String?);
                    widget.onTap.call(value);
                  },
                  inputDecorationTheme: const InputDecorationTheme(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10)),
                  dropdownMenuEntries: state.data!
                      .map((category) => DropdownMenuEntry(
                            value: category.monthId!,
                            label: category.monthName!,
                          ))
                      .toList());
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
