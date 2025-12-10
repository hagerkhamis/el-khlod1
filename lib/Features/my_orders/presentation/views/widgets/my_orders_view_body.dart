import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elkhlod/Features/app_home/presentation/manger/services_cubit/services_cubit.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../core/locale/app_localizations.dart';
import 'my_orders_grid_view.dart';

class MyOrdersViewBody extends StatelessWidget {
  const MyOrdersViewBody({
    super.key,
    required this.locale,
  });

  final AppLocalizations locale;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Text(locale.translate('my_orders')!,
              style: const TextStyle(
                color: Color(0xff000000),
                fontSize: 20,
                fontWeight: FontWeight.w400,
              )),
          ZoomIn(
              duration: const Duration(seconds: 1),
              child: BlocProvider(
                create: (context) =>
                    getIt<ServicesCubit>()..getAllServicesList(),
                child: const MyOrdersGridView(),
              )),
        ],
      ),
    );
  }
}
