import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elkhlod/Features/Splash/presentation/manger/show_alert_cubit/show_alert_cubit.dart';
import 'package:elkhlod/Features/auth/change_password/presentation/manager/cubit/change_password_cubit.dart';
import 'package:elkhlod/Features/auth/change_password/presentation/views/change_password_view.dart';
import 'package:elkhlod/Features/auth/register/presentation/manager/cubit/register_cubit.dart';
import 'package:elkhlod/Features/auth/update_profile/presentation/manager/cubit/update_profile_cubit.dart';
import 'package:elkhlod/Features/auth/update_profile/presentation/views/update_profile_view.dart';
import 'package:elkhlod/Features/auth/update_signature/presentation/manager/cubit/update_signature_cubit.dart';
import 'package:elkhlod/Features/auth/update_signature/presentation/views/update_signature_view.dart';

import 'package:elkhlod/Features/ehsaeyat_table/presentation/manager/cubit_table_horizental/ehsaeyat_table_cubit.dart';
import 'package:elkhlod/Features/ehsaeyat_table/presentation/manager/cubit_table_vertical/ehsaeyat_table_data_cubit.dart';
import 'package:elkhlod/Features/ehsaeyat_table/presentation/screens/table_screen.dart';
import 'package:elkhlod/Features/introduction/presentation/intro_screen.dart';
import 'package:elkhlod/Features/introduction/presentation/manger/services_cubit/intro_cubit.dart';

import 'package:elkhlod/Features/messages/my_messages/presentation/manager/cubit/seen_message_cubit.dart';
import 'package:elkhlod/Features/messages/send_message/presentation/manger/send_message_cubit.dart';
import 'package:elkhlod/Features/new_bsama_add_Fingerprint/presentation/manger/new_finger_print_cubit.dart';
import 'package:elkhlod/Features/new_bsama_add_Fingerprint/presentation/views/camera_screen.dart';
import 'package:elkhlod/Features/select_file/presentation/cubit/select_file_cubit.dart';
import 'package:elkhlod/Features/visits/domain/entities/visits_entity.dart';
import 'package:elkhlod/Features/visits/presentation/manager/add_mobadarat_cubit/add_visits_cubit.dart';
import 'package:elkhlod/Features/visits/presentation/manager/all_bnod/all_bnod_cubit.dart';
import 'package:elkhlod/Features/visits/presentation/manager/all_visits/all_visits_cubit.dart';
import 'package:elkhlod/Features/visits/presentation/screens/request_visits_screen.dart';
import 'package:elkhlod/Features/visits/presentation/screens/visits_details_screen.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../Features/app_home/presentation/views/home_views.dart';
import '../../../Features/auth/login/presentation/manger/login_cubit.dart';
import '../../../Features/auth/login/presentation/views/login_view.dart';
import '../../../Features/auth/register/presentation/views/register_view.dart';
import '../../../Features/bottom_nav/presentation/views/bottom_nav.dart';
import '../../../Features/change_bank_account/presentation/views/change_bank_account_view_step2.dart';
import '../../../Features/contact_us/presentation/screens/contact_us_screen.dart';
import '../../../Features/edit_profile/presentation/screens/edit_profile_screen.dart';
import '../../../Features/employee_profile_form/presentation/screens/employee_profile_form_screen_step2.dart';
import '../../../Features/ezen/presentation/screens/add_ezen_screen.dart';
import '../../../Features/following_request/following_request_screen.dart';
import '../../../Features/language/presentation/screens/language_screen.dart';
import '../../../Features/messages/my_messages/presentation/manager/cubit/delete_message_cubit.dart';
import '../../../Features/messages/my_messages/presentation/manager/cubit/my_messages_cubit.dart';
import '../../../Features/messages/my_messages/presentation/views/all_messages_view/messages_view.dart';
import '../../../Features/messages/send_message/presentation/send_message_view.dart';
import '../../../Features/my_orders/presentation/views/my_orders_view.dart';
import '../../../Features/notification_view/presentation/notification_view.dart';
import '../../../Features/ezen/presentation/screens/status_request_ezen_screen.dart';
import '../../../Features/personal_account/presentation/views/personal_account_screen.dart';
import '../../../Features/request_dept/presentation/screens/request_dept_screen.dart';
import '../../../Features/select_file/presentation/screens/request_vacation_screen.dart';
import '../../../Features/splash/presentation/views/connection_page.dart';
import '../../../Features/splash/presentation/views/splash_view.dart';
import '../../../Features/table/presentation/screens/table_screen.dart';
import 'package:elkhlod/Features/location_vacation/presentation/manager/location_vacation_cubit/location_vacation_cubit.dart';
import 'package:elkhlod/Features/location_vacation/presentation/screens/location_vacation_screen.dart';

import '../constants.dart';


class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;

    switch (routeSettings.name) {
      case initialRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());

      case kBottomNavRoute:
        return MaterialPageRoute(
            builder: (_) => BottomNav(senderId: args as int));
      case kHomeScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<ShowAlertCubit>(),
                  child: const MyHomePage(),
                ));
      // case kBookDetailsScreen:
      //   return MaterialPageRoute(builder: (_) => const BookDetailsView());
      case kIntroScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => getIt<IntroCubit>()..getAllLwae7List(),
                  child: const IntroScreen(),
                ));
      case kLanguageScreenRoute:
        return MaterialPageRoute(builder: (_) => const LanguageScreen());
      case kRegisterScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (_) => getIt<RegisterCubit>(),
            ),
          ], child: const RegisterView()),
        );
      case kCameraScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<NewFingerPrintCubit>(),
                  child: const CameraScreen(),
                ));
      case kTapBarScreen:
        return MaterialPageRoute(builder: (_) => const StatusRequestEzen());
      // case kCurrentTapScreen:
      //   return MaterialPageRoute(builder: (_) => const CurrentTap());

      case kNotificationScreenRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => getIt<MyMessagesCubit>(),
              ),
              BlocProvider(
                create: (_) => getIt<DeleteMessageCubit>(),
              ),
            ],
            child: const NotificationView(),
          ),
        );

      case kLoginScreenRoute:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<LoginCubit>(),
              ),
            ],
            child: const LoginView(),
          ),
        );

    
      // case kAttendanceScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const HomeScreen(),
      //   );
      case kMyOrdersScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const MyOrdersView(),
        );
      case kContactUsScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const ContactUsScreen(),
        );
      case kEditProfileScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const EditProfileScreen(),
        );
      case kVacationRequestScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const RequestVacationScreen(),
        );
      case kPermissionRequestScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const AddEzenScreen(),
        );
      case kDataTableScreen:
        return MaterialPageRoute(
          builder: (_) => const DataTableView(),
        );
      case kPersonalAccountScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const PersonalAccountScreen(),
        );
      case kRequestStatusScreen:
        return MaterialPageRoute(
          builder: (_) => const StatusRequestEzen(),
        );

      case kDeptRequestScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const RequestDeptScreen(),
        );

      case kAppHomeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeViews(),
        );

      case kFollowingRequestScreen:
        return MaterialPageRoute(
          builder: (_) => const FollowingRequestScreen(),
        );

      case kMessagesScreenRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => getIt<MyMessagesCubit>(),
              ),
              BlocProvider(
                create: (_) => getIt<DeleteMessageCubit>(),
              ),
              BlocProvider(
                create: (_) => getIt<SeenMessageCubit>(),
              ),
              BlocProvider(
                create: (_) => getIt<SendMessageCubit>(),
              ),
            ],
            child: const MessagesView(),
          ),
        );
      case kNewMessageScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const SendMessageView(),
        );
      case kEmployeeProfileFormScreenStep2Route:
        return MaterialPageRoute(
          builder: (_) => const EmployeeProfileFormScreenStep2(),
        );
      case kChangeBankAccountScreenStep2Route:
        return MaterialPageRoute(
          builder: (_) => const ChangeBankAccountViewStep2(),
        );
      case kChangePasswordScreenRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<ChangePasswordCubit>(),
            child: const ChangePasswordView(),
          ),
        );

      case kUpdateProfileScreenRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => getIt<UpdateProfileCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<SelectFileCubit>(),
              ),
            ],
            child: const UpdateProfileView(),
          ),
        );

      case kUpdateSignatureScreenRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => getIt<UpdateSignatureCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<SelectFileCubit>(),
              ),
            ],
            child: const UpdateSignatureView(),
          ),
        );

      case kEhsaeyatTableScreenRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => getIt<EhsaeyatTableCubit>()..getTableData(),
              ),
              BlocProvider(
                create: (context) =>
                    getIt<EhsaeyatTableDataCubit>()..getTableData(),
              ),
            ],
            child: const EhsaeyatTableView(),
          ),
        );

      case kRequestVisitsRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<AddVisitsCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<AllBnodCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<AllVisitsCubit>(),
              ),
            ],
            child: const RequestVisitsScreen(),
          ),
        );
      case KVisitDetailsRoute:
        return MaterialPageRoute(
          builder: (_) => VisitDetailsScreen(visits: args as VisitEntity),
        );

case kLocationVacationScreenRoute:
  return MaterialPageRoute(
    builder: (_) => BlocProvider(
      create: (_) => getIt<LocationVacationCubit>(),
      child: const LocationVacationScreen(),
    ),
  );


      default:
        return null;
    }
  }
}
