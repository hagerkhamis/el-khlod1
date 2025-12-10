import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/auth/login/domain/entities/employee_entity.dart';
import 'package:elkhlod/Features/bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import 'package:elkhlod/Features/mosalat/domain/entities/mosalat_entity.dart';
import 'package:elkhlod/Features/mosalat/presentation/manager/seen_cubit/add_mosalat_cubit.dart';
import 'package:elkhlod/Features/mosalat/presentation/manager/select_file/presentation/cubit/select_file_mosalat_cubit.dart';
import 'package:elkhlod/core/locale/app_localizations.dart';
import 'package:elkhlod/core/widgets/custom_button.dart';
import 'package:elkhlod/core/widgets/custom_orders_raw_icon.dart';
import 'package:elkhlod/core/widgets/custom_request_text_field.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/utils/gaps.dart';
import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../../../core/widgets/custom_simple_app_bar.dart';
import '../../../../../core/widgets/custom_elevated_container.dart';

class MosalatDetailsView extends StatefulWidget {
  const MosalatDetailsView({
    super.key,
  });

  @override
  State<MosalatDetailsView> createState() => _MosalatDetailsViewState();
}

class _MosalatDetailsViewState extends State<MosalatDetailsView> {
  late TextEditingController reasonController;
  late TextEditingController mobarerController;
  late TextEditingController otherController;

  @override
  void initState() {
    super.initState();
    reasonController = TextEditingController();
    mobarerController = TextEditingController();
    otherController = TextEditingController();
  }

  @override
  void dispose() {
    reasonController.dispose();
    mobarerController.dispose();
    otherController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MosalatEntity mosalat;
    File? selectedFile;

    mosalat = BlocProvider.of<BottomNavCubit>(context).details!;
    var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);
    // final reasonController = TextEditingController(),
    //     mobarerController = TextEditingController(),
    //     otherController = TextEditingController();

    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: MediaQuery.of(context).size * .08,
          child: CustomSimpleAppBar(
            appBarTitle: "تفاصيل المسائلة",
          ),
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            BlocListener<AddAnswerMosalatCubit, AddAnswerMosalatState>(
              listener: (context, state) {
                if (state is SeenMosalatSuccessful) {
                  BlocProvider.of<BottomNavCubit>(context)
                      .updateBottomNavIndex(kMosalatListScreen);
                  BlocProvider.of<BottomNavCubit>(context)
                      .navigationQueue
                      .addLast(BlocProvider.of<BottomNavCubit>(context)
                          .bottomNavIndex);
                } else if (state is SeenMosalatFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.red,
                  ));
                }
              },
              child: Container(
                alignment: Alignment.bottomCenter,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                      child: CustomCashedNetworkImage(
                          imageUrl: NewApi.baseUrl + mosalat.empName!),
                    ),
                  ),
                  title: Text(
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                    "${mosalat.empName}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
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
                  Row(
                    children: [
                      Text(
                        "تاريخ المسائلة : ",
                        style: TextStyle(color: kPrimaryColor, fontSize: 12),
                      ),
                      Text(mosalat.mosalaDateAr!),
                    ],
                  ),
                  Gaps.vGap10,
                  Text(
                    "سبب المسائلة :",
                    style: TextStyle(color: kPrimaryColor, fontSize: 12),
                  ),
                  Gaps.vGap10,
                  SizedBox(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: mosalat.mokalfatList!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "${index + 1}  - ${mosalat.mokalfatList![index].mokalfaName!}",
                                  style: const TextStyle(fontSize: 12)),
                              Gaps.vGap10
                            ],
                          );
                        }),
                  ),
                  const Divider(
                    color: Colors.black,
                    endIndent: 1,
                    indent: 2,
                  ),
                  Gaps.vGap10,
                  mosalat.haveEgraa == "yes"
                      ? Column(children: [
                          const CustomOrdersRawIcon(
                            rawText: "سبب قيامك بهذه المخالفات ؟",
                            iconImagePath: "assets/icons/notes_icon.png",
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .1,
                            child: CustomRequestsTextField(
                              controller: reasonController,
                              hintTextField: "سبب قيامك بهذه المخالفات ؟",
                            ),
                          ),
                          const CustomOrdersRawIcon(
                            rawText: "هل لديك مبرر يثبت صحة ما ذكرته ؟",
                            iconImagePath: "assets/icons/notes_icon.png",
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .1,
                            child: CustomRequestsTextField(
                              controller: mobarerController,
                              hintTextField: "هل لديك مبرر يثبت صحة ما ذكرته ؟",
                            ),
                          ),
                          const CustomOrdersRawIcon(
                            rawText: "هل لديك أقوال أخري ؟",
                            iconImagePath: "assets/icons/notes_icon.png",
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .1,
                            child: CustomRequestsTextField(
                              controller: otherController,
                              hintTextField: "هل لديك أقوال أخري ؟",
                            ),
                          ),
                        ])
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              const CustomOrdersRawIcon(
                                rawText: "سبب قيامك بهذه المخالفات ؟",
                                iconImagePath: "assets/icons/notes_icon.png",
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0),
                                child: Text("${mosalat.answerReasons!}"),
                              ),
                              Gaps.vGap10,
                              const CustomOrdersRawIcon(
                                rawText: "هل لديك مبرر يثبت صحة ما ذكرته ؟",
                                iconImagePath: "assets/icons/notes_icon.png",
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0),
                                child: Text("${mosalat.answerMobarer!}"),
                              ),
                              Gaps.vGap10,
                              const CustomOrdersRawIcon(
                                rawText: "هل لديك أقوال أخري ؟",
                                iconImagePath: "assets/icons/notes_icon.png",
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0),
                                child: Text("${mosalat.answerOther!}"),
                              ),
                            ]),
                  mosalat.mosalaFile != "null"
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "الإطلاع علي الملف : ",
                              style:
                                  TextStyle(color: kPrimaryColor, fontSize: 12),
                            ),
                            Gaps.vGap10,
                            SizedBox(
                              height: 400,
                              child: SfPdfViewer.network(mosalat.mosalaFile!),
                            ),
                          ],
                        )
                      : const SizedBox(),
                  Gaps.vGap20,
                  mosalat.haveEgraa == "yes"
                      ? GestureDetector(
                          onTap: () async {
                            await BlocProvider.of<SelectFileMosalatCubit>(
                                    context)
                                .pickFileFromDevice();
                          },
                          child: CustomElevatedContainer(
                            containerHeight:
                                MediaQuery.of(context).size.height * .1,
                            containerWidth: MediaQuery.of(context).size.width,
                            containerChild: BlocBuilder<SelectFileMosalatCubit,
                                SelectFileMosalatState>(
                              builder: (context, state) {
                                if (state is PickFileState) {
                                  selectedFile = state.filePath;

                                  return Center(
                                    child: Text(state.fileName),
                                  );
                                } else if (state is PickImageState) {
                                  selectedFile = state.imagePath;
                                  return Image.file(
                                    state.imagePath,
                                    fit: BoxFit.fill,
                                    width:
                                        MediaQuery.of(context).size.width / 1.5,
                                    height: double.infinity,
                                  );
                                } else {
                                  return Image.asset(
                                    "assets/images/upload_cloud.png",
                                    alignment: Alignment.center,
                                    width: 50,
                                    height: 50,
                                    //  MediaQuery.of(context).size.width * 1
                                  );
                                }
                              },
                            ),
                          ),
                        )
                      : const SizedBox(),
                  mosalat.haveEgraa == "yes"
                      ? Center(
                          child: BlocBuilder<AddAnswerMosalatCubit,
                              AddAnswerMosalatState>(
                            builder: (context, state) {
                              return state is SeenMosalatLoading
                                  ? const CircularProgressIndicator()
                                  : CustomButton(
                                      screenWidth:
                                          MediaQuery.of(context).size.width *
                                              .7,
                                      buttonTapHandler: () {
                                        BlocProvider.of<AddAnswerMosalatCubit>(
                                                context)
                                            .addAnswer(
                                                mosalat.mosalaId!,
                                                box
                                                    .get(kEmployeeDataBox)!
                                                    .employeeId!,
                                                mobarerController.text,
                                                otherController.text,
                                                reasonController.text,
                                                selectedFile);
                                      },
                                      buttonText: locale.translate('send')!);
                            },
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
            Gaps.vGap100,
          ]),
        ));
  }
}
