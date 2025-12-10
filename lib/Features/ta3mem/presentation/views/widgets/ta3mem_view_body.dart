import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/ta3mem/presentation/manager/ta3mem_cubit/ta3mem_cubit.dart';
import 'package:elkhlod/core/widgets/empty_widget.dart';

import '../../../../../../core/locale/app_localizations.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/widgets/custom_loading_widget.dart';
import '../../../../../../core/widgets/error_text.dart';
import '../../../../auth/login/domain/entities/employee_entity.dart';
import '../../../../bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import '../../../data/models/my_messages_model/ta3mem.dart';
import 'all_ta3mem_list_item.dart';

// ignore: must_be_immutable
class Ta3memViewBody extends StatefulWidget {
  const Ta3memViewBody({super.key});

  @override
  State<Ta3memViewBody> createState() => _Ta3memViewBodyState();
}

class _Ta3memViewBodyState extends State<Ta3memViewBody> {
  var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);

  @override
  void initState() {
    _onInit();
    super.initState();
  }

  @override
  void dispose() {
    BlocProvider.of<Ta3memCubit>(context).close();
    super.dispose();
  }

  void _onInit() async {
    if (box.get(kEmployeeDataBox) != null) {
      await BlocProvider.of<Ta3memCubit>(context)
          .getAllTa3mem(box.get(kEmployeeDataBox)!.employeeId!, "");
    }
  }

  @override
  Widget build(BuildContext context) {
    //  getAllMessages(context);

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: SingleChildScrollView(
        child: BlocBuilder<Ta3memCubit, Ta3memState>(
          builder: (context, state) {
            if (state is FetchSuccessful) {
              AllTa3memList ta3amemList = state.data!;

              return Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .7,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.data!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            BlocProvider.of<BottomNavCubit>(context)
                              ..updateBottomNavIndex(
                                kTa3memDetailsScreen,
                              )
                              ..getDetails(state.data![index]);
                            BlocProvider.of<BottomNavCubit>(context)
                                .navigationQueue
                                .addLast(
                                    BlocProvider.of<BottomNavCubit>(context)
                                        .bottomNavIndex);
                          },
                          child: AllTa3memListItem(
                            ta3amemList: ta3amemList,
                            itemIndex: index,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else if (state is FetchLoading) {
              return const Center(
                child: CustomLoadingWidget(
                  loadingText: "جاري تحميل رسائل التعاميم",
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
}
