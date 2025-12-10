import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:elkhlod/core/utils/commons.dart';
import 'package:elkhlod/core/utils/gaps.dart';
import 'package:elkhlod/core/utils/hex_color.dart';
import 'package:elkhlod/core/widgets/custom_button.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/functions/registration_alert.dart';
import '../../../../core/widgets/custom_simple_app_bar.dart';
import '../../../../core/widgets/divider_custom.dart';
import '../../../auth/login/domain/entities/employee_entity.dart';
import '../../../bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import '../../domain/entities/wathaek_entity.dart';
import '../manager/delete_wathaek_cubit/delete_wathaek_cubit.dart';

class WathaekDetailsScreen extends StatefulWidget {
  const WathaekDetailsScreen({super.key});

  @override
  State<WathaekDetailsScreen> createState() => _WathaekDetailsScreenState();
}

class _WathaekDetailsScreenState extends State<WathaekDetailsScreen> {
  int currentIndex = 0;
  WathaekEntity mobadarat = const WathaekEntity();
  // Future<void> _shareFile() async {
  //   try {
  //     final directory = await getApplicationDocumentsDirectory();
  //     final File file = File('${directory.path}/example.txt');
  //     if (!file.existsSync()) {
  //       await file.writeAsString('This is an example file for sharing.');
  //     }
  //     Share.shareXFiles([XFile(file.path)], text: 'Sharing an example file');
  //   } catch (e) {
  //     print('error: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    mobadarat = BlocProvider.of<BottomNavCubit>(context).details!;
    // late AppLocalizations locale;
    // locale = AppLocalizations.of(context)!;
    final screenSize = MediaQuery.of(context).size;

    var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: screenSize * .07,
        child: CustomSimpleAppBar(
          appBarTitle: "تفاصيل التوثيق",
        ),
      ),
      body: SingleChildScrollView(
        child: BlocListener<DeleteWathaekCubit, DeleteWathaekState>(
          listener: (context, state) {
            if (state is DeleteWathaekSuccessful) {
              Commons.showToast(context, message: state.message);

              BlocProvider.of<BottomNavCubit>(context)
                  .updateBottomNavIndex(kStatusWathaek);
              BlocProvider.of<BottomNavCubit>(context).navigationQueue.addLast(
                  BlocProvider.of<BottomNavCubit>(context).bottomNavIndex);
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              children: [
                Gaps.vGap20,
                Text(mobadarat.title ?? "",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 17,
                        fontWeight: FontWeight.bold)),
                Gaps.vGap20,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(mobadarat.sendDate ?? " ",
                              style: const TextStyle(fontSize: 15)),
                          Text(mobadarat.sendTime!,
                              style: const TextStyle(fontSize: 15)),
                        ],
                      ),
                      Container(
                        width: 100,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: mobadarat.haletTalab!.contains("تم الإعتماد")
                                ? HexColor("#a8ffb3")
                                : mobadarat.haletTalab!.contains("تم رفض الطلب")
                                    ? HexColor("#ffb3be")
                                    : Colors.amber.withOpacity(.5)),
                        child: Text(
                          mobadarat.haletTalab!,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                const CustomDivider(),
                Gaps.vGap15,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(mobadarat.notes ?? "",
                      textAlign: TextAlign.justify,
                      style: const TextStyle(fontSize: 15, height: 2)),
                ),
                Gaps.vGap15,
                mobadarat.radNotes == null || mobadarat.radNotes!.isEmpty
                    ? const SizedBox()
                    : Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: HexColor("#a8ffb3"),
                        ),
                        child: Text(
                          mobadarat.radNotes ?? "",
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                Gaps.vGap10,
                Text(
                  " الصورة ( ${(currentIndex + 1).toString()} ) ",
                ),
                Gaps.vGap10,

                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: PhotoViewGallery.builder(
                    scrollPhysics: const BouncingScrollPhysics(),
                    builder: (BuildContext context, int index) {
                      return PhotoViewGalleryPageOptions(
                        imageProvider: NetworkImage(
                          mobadarat.allImages![index].fileName ?? "",
                          //  scale: 1,
                        ),
                        // initialScale: PhotoViewComputedScale.contained * 1,

                        heroAttributes: PhotoViewHeroAttributes(
                            tag: mobadarat.allImages![index].id!),
                      );
                    },
                    itemCount: mobadarat.allImages!.length,
                    loadingBuilder: (context, event) => Center(
                      child: SizedBox(
                        width: 20.0,
                        height: 20.0,
                        child: CircularProgressIndicator(
                          value: event == null
                              ? 0
                              : event.cumulativeBytesLoaded / 1,
                        ),
                      ),
                    ),
                    backgroundDecoration:
                        const BoxDecoration(color: Colors.white),
                    scrollDirection: Axis.horizontal,

                    // pageController: widget.pageController,
                    onPageChanged: (int index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
                // SizedBox(
                //   height: 200,
                //   width: double.infinity,
                //   child: GestureDetector(
                //     onTap: () {
                //       showDialog(
                //           builder: (BuildContext context) => AlertDialog(
                //                 backgroundColor: Colors.transparent,
                //                 insetPadding: EdgeInsets.all(2),
                //                 title: Container(
                //                   decoration: BoxDecoration(),
                //                   width: MediaQuery.of(context).size.width,
                //                   child: Expanded(
                //                     child: Image.network(
                //                       mobadarat.allImages![0].fileName ??
                //                           "" + '?alt=media',
                //                       fit: BoxFit.fill,
                //                       // height: double.infinity,
                //                       // width: double.infinity,
                //                       width: MediaQuery.of(context).size.width,
                //                       height:
                //                           MediaQuery.of(context).size.height *
                //                               .5,
                //                       alignment: Alignment.center,
                //                       repeat: ImageRepeat.noRepeat,
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //           context: context);
                //       // child:
                //       // ClipRRect(
                //       //     borderRadius: BorderRadius.circular(8),
                //       //     child: Image.network(
                //       //       mobadarat.allImages![0].fileName ?? "",
                //       //       fit: BoxFit.fill,
                //       //     ));
                //     },
                //     child: CachedNetworkImage(
                //       color: Colors.black,
                //       imageUrl: mobadarat.allImages![0].fileName ?? "",
                //       placeholder: (context, url) => const BlankImageWidget(),
                //       errorWidget: (context, url, error) =>
                //           const BlankImageWidget(),
                //       imageBuilder: (context, imageProvider) => Container(
                //         decoration: BoxDecoration(
                //           // borderRadius:
                //           //     borderRadius ?? BorderRadius.circular(radius),
                //           image: DecorationImage(
                //               image: imageProvider, fit: BoxFit.cover),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),

                Gaps.vGap50,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      mobadarat.editDelete == "yes"
                          ? CustomButton(
                              screenWidth:
                                  MediaQuery.of(context).size.width * .4,
                              buttonTapHandler: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext contextx) {
                                    return alertDelete(context, () {
                                      BlocProvider.of<DeleteWathaekCubit>(
                                              context)
                                          .deleteWathaek(
                                        mobadarat.id!,
                                        box.get(kEmployeeDataBox)!.employeeId!,
                                      );
                                      Navigator.pop(contextx);
                                    });
                                  },
                                );
                              },
                              buttonBackGroundColor: Colors.red,
                              buttonText: "إلغاء الطلب")
                          : const SizedBox(),
                    ],
                  ),
                ),

                Gaps.vGap50,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
