import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/rates/data/models/last_taqeem_model.dart';
import 'package:elkhlod/Features/rates/presentation/cubit/my_taqeem_cubit/my_taqeem_cubit.dart';
import 'package:elkhlod/Features/rates/presentation/widgets/my_taqeem_list_item.dart';
import 'package:elkhlod/core/widgets/empty_widget.dart';

import '../../../../../../core/locale/app_localizations.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/widgets/custom_loading_widget.dart';
import '../../../../../../core/widgets/error_text.dart';
import '../../../auth/login/domain/entities/employee_entity.dart';

// ignore: must_be_immutable
class MyTaqeemViewBody extends StatefulWidget {
  const MyTaqeemViewBody({super.key});

  @override
  State<MyTaqeemViewBody> createState() => _MyTaqeemViewBodyState();
}

class _MyTaqeemViewBodyState extends State<MyTaqeemViewBody> {
  var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);

  @override
  void initState() {
    _onInit();
    super.initState();
  }

  @override
  void dispose() {
    BlocProvider.of<MyTaqeemCubit>(context).close();
    super.dispose();
  }

  void _onInit() async {
    await BlocProvider.of<MyTaqeemCubit>(context).getMyTaqeemList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: BlocBuilder<MyTaqeemCubit, MyTaqeemState>(
        builder: (context, state) {
          if (state is FetchSuccessful) {
            LastTaqeemList ta3amemList = state.data!;

            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: ta3amemList.length,
              itemBuilder: (context, index) {
                return MyTaqeemViewListItem(
                  ta3amemList: ta3amemList,
                  itemIndex: index,
                );
              },
            );
          } else if (state is FetchLoading) {
            return const Center(
              child: CustomLoadingWidget(
                loadingText: "جاري تحميل  تقييماتي ",
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
    );
  }
}
