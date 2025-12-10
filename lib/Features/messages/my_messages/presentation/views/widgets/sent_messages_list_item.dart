import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../../../../core/locale/app_localizations.dart';
import '../../../../../../core/utils/commons.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../auth/login/domain/entities/employee_entity.dart';
import '../../../data/models/sent_messages_model/datum.dart';
import '../../manager/cubit/delete_message_cubit.dart';
import 'custom_delete_alert_dialog.dart';

class SentMessagesListItem extends StatelessWidget {
  const SentMessagesListItem({
    super.key,
    required this.messagesList,
    required this.itemIndex,
  });
  final SentMessagesList messagesList;
  final int itemIndex;
  @override
  Widget build(BuildContext context) {
    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.startToEnd,
      background: Container(
        padding: const EdgeInsets.only(left: 50, right: 50),
        alignment:
            locale.isEnLocale ? Alignment.centerLeft : Alignment.centerRight,
        color: const Color(0xffbb0202),
        child: const Icon(
          Icons.delete_outline_rounded,
          size: 30,
          color: Colors.white,
        ),
      ),
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) {
            return const CustomDeleteDialog();
          },
        );
      },
      onDismissed: (direction) async {
        var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);
        await BlocProvider.of<DeleteMessageCubit>(context).deleteMessage(
            messagesList![itemIndex].msgId!,
            box.get(kEmployeeDataBox)!.userId!);
        BlocListener<DeleteMessageCubit, DeleteMessageState>(
          listener: (context, state) {
            if (state is DeleteSuccessful) {
              Commons.showToast(context, message: state.data!.messageResponse);
            } else if (state is DeleteFailed) {
              Commons.showToast(context, message: state.message);
            } else {
              Commons.showToast(context, message: "message");
            }
          },
        );
      },
      child: Column(
        children: [
          FadeInLeft(
            child: Card(
              child: ListTile(
                subtitle: Text(
                  messagesList![itemIndex].message.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 10),
                ),
                title: Text(
                  messagesList![itemIndex].subject.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12),
                ),
                trailing: const Text(
                  "03:00 PM",
                  style: TextStyle(fontSize: 12),
                ),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: CachedNetworkImage(
                    progressIndicatorBuilder: (context, url, progress) =>
                        Center(
                      child: CircularProgressIndicator(
                          value: progress.progress, color: kPrimaryColor),
                    ),
                    width: MediaQuery.of(context).size.width * .15,
                    fit: BoxFit.fill,
                    imageUrl: NewApi.imageBaseUrl +
                        (messagesList![itemIndex].fromEmpPersonalPhoto ?? ""),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
