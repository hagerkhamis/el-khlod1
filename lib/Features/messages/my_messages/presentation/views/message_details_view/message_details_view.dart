import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/locale/app_localizations.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/utils/gaps.dart';
import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../../core/widgets/custom_loading_widget.dart';
import '../../../../../../core/widgets/custom_simple_app_bar.dart';
import '../../../../../bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import '../../manager/cubit/message_details_cubit.dart';

class MessageDetailsView extends StatelessWidget {
  const MessageDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MessageDetailsCubit>(context)
        .getMessageDetails(BlocProvider.of<BottomNavCubit>(context).messageId!);
    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    bool isError = false;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: MediaQuery.of(context).size * .08,
        child: CustomSimpleAppBar(
          appBarTitle: locale.translate("message_details")!,
        ),
      ),
      body: BlocBuilder<MessageDetailsCubit, MessageDetailsState>(
        builder: (context, state) {
          if (state is MessageDetailsSuccessful) {
            return SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // height: screenSize.height * .1,
                      alignment: Alignment.bottomCenter,
                      //   color: const Color(0x299a80d9),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                            child: CustomCashedNetworkImage(
                                imageUrl: NewApi.baseUrl +
                                    state.data![0].fromEmpImg!),
                          ),
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              state.data![0].msgDate!,
                              style: const TextStyle(fontSize: 12),
                            ),
                            Text(
                              state.data![0].msgTime!,
                              style: const TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                        title: Text(
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                          "${state.data![0].fromEmployeeName}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        subtitle: Text(
                          "${locale.translate("to")!} : ${state.data![0].toUsers![0].toEmployeeName}",
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                          overflow: TextOverflow.ellipsis,
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
                            "عنوان الرساله :",
                            style:
                                TextStyle(color: kPrimaryColor, fontSize: 12),
                          ),
                          Gaps.vGap20,
                          Text(state.data![0].subject!),
                          Gaps.vGap20,
                          const Divider(
                            color: Colors.black,
                            endIndent: 1,
                            indent: 2,
                          ),
                          Text(
                            "نص الرساله :",
                            style:
                                TextStyle(color: kPrimaryColor, fontSize: 12),
                          ),
                          Text(state.data![0].message!),
                          Gaps.vGap20,
                          state.data![0].file != null
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
                                                color: kPrimaryColor,
                                                fontSize: 12),
                                          )
                                        : const SizedBox(),
                                    Gaps.vGap10,
                                    Center(
                                      child: CachedNetworkImage(
                                        errorWidget: (context, url, error) =>
                                            Icon(
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
                                            "${NewApi.imageBaseUrl}${state.data![0].file!}",
                                        height: 150.0,
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
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 10),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Text(state.data![0].message!),
                    //       Gaps.vGap100,
                    //       Row(
                    //         children: [
                    //           const Text("File"),
                    //           Gaps.hGap10,
                    //           CustomCashedNetworkImage(
                    //             imageUrl:
                    //                 "https://alatheer.site/abnaa/${state.data![0].file!}",
                    //           )
                    //           // Text(
                    //           //     "https://alatheer.site/abnaa/${state.data![0].file!}"),
                    //         ],
                    //       ),
                    //       Gaps.vGap10,
                    //       const Divider(
                    //         color: Colors.black,
                    //         endIndent: 1,
                    //         indent: 2,
                    //       ),
                    //       Gaps.vGap10,
                    //       InkWell(
                    //         onTap: () {
                    //           BlocProvider.of<BottomNavCubit>(context)
                    //               .updateBottomNavIndex(kNewMessageView);
                    //         },
                    //         child: Row(
                    //           children: [
                    //             Image.asset("assets/icons/replay_icon.png"),
                    //             Gaps.hGap10,
                    //             Text(locale.translate("replay")!),
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // )

                    Gaps.vGap20,
                  ]),
            );
          } else if (state is MessageDetailsLoading) {
            return const CustomLoadingWidget();
          } else {
            return const CustomErrorWidget();
          }
        },
      ),
    );
  }
}
