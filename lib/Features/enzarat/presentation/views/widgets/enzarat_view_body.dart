import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/enzarat/presentation/views/widgets/all_enzarart_list_item.dart';
import 'package:elkhlod/core/widgets/empty_widget.dart';

import '../../../../../../core/locale/app_localizations.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/widgets/custom_loading_widget.dart';
import '../../../../../../core/widgets/error_text.dart';
import '../../../../auth/login/domain/entities/employee_entity.dart';
import '../../../../bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import '../../../data/models/enzarat_model/enzarat.dart';
import '../../manager/enzarat_cubit/enzarat_cubit.dart';

// ignore: must_be_immutable
class EnzaratViewBody extends StatefulWidget {
  const EnzaratViewBody({super.key});

  @override
  State<EnzaratViewBody> createState() => _EnzaratViewBodyState();
}

class _EnzaratViewBodyState extends State<EnzaratViewBody> {
  var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);

  @override
  void initState() {
    _onInit();
    super.initState();
  }

  @override
  void dispose() {
    BlocProvider.of<EnzaratCubit>(context).close();
    super.dispose();
  }

  void _onInit() async {
    await BlocProvider.of<EnzaratCubit>(context)
        .getAllEnzarat(box.get(kEmployeeDataBox)!.employeeId!, "");
  }

  @override
  Widget build(BuildContext context) {
    var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);

    // getAllMessages(context);

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: SingleChildScrollView(
        child: BlocBuilder<EnzaratCubit, EnzaratState>(
          builder: (context, state) {
            if (state is FetchSuccessful) {
              AllEnzaratList enzaratList = state.data;

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
                                kEnzaratDetailsScreen,
                              )
                              ..getDetails(state.data![index]);

                            BlocProvider.of<BottomNavCubit>(context)
                                .navigationQueue
                                .addLast(
                                    BlocProvider.of<BottomNavCubit>(context)
                                        .bottomNavIndex);
                          },
                          child: AllEnzarartListItem(
                            enzaratList: enzaratList,
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
                  loadingText: "جاري تحميل رسائل الإنذارات",
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
