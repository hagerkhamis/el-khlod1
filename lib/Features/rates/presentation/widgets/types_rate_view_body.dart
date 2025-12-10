import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import 'package:elkhlod/Features/rates/data/models/types_rate_model.dart';
import 'package:elkhlod/core/utils/hex_color.dart';
import 'package:elkhlod/core/widgets/empty_widget.dart';

import '../../../../../../core/locale/app_localizations.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/widgets/custom_loading_widget.dart';
import '../../../../../../core/widgets/error_text.dart';
import '../../../auth/login/domain/entities/employee_entity.dart';
import '../cubit/types_rate_cubit/types_rate_cubit.dart';
import 'types_rate_list_item.dart';

// ignore: must_be_immutable
class TypesRateViewBody extends StatelessWidget {
  TypesRateViewBody({super.key});
  var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: SingleChildScrollView(
        child: BlocBuilder<TypesRateCubit, TypesRateState>(
          builder: (context, state) {
            if (state is FetchSuccessful) {
              AllTypesRateList typeList = state.data!;

              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<BottomNavCubit>(context)
                          .updateBottomNavIndex(kMyTaqeemScreen);
                      BlocProvider.of<BottomNavCubit>(context)
                          .navigationQueue
                          .addLast(BlocProvider.of<BottomNavCubit>(context)
                              .bottomNavIndex);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      //  width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: HexColor("F6F6F6"),
                          border: Border.all(color: HexColor("C1C1C1")),
                          boxShadow: const [
                            BoxShadow(
                                color: Color(0x29000000),
                                offset: Offset(0, 3),
                                blurRadius: 6,
                                spreadRadius: 0)
                          ]),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/tiredness.png",
                            width: 70,
                            height: 70,
                          ),
                          const Text(
                            "تقييماتي",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.data!.length,
                    itemBuilder: (context, index) {
                      return TypesRateListItem(
                        typeList: typeList,
                        itemIndex: index,
                        image: index == 0
                            ? "assets/images/tiredness.png"
                            : "assets/images/business.png",
                      );
                    },
                  ),
                ],
              );
            } else if (state is FetchLoading) {
              return const Center(
                child: CustomLoadingWidget(
                  loadingText: "جاري تحميل  ",
                ),
              );
            } else if (state is FetchFailed) {
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
    );
  }

  Future<void> getAllMessages(context) async {
    if (box.get(kEmployeeDataBox) != null) {
      await BlocProvider.of<TypesRateCubit>(context).typesRate();
    }
  }
}
