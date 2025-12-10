import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/auth/login/domain/entities/employee_entity.dart';
import 'package:elkhlod/Features/visits/presentation/manager/all_visits/all_visits_cubit.dart';
import 'package:elkhlod/Features/visits/presentation/widgets/visits_list_item.dart';
import 'package:elkhlod/core/utils/constants.dart';
import 'package:elkhlod/core/widgets/empty_widget.dart';

import '../../../../../core/locale/app_localizations.dart';

class CurrentTap extends StatefulWidget {
  const CurrentTap({super.key});

  @override
  State<CurrentTap> createState() => _CurrentTapState();
}

class _CurrentTapState extends State<CurrentTap> {
  var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);

  @override
  void initState() {
    _onInit();
    super.initState();
  }

  // @override
  // void dispose() {
  //   BlocProvider.of<AllVisitsCubit>(context).close();
  //   super.dispose();
  // }

  void _onInit() async {
    await BlocProvider.of<AllVisitsCubit>(context)
        .fetchAllVisits(box.get(kEmployeeDataBox)!.employeeId!, '1');
  }

  @override
  Widget build(BuildContext context) {
    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    return BlocBuilder<AllVisitsCubit, AllVisitsState>(
      builder: (context, state) {
        if (state is AllVisitsFetchSuccess) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: state.data!.length,
              padding: const EdgeInsets.only(bottom: 100),
              itemBuilder: (ctx, index) {
                return VisitsListItem(
                  visits: state.data![index],
                  // dotColor: Colors.amber,
                  status: locale.translate('work_is_underway')!,
                );
              });
        } else if (state is FetchVisitsLoading) {
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
