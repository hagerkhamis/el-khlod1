import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elkhlod/Features/app_home/presentation/manger/services_cubit/services_cubit.dart';
import 'package:elkhlod/Features/app_home/presentation/views/widgets/custom_grid_container.dart';
import 'package:elkhlod/core/utils/constants.dart';
import 'package:elkhlod/core/widgets/empty_widget.dart';

import '../../../../../core/locale/app_localizations.dart';
import '../../../../../core/utils/gaps.dart';
import '../../../../bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';

// ignore: must_be_immutable
class MyOrdersGridView extends StatelessWidget {
  const MyOrdersGridView({super.key});
  // List MyOrdersScreens = [
  //   kPermissionRquestScreen,
  //   kPermissionRquestScreen,
  //   kPermissionRquestScreen,
  //   kPermissionRquestScreen,
  //   kPermissionRquestScreen,
  //   kPermissionRquestScreen
  // ];
  @override
  Widget build(BuildContext context) {
    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    return BlocBuilder<ServicesCubit, ServicesState>(builder: (context, state) {
      if (state is FetchLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is FetchSuccessful) {
        return Column(
          children: [
            Text(state.data!.testModeTitle ?? "أختر الخدمة"),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     GestureDetector(
            //         onTap: () {
            //           BlocProvider.of<BottomNavCubit>(context)
            //               .updateBottomNavIndex(kStatusTableMahamScreen);
            //           BlocProvider.of<BottomNavCubit>(context)
            //               .navigationQueue
            //               .addLast(BlocProvider.of<BottomNavCubit>(context)
            //                   .bottomNavIndex);
            //         },
            //         child: const Text("report",
            //             style: TextStyle(color: Colors.black))),
            //     GestureDetector(
            //         onTap: () {
            //           BlocProvider.of<BottomNavCubit>(context)
            //               .updateBottomNavIndex(kStatusSelectMahamScreen);
            //           BlocProvider.of<BottomNavCubit>(context)
            //               .navigationQueue
            //               .addLast(BlocProvider.of<BottomNavCubit>(context)
            //                   .bottomNavIndex);
            //         },
            //         child: const Text("Add",
            //             style: TextStyle(color: Colors.black))),
            //   ],
            // ),

            Gaps.vGap30,
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
                mainAxisExtent: 90.h,
                childAspectRatio: 2,
              ),
              itemCount: state.data!.data!.length,
              itemBuilder: (context, index) {
                return CustomGridContainer(
                  onTap: () {
                    if (state.data!.data![index].screenNum == "56") {
                      Navigator.pushNamed(context, kEhsaeyatTableScreenRoute);
                    } else {
                      BlocProvider.of<BottomNavCubit>(context)
                          .updateBottomNavIndex(
                              int.parse(state.data!.data![index].screenNum!));
                      BlocProvider.of<BottomNavCubit>(context)
                          .navigationQueue
                          .addLast(BlocProvider.of<BottomNavCubit>(context)
                              .bottomNavIndex);
                    }
                  },
                  imagePath: state.data!.data![index].icon!,
                  orderText: state.data!.data![index].title!,
                );
              },
            ),
          ],
        );
      } else {
        return EmptyWidget(
          text: locale.translate('no_data')!,
        );
      }
    });
  }
}
