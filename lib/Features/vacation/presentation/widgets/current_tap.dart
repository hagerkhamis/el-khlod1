import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/auth/login/domain/entities/employee_entity.dart';
import 'package:elkhlod/Features/vacation/presentation/manager/all_vacation_cubit/all_vacation_cubit.dart';
import 'package:elkhlod/Features/vacation/presentation/widgets/order_list_tile.dart';
import 'package:elkhlod/core/utils/constants.dart';
import 'package:elkhlod/core/widgets/empty_widget.dart';

import '../../../../../core/locale/app_localizations.dart';

class CurrentTap extends StatelessWidget {
  final String status;
  const CurrentTap({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);
    BlocProvider.of<AllVacationCubit>(context)
        .getAllMessages(box.get(kEmployeeDataBox)!.employeeId!, status);
    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    return BlocBuilder<AllVacationCubit, AllVacationState>(
      builder: (context, state) {
        if (state is FetchSuccessful) {
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.data!.length,
              itemBuilder: (ctx, index) {
                return OrderListTile(
                  vacation: state.data![index],
                  dotColor:
                      state.data![index].haletTalab!.contains("تم الإعتماد")
                          ? Colors.green
                          : Colors.amber,
                  status: locale.translate('work_is_underway')!,
                );
              });
        } else if (state is FetchLoading) {
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
