import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/lwae7/presentation/manager/lwae7_cubit/lwae7_cubit.dart';
import 'package:elkhlod/Features/lwae7/presentation/views/widgets/all_lwae7_list_item.dart';

import '../../../../../../core/locale/app_localizations.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/widgets/custom_loading_widget.dart';
import '../../../../../../core/widgets/error_text.dart';
import '../../../../auth/login/domain/entities/employee_entity.dart';
import '../../../../bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import '../../../data/models/my_messages_model/lwae7.dart';

// ignore: must_be_immutable
class Lwae7ViewBody extends StatefulWidget {
  const Lwae7ViewBody({super.key});

  @override
  State<Lwae7ViewBody> createState() => _Lwae7ViewBodyState();
}

class _Lwae7ViewBodyState extends State<Lwae7ViewBody> {
  var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);

  @override
  void initState() {
    _onInit();
    super.initState();
  }

  @override
  void dispose() {
    BlocProvider.of<Lwae7Cubit>(context).close();
    super.dispose();
  }

  void _onInit() async {
    if (box.get(kEmployeeDataBox) != null) {
      await BlocProvider.of<Lwae7Cubit>(context)
          .getAllLwae7List(box.get(kEmployeeDataBox)!.employeeId!, "");
    }
  }

  @override
  Widget build(BuildContext context) {
    //  getAllMessages(context);

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: SingleChildScrollView(
        child: BlocBuilder<Lwae7Cubit, Lwae7State>(
          builder: (context, state) {
            if (state is FetchSuccessful) {
              AllLwae7List lwae7List = state.data!;

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
                                kSeenLwae7Screen,
                              )
                              ..getDetails(state.data![index]);
                            BlocProvider.of<BottomNavCubit>(context)
                                .navigationQueue
                                .addLast(
                                    BlocProvider.of<BottomNavCubit>(context)
                                        .bottomNavIndex);
                          },
                          child: AllLwae7ListItem(
                            lwae7List: lwae7List,
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
                  loadingText: "جاري تحميل رسائل اللوائح",
                ),
              );
            } else if (state is FetchFailed) {
              return Center(child: Text(state.message));
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
