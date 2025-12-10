import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/auth/login/domain/entities/employee_entity.dart';
import 'package:elkhlod/Features/ezen/presentation/manager/all_ezen_cubit/all_ezen_cubit.dart';
import 'package:elkhlod/Features/ezen/presentation/widgets/ezen_list_item.dart';
import 'package:elkhlod/core/locale/app_localizations.dart';
import 'package:elkhlod/core/utils/constants.dart';
import 'package:elkhlod/core/widgets/custom_app_bar.dart';

class WaredListScreen extends StatelessWidget {
  const WaredListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);
    BlocProvider.of<AllEzenCubit>(context)
        .getWaredEzen(box.get(kEmployeeDataBox)!.employeeId!);
    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: screenSize * .1, child: const CustomAppBar()),
        body: BlocBuilder<AllEzenCubit, AllEzenState>(
          builder: (context, state) {
            if (state is FetchEzenSuccessful) {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.data!.length,
                  itemBuilder: (ctx, index) {
                    return EzenListItem(
                      ezen: state.data![index],
                      status: locale.translate('work_is_underway')!,
                    );
                  });
            } else if (state is FetchEzenLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Text("No Data");
            }
          },
        ));
  }
}
