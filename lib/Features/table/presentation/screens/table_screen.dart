import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import '../widget/table_view_body.dart';
import '../../../../core/locale/app_localizations.dart';
import '../../../../core/widgets/custom_simple_app_bar.dart';
import 'package:flutter/material.dart';

class DataTableView extends StatelessWidget {
  const DataTableView({super.key});

  @override
  Widget build(BuildContext context) {
    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: screenSize * .07,
          child: CustomSimpleAppBar(
            backHandler: () {
              BlocProvider.of<BottomNavCubit>(context).updateBottomNavIndex(4);
            },
            appBarTitle: locale.translate('attendance_and_leaving')!,
            // leadingWidget: const TablePageAppBarActions(),
          ),
        ),
        body: FadeIn(
          child: const TableViewBody(),
        ),
      ),
    );
  }
}
