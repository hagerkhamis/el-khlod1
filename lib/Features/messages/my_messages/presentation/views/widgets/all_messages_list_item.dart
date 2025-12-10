import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/core/utils/network/api/network_api.dart';

import '../../../../../../core/locale/app_localizations.dart';
import '../../../../../../core/utils/commons.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../auth/login/domain/entities/employee_entity.dart';
import '../../../data/models/my_messages_model/datum.dart';
import '../../manager/cubit/delete_message_cubit.dart';
import 'custom_delete_alert_dialog.dart';

class AllMessagesListItem extends StatelessWidget {
  const AllMessagesListItem({
    super.key,
    required this.messagesList,
    required this.itemIndex,
  });
  final AllMessagesList messagesList;
  final int itemIndex;
  @override
  Widget build(BuildContext context) {
    var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);
    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    return BlocListener<DeleteMessageCubit, DeleteMessageState>(
      listener: (context, state) {
        if (state is DeleteSuccessful) {
          Commons.showToast(context, message: state.data!.messageResponse);
        } else if (state is DeleteFailed) {
          Commons.showToast(context, message: state.message);
        }
      },
      child: Dismissible(
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
          {
            BlocProvider.of<DeleteMessageCubit>(context).deleteMessage(
                messagesList![itemIndex].msgId!,
                box.get(kEmployeeDataBox)!.userId!);

            // BlocListener<DeleteMessageCubit, DeleteMessageState>(
            //   listener: (context, state) {
            //     if (state is DeleteMessageInitial){
            //       Commons.showToast(context, message: "init");
            //     }
            //     if (state is DeleteSuccessful) {
            //       Commons.showToast(context,
            //           message: state.data!.messageResponse);
            //     } else if (state is DeleteFailed) {
            //       Commons.showToast(context, message: state.message);
            //     } else {
            //       Commons.showToast(context, message: "message");
            //     }
            //   },
            // );
          }
        },
        child: Column(
          children: [
            FadeInLeft(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Card(
                  shadowColor: Colors.black,
                  shape: messagesList![itemIndex].seen == "0"
                      ? RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Color.fromARGB(
                                255, 146, 146, 146), //<-- SEE HERE
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        )
                      : null,
                  color: messagesList![itemIndex].seen == "0"
                      ? const Color.fromARGB(255, 245, 241, 241)
                      : Colors.white,
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
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          messagesList![itemIndex].msgDate!,
                          style: const TextStyle(fontSize: 12),
                        ),
                        Text(
                          messagesList![itemIndex].msgTime!,
                          style: const TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                    leading: CircleAvatar(
                      radius: 25,
                      // maxRadius: 25,
                      //minRadius: 25,
                      onBackgroundImageError: (exception, stackTrace) {},
                      backgroundColor: kPrimaryColor.withOpacity(.4),
                      backgroundImage: CachedNetworkImageProvider(
                        NewApi.imageBaseUrl +
                            (messagesList![itemIndex].fromEmpImg!),
                      ),

                      // NetworkImage(
                      //   AppConstant.imageBaseUrl +
                      //       "csc" +
                      //       (messagesList![itemIndex].fromEmpImg!),
                      // ),
                      // child: CachedNetworkImage(
                      //   progressIndicatorBuilder: (context, url, progress) =>
                      //       Center(
                      //     child: CircularProgressIndicator(
                      //         value: progress.progress, color: kPrimaryColor),
                      //   ),
                      //   width: MediaQuery.of(context).size.width * .15,
                      //   fit: BoxFit.fill,
                      //   imageUrl: AppConstant.imageBaseUrl +
                      //       (messagesList![itemIndex].fromEmpImg!),
                      //   errorWidget: (context, url, error) =>
                      //       const Icon(Icons.error),
                      // ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
