import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
        thickness: 1, color: Color(0xffD6D6D6), endIndent: 20, indent: 20);
  }
}
