import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/auth/login/domain/entities/employee_entity.dart';
import 'package:elkhlod/Features/wathaek/presentation/widgets/wathaek_list_item.dart';
import 'package:elkhlod/core/utils/constants.dart';
import 'package:elkhlod/core/widgets/empty_widget.dart';

import '../../../../../core/locale/app_localizations.dart';
import '../manager/all_wathaek_cubit/all_wathaek_cubit.dart';

class CurrentTap extends StatelessWidget {
  final String status;
  const CurrentTap({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);
    BlocProvider.of<AllWathaekCubit>(context)
        .getAllWathaek(box.get(kEmployeeDataBox)!.employeeId!, status);
    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    return BlocBuilder<AllWathaekCubit, AllWathaekState>(
      builder: (context, state) {
        if (state is FetchWathaekSuccessful) {
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.data!.length,
              itemBuilder: (ctx, index) {
                return WathaekListItem(
                  wathaek: state.data![index],
                  // dotColor: Colors.amber,
                  status: locale.translate('work_is_underway')!,
                );
              });
        } else if (state is FetchWathaekLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return EmptyWidget(
            text: locale.translate('no_data')!,
          );
        }
      },
    );
  }
}
