import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import 'package:elkhlod/Features/rates/data/models/bnod_taqeem_model.dart';
import 'package:elkhlod/Features/rates/data/models/submitAnswer.dart';
import 'package:elkhlod/Features/rates/presentation/cubit/add_taqeem_cubit/add_taqeem_cubit.dart';
import 'package:elkhlod/Features/rates/presentation/cubit/bnod_taqeem_cubit/bnod_taqeem_cubit.dart';
import 'package:elkhlod/Features/rates/presentation/cubit/month_cubit/month_cubit.dart';
import 'package:elkhlod/Features/rates/presentation/widgets/arguments.dart';
import 'package:elkhlod/Features/rates/presentation/widgets/bnod_taqeem_list_item.dart';
import 'package:elkhlod/Features/rates/presentation/widgets/custom_drop_down_month_list.dart';
import 'package:elkhlod/core/utils/commons.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';
import 'package:elkhlod/core/utils/gaps.dart';
import 'package:elkhlod/core/widgets/custom_button.dart';
import 'package:elkhlod/core/widgets/empty_widget.dart';

import '../../../../../../core/locale/app_localizations.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/widgets/custom_loading_widget.dart';
import '../../../../../../core/widgets/error_text.dart';
import '../../../auth/login/domain/entities/employee_entity.dart';

// ignore: must_be_immutable
class BnodTaqeemViewBody extends StatefulWidget {
  const BnodTaqeemViewBody({super.key});

  @override
  State<BnodTaqeemViewBody> createState() => _BnodTaqeemViewBodyState();
}

class _BnodTaqeemViewBodyState extends State<BnodTaqeemViewBody> {
  var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);
  ArgumentIds? argumentIds;

  @override
  void initState() {
    _onInit();
    super.initState();
  }

  @override
  void dispose() {
    BlocProvider.of<AddTaqeemCubit>(context).close();
    BlocProvider.of<BnodTaqeemCubit>(context).close();

    super.dispose();
  }

  void _onInit() async {
    argumentIds = BlocProvider.of<BottomNavCubit>(context).details!;
    await BlocProvider.of<BnodTaqeemCubit>(context)
        .getBnodTaqeemList(argumentIds!.typeId!);
  }

  @override
  Widget build(BuildContext context) {
    String? month;
    var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);
    List<SubmitAnswer> submitAnswerList = [];

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: SingleChildScrollView(
        child: BlocListener<AddTaqeemCubit, AddTaqeemState>(
          listener: (context, state) {
            if (state is AddTaqeemSuccessful) {
              BlocProvider.of<BottomNavCubit>(context)
                  .updateBottomNavIndex(kAllEmpTaqeemScreen);

              BlocProvider.of<BottomNavCubit>(context).navigationQueue.addLast(
                  BlocProvider.of<BottomNavCubit>(context).bottomNavIndex);
            } else if (state is AddTaqeemFailed) {
              Commons.showToast(context, message: state.message);
            }
          },
          child: BlocBuilder<BnodTaqeemCubit, BnodTaqeemState>(
            builder: (context, state) {
              if (state is FetchBnodSuccessful) {
                BnodTaqeemList ta3amemList = state.data!;

                return Column(
                  children: [
                    const Text("أضف تقييمك"),
                    Gaps.vGap15,
                    BlocProvider(
                      create: (context) =>
                          getIt<MonthCubit>()..getMonth(argumentIds!.id!),
                      child: CustomDropDownMonthList(
                          onTap: (value) {
                            //  debugPrint("value heeeere $value");
                            month = value;
                          },
                          hintText: "Month"),
                    ),
                    Gaps.vGap15,
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .52,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.data!.length,
                        itemBuilder: (context, index) {
                          return BnodTaqeemListItem(
                            ta3amemList: ta3amemList,
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
                    BlocBuilder<AddTaqeemCubit, AddTaqeemState>(
                      builder: (context, state) {
                        return (state is AddTaqeemLoading)
                            ? const Center(child: CircularProgressIndicator())
                            : CustomButton(
                                onTapAvailable: true,
                                buttonText: "ارسال",
                                buttonTapHandler: () async {
                                  if (month != null &&
                                      submitAnswerList.length ==
                                          ta3amemList.length) {
                                    BlocProvider.of<AddTaqeemCubit>(context)
                                        .addTaqeem(argumentIds!.id!.toString(),
                                            month!, "2024", submitAnswerList);
                                  } else {
                                    if (month == null) {
                                      Commons.showToast(context,
                                          message: "يجب اختيار الشهر اولا");
                                    } else if (submitAnswerList.length !=
                                        ta3amemList.length) {
                                      Commons.showToast(context,
                                          message: "يجب تعبئة جميع البنود");
                                    }
                                  }
                                },
                                screenWidth:
                                    MediaQuery.of(context).size.width * .50,
                              );
                      },
                    )
                  ],
                );
              } else if (state is FetchBnodLoading) {
                return const Center(
                  child: CustomLoadingWidget(
                    loadingText: "جاري تحميل البنود",
                  ),
                );
              } else if (state is FetchBnodFailed) {
                return EmptyWidget(
                  text: state.message,
                );
              } else if (box.get(kEmployeeDataBox) == null) {
                return ErrorText(
                    image: "assets/images/should_login.png",
                    text: AppLocalizations.of(context)!
                        .translate('you_should_login_first')!);
              } else {
                return const ErrorText(text: "حدث خطأ ما");
              }
            },
          ),
        ),
      ),
    );
  }
}
