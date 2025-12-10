import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elkhlod/Features/add_location/data/models/locations.dart';
import 'package:elkhlod/Features/add_location/presentation/manager/delete_locations_cubit/delete_locations_cubit.dart';
import 'package:elkhlod/Features/bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import 'package:elkhlod/core/widgets/custom_button.dart';

import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/utils/gaps.dart';
import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../../../core/widgets/custom_simple_app_bar.dart';

class LocationsDetailsView extends StatelessWidget {
  const LocationsDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Locations location;

    bool isError = false;
    location = BlocProvider.of<BottomNavCubit>(context).details!;

    // BlocProvider.of<SeenTa3memCubit>(context).deleteMessage(
    //     ta3mem.ta3memIdFk!, box.get(kEmployeeDataBox)!.employeeId!);
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: MediaQuery.of(context).size * .08,
          child: CustomSimpleAppBar(
            appBarTitle: "تفاصيل الموقع",
          ),
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    child: CustomCashedNetworkImage(
                        imageUrl: NewApi.baseUrl + location.imgPath!),
                  ),
                ),
                trailing: Text(
                  location.sendTime!,
                  overflow: TextOverflow.ellipsis,
                ),
                title: Text(
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                  "${location.empName}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ),
            Gaps.vGap10,
            Gaps.vGap10,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "تاريخ البصمة :",
                    style: TextStyle(color: kPrimaryColor, fontSize: 12),
                  ),
                  Gaps.vGap20,
                  Text(location.sendDateAr!),
                  Gaps.vGap10,
                  Text(location.sendTime!),
                  Gaps.vGap10,
                  location.sendTime != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Divider(
                              color: Colors.black,
                              endIndent: 1,
                              indent: 2,
                            ),
                            isError == false
                                ? Text(
                                    "مرفقات : ",
                                    style: TextStyle(
                                        color: kPrimaryColor, fontSize: 12),
                                  )
                                : const SizedBox(),
                            Gaps.vGap10,
                            Center(
                              child: CachedNetworkImage(
                                errorWidget: (context, url, error) => Icon(
                                  Icons.person,
                                  color: kPrimaryColor,
                                ),
                                progressIndicatorBuilder:
                                    (context, url, progress) => Center(
                                  child: CircularProgressIndicator(
                                      value: progress.progress,
                                      color: kPrimaryColor),
                                ),
                                imageUrl: location.imgPath!,
                                errorListener: (error) {
                                  isError = true;
                                },
                              ),
                            ),
                            Gaps.vGap30,
                            // button delete
                            Center(
                              child: BlocListener<DeleteLocationsCubit,
                                      DeleteLocationsState>(
                                  listener: (context, state) {
                                if (state is DeleteFetchSuccessful) {
                                  BlocProvider.of<BottomNavCubit>(context)
                                      .navigationQueue
                                      .removeLast();

                                  BlocProvider.of<BottomNavCubit>(context)
                                      .updateBottomNavIndex(
                                          BlocProvider.of<BottomNavCubit>(
                                                  context)
                                              .navigationQueue
                                              .last);
                                }
                              }, child: BlocBuilder<DeleteLocationsCubit,
                                      DeleteLocationsState>(
                                builder: (context, state) {
                                  return state is DeleteFetchLoading
                                      ? CircularProgressIndicator(
                                          color: kPrimaryColor,
                                        )
                                      : CustomButton(
                                          onTapAvailable: true,
                                          buttonText: "حذف الموقع",
                                          buttonBackGroundColor: Colors.red,
                                          buttonTapHandler: () async {
                                            BlocProvider.of<
                                                        DeleteLocationsCubit>(
                                                    context)
                                                .getAllLocations(location.id!);
                                          },
                                          screenWidth: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .50,
                                        );
                                },
                              )),
                            ),
                          ],
                        )
                      : const SizedBox(),
                ],
              ),
            ),
            Gaps.vGap20,
          ]),
        ));
  }
}
