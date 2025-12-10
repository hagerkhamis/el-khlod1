// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:elkhlod/Features/bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
// import 'package:elkhlod/core/locale/app_localizations.dart';
// import 'package:elkhlod/core/utils/constants.dart';
// import 'package:elkhlod/core/utils/gaps.dart';


// class LocationVacationButtonWidget extends StatelessWidget {
// const LocationVacationButtonWidget({super.key, required this.locale});

// final AppLocalizations locale;

// @override
// Widget build(BuildContext context) {
// return Column(
// children: [
// Gaps.vGap10,
// InkWell(
// onTap: () {
// // // الضغط يفتح صفحة إجازة المدرين مباشرة
// // BlocProvider.of<BottomNavCubit>(context)
// BlocProvider.of<BottomNavCubit>(context)
// .updateBottomNavIndex(kLocationVacationScreen);



// // .updateBottomNavIndex(kManageLocationVacationScreen);
// },
// child: Column(
// children: const [
// Icon(Icons.beach_access, size: 40, color: Colors.blue),
// SizedBox(height: 5),
// Text("إجازة المدرين"),
// ],
// ),
// ),
// Gaps.vGap20,
// ],
// );
// }
// }
