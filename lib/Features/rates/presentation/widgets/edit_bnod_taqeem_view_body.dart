import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import 'package:elkhlod/Features/rates/data/models/submitAnswer.dart';
import 'package:elkhlod/Features/rates/domain/entities/last_taqeem_entity.dart';
import 'package:elkhlod/Features/rates/presentation/cubit/edit_taqeem_cubit/edit_taqeem_cubit.dart';
import 'package:elkhlod/Features/rates/presentation/widgets/edit_bnod_taqeem_list_item.dart';
import 'package:elkhlod/core/utils/commons.dart';
import 'package:elkhlod/core/widgets/custom_button.dart';

import '../../../../../../core/utils/constants.dart';
import '../../../auth/login/domain/entities/employee_entity.dart';

// ignore: must_be_immutable
class EditBnodTaqeemViewBody extends StatefulWidget {
  const EditBnodTaqeemViewBody({super.key});

  @override
  State<EditBnodTaqeemViewBody> createState() => _EditBnodTaqeemViewBodyState();
}

class _EditBnodTaqeemViewBodyState extends State<EditBnodTaqeemViewBody> {
  var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);
  LastTaqeemEntity? lastTaqeemEntity;

  @override
  void initState() {
    _onInit();
    super.initState();
  }

  @override
  void dispose() {
    BlocProvider.of<EditTaqeemCubit>(context).close();
    super.dispose();
  }

  void _onInit() async {
    lastTaqeemEntity = BlocProvider.of<BottomNavCubit>(context).details!;
    // await BlocProvider.of<BnodTaqeemCubit>(context)
    //     .getBnodTaqeemList(argumentIds!.typeId!);
  }

  @override
  Widget build(BuildContext context) {
    List<SubmitAnswer> submitAnswerList = [];

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: SingleChildScrollView(
        child: BlocListener<EditTaqeemCubit, EditTaqeemState>(
            listener: (context, state) {
              if (state is EditTaqeemSuccessful) {
                BlocProvider.of<BottomNavCubit>(context)
                  ..updateBottomNavIndex(kLastTaqeemScreen)
                  ..getDetails(
                      EmployeeEntity(employeeId: lastTaqeemEntity!.forEmpId!));

                BlocProvider.of<BottomNavCubit>(context)
                    .navigationQueue
                    .addLast(BlocProvider.of<BottomNavCubit>(context)
                        .bottomNavIndex);
              } else if (state is EditTaqeemFailed) {
                Commons.showToast(context, message: state.message);
              }
            },
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .66,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: lastTaqeemEntity!.taqeemDetails!.length,
                    itemBuilder: (context, index) {
                      return EditeBnodTaqeemListItem(
                        ta3amemList: lastTaqeemEntity!.taqeemDetails!,
                        itemIndex: index,
                        image: index == 0
                            ? "assets/images/tiredness.png"
                            : "assets/images/business.png",
                        answer: (volue) {
                          final index = submitAnswerList.indexWhere(
                              (element) => element.bandId == volue.bandId);

                          if (index >= 0) {
                            // if (value.type == "M") {
                            // } else {
                            submitAnswerList.removeAt(index);

                            submitAnswerList.add(volue);
                            //  }
                          } else {
                            submitAnswerList.add(volue);
                          }

                          //
                          //
                          //
                          //
                          //
                        },
                      );
                    },
                  ),
                ),
                BlocBuilder<EditTaqeemCubit, EditTaqeemState>(
                  builder: (context, state) {
                    return (state is EditTaqeemLoading)
                        ? const Center(child: CircularProgressIndicator())
                        : CustomButton(
                            onTapAvailable: true,
                            buttonText: "ارسال",
                            buttonTapHandler: () async {
                              if (submitAnswerList.length !=
                                  lastTaqeemEntity!.taqeemDetails!.length) {
                                SubmitAnswer submitAnswer;
                                for (int i = 0;
                                    i < lastTaqeemEntity!.taqeemDetails!.length;
                                    i++) {
                                  submitAnswer = SubmitAnswer(
                                    bandId: int.parse(lastTaqeemEntity!
                                        .taqeemDetails![i].bandIdFk!),
                                    empDegree: int.parse(lastTaqeemEntity!
                                        .taqeemDetails![i].degree!),
                                  );
                                  final index = submitAnswerList.indexWhere(
                                      (element) =>
                                          element.bandId ==
                                          int.parse(lastTaqeemEntity!
                                              .taqeemDetails![i].bandIdFk!));
                                  if (index >= 0) {
                                    // if (value.type == "M") {
                                    // } else {
                                    // submitAnswerList.removeAt(index);

                                    // submitAnswerList.add(submitAnswer);
                                    //  }
                                  } else {
                                    submitAnswerList.add(submitAnswer);
                                  }
                                }
                              }

                              print(submitAnswerList
                                  .map((c) => c.bandId)
                                  .toList()
                                  .join(','));
                              print(submitAnswerList
                                  .map((c) => c.empDegree)
                                  .toList()
                                  .join(','));
                              if (submitAnswerList.length ==
                                  lastTaqeemEntity!.taqeemDetails!.length) {
                                BlocProvider.of<EditTaqeemCubit>(context)
                                    .editTaqeem(
                                        lastTaqeemEntity!.taqeemId!.toString(),
                                        lastTaqeemEntity!.forMonth!,
                                        "2024",
                                        submitAnswerList);
                              } else {
                                Commons.showToast(context,
                                    message: "يجب اختيار  اولا");
                              }
                            },
                            screenWidth:
                                MediaQuery.of(context).size.width * .50,
                          );
                  },
                )
              ],
            )),
      ),
    );
  }
}
