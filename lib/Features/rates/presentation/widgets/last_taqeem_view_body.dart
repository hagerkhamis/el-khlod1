import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import 'package:elkhlod/Features/rates/data/models/last_taqeem_model.dart';
import 'package:elkhlod/Features/rates/presentation/widgets/last_taqeem_list_item.dart';
import 'package:elkhlod/core/widgets/empty_widget.dart';

import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/widgets/custom_loading_widget.dart';
import '../../../../../../core/widgets/error_text.dart';
import '../../../auth/login/domain/entities/employee_entity.dart';
import '../cubit/last_taqeem_cubit/last_taqeem_cubit.dart';

// ignore: must_be_immutable
class LastTaqeemViewBody extends StatefulWidget {
  const LastTaqeemViewBody({super.key});

  @override
  State<LastTaqeemViewBody> createState() => _LastTaqeemViewBodyState();
}

class _LastTaqeemViewBodyState extends State<LastTaqeemViewBody> {
  var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);
  EmployeeEntity? employee;

  @override
  void initState() {
    _onInit();
    super.initState();
  }

  @override
  void dispose() {
    BlocProvider.of<LastTaqeemCubit>(context).close();
    super.dispose();
  }

  void _onInit() async {
    employee = BlocProvider.of<BottomNavCubit>(context).details!;
    await BlocProvider.of<LastTaqeemCubit>(context).getLastTaqeemList(
        box.get(kEmployeeDataBox)!.employeeId!, employee!.employeeId!);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: BlocBuilder<LastTaqeemCubit, LastTaqeemState>(
        builder: (context, state) {
          if (state is LastFetchLoading) {
            return const Center(
              child: CustomLoadingWidget(
                loadingText: "جاري تحميل التقييمات السابقة ",
              ),
            );
          } else if (state is LastFetchSuccessful) {
            LastTaqeemList ta3amemList = state.data!;

            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: ta3amemList.length,
              itemBuilder: (context, index) {
                return LastTaqeemListItem(
                  ta3amemList: ta3amemList,
                  itemIndex: index,
                );
              },
            );
          } else if (state is LastFetchFailed) {
            return EmptyWidget(
              text: state.message,
            );
          }
          //  else if (box.get(kEmployeeDataBox) == null) {
          //   return ErrorText(
          //       image: "assets/images/should_login.png",
          //       text: AppLocalizations.of(context)!
          //           .translate('you_should_login_first')!);
          // }
          return const ErrorText(text: "حدث خطأ ما");
        },
      ),
    );
  }
}
