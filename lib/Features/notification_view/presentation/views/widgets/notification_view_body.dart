import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/notification_view/presentation/manager/all_talabat_cubit/all_notification_cubit.dart';
import 'package:elkhlod/core/utils/gaps.dart';
import 'package:elkhlod/core/widgets/custom_simple_app_bar.dart';
import 'package:elkhlod/core/widgets/empty_widget.dart';

import '../../../../../core/locale/app_localizations.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/media_query_sizes.dart';
import '../../../../../core/widgets/custom_loading_widget.dart';
import '../../../../../core/widgets/error_text.dart';
import '../../../../auth/login/domain/entities/employee_entity.dart';
import '../../../../bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import '../../../data/models/all_notification_model.dart';

class NotificationViewBody extends StatefulWidget {
  const NotificationViewBody({super.key});

  @override
  State<NotificationViewBody> createState() => _NotificationViewBodyState();
}

class _NotificationViewBodyState extends State<NotificationViewBody> {
  var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AllNotificationCubit>(context)
        .getAllNotification(box.get(kEmployeeDataBox)!.employeeId!);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);

    return SingleChildScrollView(
      child: Column(
        children: [
          // CustomAppBar(
          //   icon: const Icon(Icons.arrow_forward),
          //   function: () {
          //     Navigator.pop(context);
          //   },
          // ),
          CustomSimpleAppBar(
            backHandler: () {
              BlocProvider.of<BottomNavCubit>(context).updateBottomNavIndex(4);
            },
            appBarTitle: "اشعارات",
          ),
          BlocBuilder<AllNotificationCubit, AllNotificationState>(
            builder: (context, state) {
              if (state is FetchSuccessful) {
                NotificationTList messagesList = state.data!;

                return Column(
                  children: [
                    // Gaps.vGap30,
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: state.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 4,
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(16),
                              leading: CircleAvatar(
                                radius: 24,
                                backgroundColor: messagesList[index].seen == "1"
                                    ? Colors.grey[300]
                                    : Colors.blue,
                                child: Icon(
                                  Icons.person,
                                  color: messagesList[index].seen == "1"
                                      ? Colors.grey[700]
                                      : Colors.white,
                                ),
                              ),
                              title: Text(
                                messagesList[index].title!,
                                style: TextStyle(
                                  fontWeight: messagesList[index].seen == "1"
                                      ? FontWeight.normal
                                      : FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "من: ${messagesList[index].fromEmpName}"),
                                  const SizedBox(height: 4),
                                  Text(
                                      "${messagesList[index].dateAr} • ${messagesList[index].timeAr}"),
                                ],
                              ),
                              trailing: messagesList[index].seen == "1"
                                  ? const Icon(Icons.check, color: Colors.green)
                                  : const Icon(Icons.fiber_new,
                                      color: Colors.red),
                            ),
                          );
                        },
                      ),
                    ),

                    Gaps.vGap20
                  ],
                );
              } else if (state is FetchLoading) {
                return const Center(
                  child: CustomLoadingWidget(
                    loadingText: "جاري تحميل الاشعارات",
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
          )
        ],
      ),
    );
  }
}
