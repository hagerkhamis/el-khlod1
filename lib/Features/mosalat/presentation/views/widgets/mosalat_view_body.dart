import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/mosalat/data/models/my_messages_model/mosalat.dart';
import 'package:elkhlod/Features/mosalat/presentation/manager/ta3mem_cubit/mosalat_cubit.dart';
import 'package:elkhlod/Features/mosalat/presentation/views/widgets/all_mosalat_list_item.dart';
import 'package:elkhlod/core/widgets/empty_widget.dart';

import '../../../../../../core/locale/app_localizations.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/widgets/custom_loading_widget.dart';
import '../../../../../../core/widgets/error_text.dart';
import '../../../../auth/login/domain/entities/employee_entity.dart';
import '../../../../bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';

// ignore: must_be_immutable
class MosalatViewBody extends StatefulWidget {
  const MosalatViewBody({super.key});

  @override
  State<MosalatViewBody> createState() => _MosalatViewBodyState();
}

class _MosalatViewBodyState extends State<MosalatViewBody> {
  var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);

  @override
  void initState() {
    _onInit();
    super.initState();
  }

  // @override
  // void dispose() {
  //   BlocProvider.of<MosalatCubit>(context).close();
  //   super.dispose();
  // }

  void _onInit() async {
    if (box.get(kEmployeeDataBox) != null) {
      await BlocProvider.of<MosalatCubit>(context)
          .getAllMosalat(box.get(kEmployeeDataBox)!.employeeId!, "");
    }
  }

  @override
  Widget build(BuildContext context) {
    //  getAllMessages(context);

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: SingleChildScrollView(
        child: BlocBuilder<MosalatCubit, MosalatState>(
          builder: (context, state) {
            if (state is FetchSuccessful) {
              AllMosalatList ta3amemList = state.data!;

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
                                kMosalatDetailsScreen,
                              )
                              ..getDetails(state.data![index]);
                            BlocProvider.of<BottomNavCubit>(context)
                                .navigationQueue
                                .addLast(
                                    BlocProvider.of<BottomNavCubit>(context)
                                        .bottomNavIndex);
                          },
                          child: AllMosalatListItem(
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
                  loadingText: "جاري تحميل المسائلات ",
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
