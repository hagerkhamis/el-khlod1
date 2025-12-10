import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/core/widgets/empty_widget.dart';

import '../../../../../../core/locale/app_localizations.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/widgets/custom_loading_widget.dart';
import '../../../../../../core/widgets/error_text.dart';
import '../../../../../auth/login/domain/entities/employee_entity.dart';
import '../../../../../bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import '../../../data/models/my_messages_model/datum.dart';
import '../../manager/cubit/my_messages_cubit.dart';
import '../../manager/cubit/seen_message_cubit.dart';
import 'all_messages_list_item.dart';
import 'messages_filter_widget.dart';

// ignore: must_be_immutable
class MessagesViewBody extends StatelessWidget {
  MessagesViewBody({super.key});
  var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);

  @override
  Widget build(BuildContext context) {
    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);

    getAllMessages(context);

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: SingleChildScrollView(
        child: Column(children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: BlocBuilder<MyMessagesCubit, MyMessagesState>(
              builder: (context, state) {
                return state is FetchLoading
                    ? Text(locale.translate("loading")!)
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          BlocBuilder<MyMessagesCubit, MyMessagesState>(
                            builder: (context, state) {
                              return MessagesFilterWidget(
                                  filterName: locale.translate("all")!,
                                  filterTapHandler: () {
                                    getAllMessages(context);
                                  });
                            },
                          ),
                          MessagesFilterWidget(
                              filterName: locale.translate("seen")!,
                              filterTapHandler: () {
                                getSeenMessages(context);
                              }),
                          MessagesFilterWidget(
                              filterName: locale.translate("not_seen")!,
                              filterTapHandler: () {
                                getNotSeenMessages(context);
                              }),
                        ],
                      );
              },
            ),
          ),
          BlocBuilder<MyMessagesCubit, MyMessagesState>(
            builder: (context, state) {
              if (state is FetchSuccessful) {
                AllMessagesList messagesList = state.data!;

                return Column(
                  children: [
                    RefreshIndicator(
                      onRefresh: () {
                        return getAllMessages(context);
                      },
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * .7,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: state.data!.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                BlocProvider.of<BottomNavCubit>(context)
                                  ..updateBottomNavIndex(
                                    kMessagesDetailsView,
                                  )
                                  ..getMessageId(state.data![index].msgId!);
                                BlocProvider.of<SeenMessageCubit>(context)
                                    .setAsSeen(state.data![index].msgId!,
                                        box.get(kEmployeeDataBox)!.userId!);
                                BlocProvider.of<BottomNavCubit>(context)
                                    .navigationQueue
                                    .addLast(
                                        BlocProvider.of<BottomNavCubit>(context)
                                            .bottomNavIndex);

                                Navigator.pushNamed(
                                    context, kMessageDetailsViewRoute);
                              },
                              child: AllMessagesListItem(
                                messagesList: messagesList,
                                itemIndex: index,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              } else if (state is FetchLoading) {
                return const Center(
                  child: CustomLoadingWidget(
                    loadingText: "جاري تحميل الرسائل",
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
        ]),
      ),
    );
  }

  Future<void> getAllMessages(context) async {
    if (box.get(kEmployeeDataBox) != null) {
      await BlocProvider.of<MyMessagesCubit>(context)
          .getAllMessages(box.get(kEmployeeDataBox)!.userId!, "");
    }
  }

  Future<void> getSeenMessages(context) async {
    if (box.get(kEmployeeDataBox) != null) {
      await BlocProvider.of<MyMessagesCubit>(context)
          .getAllMessages(box.get(kEmployeeDataBox)!.userId!, "1");
    }
  }

  Future<void> getNotSeenMessages(context) async {
    if (box.get(kEmployeeDataBox) != null) {
      await BlocProvider.of<MyMessagesCubit>(context)
          .getAllMessages(box.get(kEmployeeDataBox)!.userId!, "0");
    }
  }
}
