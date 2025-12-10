import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:elkhlod/Features/bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import 'package:elkhlod/Features/ehsaeyat/data/models/my_messages_model/ehsaeyat_model.dart';

import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/utils/gaps.dart';
import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../../../core/widgets/custom_simple_app_bar.dart';

class EhsaeyatDetailsView extends StatelessWidget {
  const EhsaeyatDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Ehsaeyat ta3mem;

    bool isError = false;
    ta3mem = BlocProvider.of<BottomNavCubit>(context).details!;

  
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: MediaQuery.of(context).size * .08,
          child: CustomSimpleAppBar(
            appBarTitle: "تفاصيل التعميم",
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
                        imageUrl: NewApi.baseUrl + ta3mem.id!),
                  ),
                ),
                trailing: Text(
                  ta3mem.id!,
                  overflow: TextOverflow.ellipsis,
                ),
                title: Text(
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                  "${ta3mem.id}",
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
                    "عنوان التعميم :",
                    style: TextStyle(color: kPrimaryColor, fontSize: 12),
                  ),
                  Gaps.vGap20,
                  Text(ta3mem.id!),
                  Gaps.vGap10,
                  Gaps.vGap10,
                  ta3mem.id != null
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
                                imageUrl:
                                    "${NewApi.imageBaseUrl}${ta3mem.id!}",
                                errorListener: (error) {
                                  isError = true;
                                },
                              ),
                            )
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
