import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/ehsaeyat/data/models/my_messages_model/ehsaeyat_model.dart';
import 'package:elkhlod/Features/ehsaeyat/presentation/manager/ehsaeyat_cubit/ehsaeyat_cubit.dart';
import 'package:elkhlod/Features/ehsaeyat/presentation/views/widgets/all_ehsaeyat_list_item.dart';
import 'package:elkhlod/core/widgets/empty_widget.dart';

import '../../../../../../core/locale/app_localizations.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/widgets/custom_loading_widget.dart';
import '../../../../../../core/widgets/error_text.dart';
import '../../../../auth/login/domain/entities/employee_entity.dart';

// ignore: must_be_immutable
class EhsaeyatViewBody extends StatefulWidget {
  const EhsaeyatViewBody({super.key});

  @override
  State<EhsaeyatViewBody> createState() => _EhsaeyatViewBodyState();
}

class _EhsaeyatViewBodyState extends State<EhsaeyatViewBody> {
  var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);

  @override
  void initState() {
    _onInit();
    super.initState();
  }

  @override
  void dispose() {
    BlocProvider.of<EhsaeyatCubit>(context).close();
    super.dispose();
  }

  void _onInit() async {
    if (box.get(kEmployeeDataBox) != null) {
      await BlocProvider.of<EhsaeyatCubit>(context)
          .getAllEhsaeyat(box.get(kEmployeeDataBox)!.employeeId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    //  getAllMessages(context);

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: SingleChildScrollView(
        child: BlocBuilder<EhsaeyatCubit, EhsaeyatState>(
          builder: (context, state) {
            if (state is FetchEhsaeyatSuccessful) {
              EhsaeyatList ta3amemList = state.data!;

              return Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .7,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.data!.length,
                      itemBuilder: (context, index) {
                        return AllEhsaeyatListItem(
                          ta3amemList: ta3amemList,
                          itemIndex: index,
                        );
                      },
                    ),
                  ),
                ],
              );
            } else if (state is FetchEhsaeyatLoading) {
              return const Center(
                child: CustomLoadingWidget(
                  loadingText: "جاري تحميل الأحصائيات ",
                ),
              );
            } else if (state is FetchEhsaeyatFailed) {
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
