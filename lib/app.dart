import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elkhlod/Features/app_home/presentation/manger/toggle_cubit.dart';
import 'package:elkhlod/Features/new_bsama_add_Fingerprint/presentation/manger/new_finger_print_cubit.dart';
import 'package:elkhlod/Features/personal_account/presentation/manager/cubit/get_profile_cubit.dart';
import 'package:elkhlod/core/utils/constants.dart';

import 'Features/auth/fire_base_token/presentation/manger/token_cubit.dart';
import 'Features/bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import 'Features/splash/presentation/manger/locale_cubit/locale_cubit.dart';
import 'Features/table/presentation/manager/cubit/pick_date_cubit.dart';
import 'core/locale/app_localizations_setup.dart';
import 'core/utils/functions/setup_service_locator.dart';
import 'core/utils/routes/app_routes.dart';

class FingerPrint extends StatelessWidget {
  const FingerPrint({super.key});

  @override
  Widget build(BuildContext context) {
    // final GlobalKey<NavigatorState> navigatorKey =
    //     GlobalKey(debugLabel: "Main Navigator");

    //  mNotificationSettings.registerNotification(context, navigatorKey);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<BottomNavCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<LocaleCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<TokenCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<PickDateCubit>(),
        ),
      
        BlocProvider(
          create: (_) => getIt<NewFingerPrintCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<ToggleCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<GetProfileCubit>(),
        ),
      ],
      child: BlocBuilder<LocaleCubit, LocaleState>(
        buildWhen: (previousState, currentState) =>
            previousState != currentState,
        builder: (_, localeState) {
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                // navigatorKey: navigatorKey,

                locale: localeState.locale,
                onGenerateRoute: AppRoutes.onGenerateRoute,
                supportedLocales: AppLocalizationsSetup.supportedLocales,
                localeResolutionCallback:
                    AppLocalizationsSetup.localeResolutionCallback,
                localizationsDelegates:
                    AppLocalizationsSetup.localizationsDelegates,
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                  fontFamily: "new-font",
                  textTheme: const TextTheme(
                      titleSmall: TextStyle(fontSize: 10),
                      titleMedium: TextStyle(fontSize: 12)),
                  progressIndicatorTheme:
                      ProgressIndicatorThemeData(color: kPrimaryColor),
                ),

                // ThemeData.dark().copyWith(
                //   scaffoldBackgroundColor: kPrimaryColor,
                //   textTheme:
                //       GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
                // ),
              );
            },
          );
        },
      ),
    );
  }
}
