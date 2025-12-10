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
import '../../../data/models/sent_messages_model/datum.dart';
import '../../manager/cubit/sent_messages_cubit.dart';
import '../widgets/sent_messages_list_item.dart';

class SentMessagesViewBody extends StatelessWidget {
  const SentMessagesViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);
    getMessages(context);
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: BlocBuilder<SentMessagesCubit, SentMessagesState>(
        builder: (context, state) {
          if (state is SentMessagesSuccessful) {
            SentMessagesList sentMessagesList = state.data!;
            return RefreshIndicator(
              onRefresh: () {
                return getMessages(context);
              },
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
                             BlocProvider.of<BottomNavCubit>(context)
                                .navigationQueue
                                .addLast(
                                    BlocProvider.of<BottomNavCubit>(context)
                                        .bottomNavIndex);
                    },
                    child: SentMessagesListItem(
                      messagesList: sentMessagesList,
                      itemIndex: index,
                    ),
                  );
                },
              ),
            );
          } else if (state is SentMessagesLoading) {
            return const CustomLoadingWidget(
              loadingText: "جاري تحميل الرسائل",
            );
          } else if (state is SentMessagesFailed) {
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

  Future<void> getMessages(context) async {
    var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);

    if (box.get(kEmployeeDataBox) != null) {
      await BlocProvider.of<SentMessagesCubit>(context)
          .getSentMessages(box.get(kEmployeeDataBox)!.userId!);
    }
  }
}
