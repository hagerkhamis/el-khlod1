import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/auth/login/domain/entities/employee_entity.dart';
import 'package:elkhlod/Features/mobadarat/presentation/manager/all_mobadarat_cubit/all_mobadarat_cubit.dart';
import 'package:elkhlod/Features/mobadarat/presentation/widgets/mobadarat_list_item.dart';
import 'package:elkhlod/core/utils/constants.dart';
import 'package:elkhlod/core/widgets/empty_widget.dart';

import '../../../../../core/locale/app_localizations.dart';

class CurrentTap extends StatelessWidget {
  final String status;
  const CurrentTap({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);
    BlocProvider.of<AllMobadaratCubit>(context)
        .getAllMobadarat(box.get(kEmployeeDataBox)!.employeeId!, status);
    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    return BlocBuilder<AllMobadaratCubit, AllMobadaratState>(
      builder: (context, state) {
        if (state is FetchMobadaratSuccessful) {
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.data!.length,
              itemBuilder: (ctx, index) {
                return MobadaratListItem(
                  mobadarat: state.data![index],
                  // dotColor: Colors.amber,
                  status: locale.translate('work_is_underway')!,
                );
              });
        } else if (state is FetchMobadaratLoading) {
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
