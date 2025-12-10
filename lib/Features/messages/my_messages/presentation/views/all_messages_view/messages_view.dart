import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/auth/login/domain/entities/employee_entity.dart';
import 'package:elkhlod/Features/personal_account/presentation/manager/cubit/get_profile_cubit.dart';

import '../../../../../../core/locale/app_localizations.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import '../sent_messages_view/sent_messages_view.dart';
import '../widgets/custom_toggle_app_bar.dart';
import '../widgets/messages_view_body.dart';

class MessagesView extends StatefulWidget {
  const MessagesView({super.key});

  @override
  State<MessagesView> createState() => _MessagesViewState();
}

class _MessagesViewState extends State<MessagesView> {
  var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);

  @override
  void initState() {
    _onInit();
    super.initState();
  }

  @override
  void dispose() {
    BlocProvider.of<GetProfileCubit>(context).close();
    super.dispose();
  }

  void _onInit() async {
    await BlocProvider.of<GetProfileCubit>(context)
        .getProfile(box.get(kEmployeeDataBox)!.userId!);
  }

  @override
  Widget build(BuildContext context) {
    late AppLocalizations locale;
    Size screenSize = MediaQuery.of(context).size;

    locale = AppLocalizations.of(context)!;
    return FadeInUp(
      duration: const Duration(milliseconds: 300),
      child: DefaultTabController(
        animationDuration: const Duration(milliseconds: 500),
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: screenSize * .12,
              child: CustomToggleAppBar(
                  appBarTitle: locale.translate('messages')!)),
          backgroundColor: Colors.white,
          floatingActionButton: BlocBuilder<GetProfileCubit, GetProfileState>(
            builder: (context, state) {
              if (state is GetProfileSuccessful) {
                return state.data.data.sendMsg == "yes"
                    ? MaterialButton(
                        onPressed: () {
                          BlocProvider.of<BottomNavCubit>(context)
                              .navigationQueue
                              .addLast(BlocProvider.of<BottomNavCubit>(context)
                                  .bottomNavIndex);
                          BlocProvider.of<BottomNavCubit>(context)
                              .updateBottomNavIndex(kNewMessageView);
                        },
                        color: kPrimaryColor,
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(20),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 27,
                        ),
                      )
                    : const SizedBox();
              }

              return const SizedBox();
            },
          ),
          body: SizedBox(
            child: TabBarView(
              children: <Widget>[
                MessagesViewBody(),
                const SentMessagesViewBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
