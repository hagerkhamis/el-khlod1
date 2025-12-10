import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/core/utils/assets.dart';
import 'package:elkhlod/core/utils/media_query_sizes.dart';

import '../../../../../../core/utils/constants.dart';

import '../../../../auth/login/domain/entities/employee_entity.dart';
import '../../../../bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';

// ignore: must_be_immutable
class LocationsViewBody extends StatefulWidget {
  const LocationsViewBody({super.key});

  @override
  State<LocationsViewBody> createState() => _LocationsViewBodyState();
}

class _LocationsViewBodyState extends State<LocationsViewBody> {
  var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);

  @override
  void initState() {
    _onInit();
    super.initState();
  }

  @override
  void dispose() {
    // BlocProvider.of<LocationsCubit>(context).close();
    super.dispose();
  }

  void _onInit() async {
    if (box.get(kEmployeeDataBox) != null) {
      //    await BlocProvider.of<LocationsCubit>(context).getAllLocations();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: SizeConfig.screenHeight! * 0.25,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: kPrimaryColor),
              child: GestureDetector(
                onTap: () {
                  BlocProvider.of<BottomNavCubit>(context)
                      .updateBottomNavIndex(kStatusSelectLocationScreen);
                  BlocProvider.of<BottomNavCubit>(context)
                      .navigationQueue
                      .addLast(BlocProvider.of<BottomNavCubit>(context)
                          .bottomNavIndex);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      AssetsData.fingerPrint,
                      width: SizeConfig.screenWidth! * 0.2,
                      color: Colors.white,
                    ),
                    const Text(
                      "بصمة موقع",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: kPrimaryColor,
            ),
            // BlocBuilder<LocationsCubit, LocationsState>(
            //   builder: (context, state) {
            //     if (state is FetchSuccessful) {
            //       AllLocationsList locationList = state.data!;

            //       return ListView.builder(
            //         physics: const NeverScrollableScrollPhysics(),
            //         shrinkWrap: true,
            //         itemCount: state.data!.length,
            //         itemBuilder: (context, index) {
            //           return InkWell(
            //             onTap: () {
            //               BlocProvider.of<BottomNavCubit>(context)
            //                 ..updateBottomNavIndex(
            //                   kStatusDetailsLocationScreen,
            //                 )
            //                 ..getDetails(state.data![index]);
            //               BlocProvider.of<BottomNavCubit>(context)
            //                   .navigationQueue
            //                   .addLast(BlocProvider.of<BottomNavCubit>(context)
            //                       .bottomNavIndex);
            //             },
            //             child: AllLocationsListItem(
            //               locationsList: locationList,
            //               itemIndex: index,
            //             ),
            //           );
            //         },
            //       );
            //     } else if (state is FetchLoading) {
            //       return const Center(
            //         child: CustomLoadingWidget(
            //           loadingText: "جاري تحميل البيانات ",
            //         ),
            //       );
            //     } else if (state is FetchFailed) {
            //       return EmptyWidget(
            //         text: state.message,
            //       );
            //     } else if (box.get(kEmployeeDataBox) == null) {
            //       return ErrorText(
            //           image: "assets/images/should_login.png",
            //           text: AppLocalizations.of(context)!
            //               .translate('you_should_login_first')!);
            //     } else {
            //       return const ErrorText(text: "حدث خطأ ما");
            //     }
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
