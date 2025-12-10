import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import 'package:elkhlod/Features/auth/login/domain/entities/employee_entity.dart';
import 'package:elkhlod/Features/bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import 'package:elkhlod/Features/lwae7/presentation/manager/seen_cubit/seen_lwae7_cubit.dart';
import 'package:elkhlod/core/utils/network/api/network_api.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/utils/gaps.dart';
import '../../../../../../core/widgets/custom_simple_app_bar.dart';
import '../../../data/models/my_messages_model/lwae7.dart';

class Lwae7DetailsView extends StatefulWidget {
  const Lwae7DetailsView({
    super.key,
  });

  @override
  State<Lwae7DetailsView> createState() => _Lwae7DetailsViewState();
}

class _Lwae7DetailsViewState extends State<Lwae7DetailsView> {
  final ReceivePort _port = ReceivePort();

  @override
  void initState() {
    super.initState();

    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      // String id = data[0];
      setState(() {});
    });
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  @pragma('vm:entry-point')
  static void downloadCallback(String id, int status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send?.send([id, status, progress]);
  }

  @override
  Widget build(BuildContext context) {
    Lwae7 lwae7;

    bool isError = false;
    lwae7 = BlocProvider.of<BottomNavCubit>(context).details!;
    var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);

    BlocProvider.of<SeenLwae7Cubit>(context)
        .deleteMessage(lwae7.layhaId!, box.get(kEmployeeDataBox)!.employeeId!);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: MediaQuery.of(context).size * .08,
          child: CustomSimpleAppBar(
            appBarTitle: "تفاصيل السياسات واللوائح",
          ),
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                trailing: Text(
                  lwae7.seenDate.toString(),
                  overflow: TextOverflow.ellipsis,
                ),
                title: Text(
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                  "${lwae7.layhaName}",
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
                  lwae7.layhaPath != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            isError == false
                                ? Text(
                                    "الإطلاع علي الملف : ",
                                    style: TextStyle(
                                        color: kPrimaryColor, fontSize: 12),
                                  )
                                : const SizedBox(),
                            Gaps.vGap10,
                            SizedBox(
                              height: 400,
                              child: SfPdfViewer.network(
                                  "${NewApi.imageBaseUrl}${lwae7.layhaPath!}"),
                            ),
                            // GestureDetector(
                            //     onTap: () async {
                            //       String fileName =
                            //           "${NewApi.imageBaseUrl}${lwae7.layhaPath!}"
                            //               .split('/')
                            //               .last;

                            //       var dir = await getExternalStorageDirectory();

                            //       String savePath = "${dir!.path}/$fileName";

                            //       bool directoryExists =
                            //           await Directory(savePath).exists();
                            //       bool fileExists =
                            //           await File(savePath).exists();
                            //       if (directoryExists || fileExists) {
                            //         OpenFile.open(savePath);
                            //       } else {
                            //         downloadFile(
                            //           "${NewApi.imageBaseUrl}${lwae7.layhaPath!}",
                            //           fileName,
                            //         );
                            //       }
                            //     },
                            //     child: const Center(
                            //         child: Icon(Icons.download_outlined,
                            //             size: 70))),
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
