import 'package:flutter/material.dart';
import 'package:elkhlod/Features/visits/domain/entities/visits_entity.dart';
import 'package:elkhlod/core/utils/gaps.dart';
import 'package:elkhlod/core/utils/hex_color.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/custom_simple_app_bar.dart';
import '../../../../core/widgets/divider_custom.dart';

class VisitDetailsScreen extends StatefulWidget {
  final VisitEntity visits;
  const VisitDetailsScreen({super.key, required this.visits});

  @override
  State<VisitDetailsScreen> createState() => _VisitDetailsScreenState();
}

class _VisitDetailsScreenState extends State<VisitDetailsScreen> {
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
    //late AppLocalizations locale;
    // locale = AppLocalizations.of(context)!;
    final screenSize = MediaQuery.of(context).size;

    //  var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: screenSize * .07,
        child: CustomSimpleAppBar(
          appBarTitle: "تفاصيل الزيارة",
          backHandler: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            children: [
              Gaps.vGap20,
              Text(widget.visits.visitTitle ?? "",
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
                        Text(
                            "اسم المعلم :${widget.visits.teacherName ?? " "}  ",
                            style: const TextStyle(fontSize: 15)),
                        Text(
                            " الحصة :${widget.visits.hesa ?? " "} \n الفصل : ${widget.visits.fasl ?? " "}",
                            style: const TextStyle(fontSize: 15)),
                        Text(
                          " الملاحظات : ${widget.visits.visitNotes ?? ""}",
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: widget.visits.numStd!.contains("تم الإعتماد")
                              ? HexColor("#a8ffb3")
                              : widget.visits.numStd!.contains("تم رفض الطلب")
                                  ? HexColor("#ffb3be")
                                  : Colors.amber.withOpacity(.5)),
                      child: Text(
                        widget.visits.percent!,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
              const CustomDivider(),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
              //   child: Text(widget.visits.teacherName ?? "",
              //       textAlign: TextAlign.justify,
              //       style: const TextStyle(fontSize: 15, height: 2)),
              // ),

              Gaps.vGap20,
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.visits.visitDetails!.length,
                itemBuilder: (context, index) {
                  // final item = widget.visits.visitDetails![index];
                  return Card(
                    margin: const EdgeInsets.all(3),
                    child: ListTile(
                      title: Column(
                        children: [
                          Text(
                              widget.visits.visitDetails![index].bandName ?? '',
                              style: TextStyle(
                                  fontSize: 13, color: Colors.blue[900])),
                          widget.visits.visitDetails![index].notes!.isNotEmpty
                              ? Text(
                                  "(${widget.visits.visitDetails![index].notes})",
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.grey))
                              : const SizedBox(),
                        ],
                      ),
                      trailing: Container(
                        width: 100,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.red.withOpacity(.2),
                        ),
                        child: Text(
                            'الدرجة: ${widget.visits.visitDetails![index].degree}/${widget.visits.visitDetails![index].maxDegree}',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 10)),
                      ),
                      // trailing: Text('ID: ${item['id']}'),
                    ),
                  );
                },
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       widget.visits.haveEgraa == "yes"
              //           ? CustomButton(
              //               screenWidth: MediaQuery.of(context).size.width * .4,
              //               buttonTapHandler: () {
              //                 showDialog(
              //                   context: context,
              //                   builder: (BuildContext contextx) {
              //                     return alertDelete(context, () {
              //                       BlocProvider.of<DeleteVisitsCubit>(context)
              //                           .deleteVisits(
              //                         widget.visits.numStd!,
              //                         box.get(kEmployeeDataBox)!.employeeId!,
              //                       );
              //                       Navigator.pop(contextx);
              //                     });
              //                   },
              //                 );
              //               },
              //               buttonBackGroundColor: Colors.red,
              //               buttonText: "إلغاء الطلب")
              //           : const SizedBox(),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
