import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elkhlod/Features/add_location/presentation/manager/add_location/add_location_cubit.dart';
import 'package:elkhlod/Features/add_location/presentation/manager/delete_locations_cubit/delete_locations_cubit.dart';
import 'package:elkhlod/Features/add_location/presentation/manager/locations_cubit/locations_cubit.dart';
import 'package:elkhlod/Features/add_location/presentation/manager/sites_types/sites_type_cubit.dart';
import 'package:elkhlod/Features/add_location/presentation/views/screens/add_location.dart';
import 'package:elkhlod/Features/add_location/presentation/views/screens/locations_details_view.dart';
import 'package:elkhlod/Features/add_location/presentation/views/screens/locations_view.dart';
import 'package:elkhlod/Features/add_location/presentation/views/screens/select_sites.dart';
import 'package:elkhlod/Features/add_maham_aml/presentation/views/screens/select_maham_sites.dart';
import 'package:elkhlod/Features/app_home/presentation/manger/ads_cubit/ads_cubit.dart';
import 'package:elkhlod/Features/app_home/presentation/manger/finger_print_cubit.dart';
import 'package:elkhlod/Features/app_home/presentation/manger/ntaq_cubit/ntaq_cubit.dart';
import 'package:elkhlod/Features/calender/presentation/manager/cubit/calender_table_cubit.dart';
import 'package:elkhlod/Features/calender/presentation/views/calender.dart';
import 'package:elkhlod/Features/ehsaeyat/presentation/manager/ehsaeyat_cubit/ehsaeyat_cubit.dart';
import 'package:elkhlod/Features/ehsaeyat/presentation/views/screens/ehsaeyat_view.dart';
import 'package:elkhlod/Features/enzarat/presentation/manager/enzarat_cubit/enzarat_cubit.dart';
import 'package:elkhlod/Features/enzarat/presentation/manager/seen_cubit/seen_enzarat_cubit.dart';
import 'package:elkhlod/Features/enzarat/presentation/views/screens/enzarat_details_view.dart';
import 'package:elkhlod/Features/enzarat/presentation/views/screens/enzarat_view.dart';
import 'package:elkhlod/Features/location_vacation/presentation/manager/location_vacation_cubit/location_vacation_cubit.dart';
import 'package:elkhlod/Features/location_vacation/presentation/screens/location_vacation_screen.dart';
import 'package:elkhlod/Features/lwae7/presentation/manager/lwae7_cubit/lwae7_cubit.dart';
import 'package:elkhlod/Features/lwae7/presentation/manager/seen_cubit/seen_lwae7_cubit.dart';
import 'package:elkhlod/Features/lwae7/presentation/views/screens/lwae7_details_view.dart';
import 'package:elkhlod/Features/lwae7/presentation/views/screens/lwae7_view.dart';
import 'package:elkhlod/Features/messages/employees/presentation/manager/cubit/employees_cubit.dart';
import 'package:elkhlod/Features/messages/my_messages/presentation/manager/cubit/delete_message_cubit.dart';
import 'package:elkhlod/Features/messages/my_messages/presentation/manager/cubit/message_details_cubit.dart';
import 'package:elkhlod/Features/messages/my_messages/presentation/manager/cubit/seen_message_cubit.dart';
import 'package:elkhlod/Features/messages/my_messages/presentation/manager/cubit/sent_messages_cubit.dart';
import 'package:elkhlod/Features/messages/my_messages/presentation/views/message_details_view/message_details_view.dart';
import 'package:elkhlod/Features/mobadarat/presentation/manager/add_mobadarat_cubit/add_mobadarat_cubit.dart';
import 'package:elkhlod/Features/mobadarat/presentation/manager/all_mobadarat_cubit/all_mobadarat_cubit.dart';
import 'package:elkhlod/Features/mobadarat/presentation/manager/delete_mobadarat_cubit/delete_mobadarat_cubit.dart';
import 'package:elkhlod/Features/mobadarat/presentation/screens/mobadra_details_screen.dart';
import 'package:elkhlod/Features/mobadarat/presentation/screens/request_mobadarat_screen.dart';
import 'package:elkhlod/Features/mosalat/presentation/manager/seen_cubit/add_mosalat_cubit.dart';
import 'package:elkhlod/Features/mosalat/presentation/manager/select_file/presentation/cubit/select_file_mosalat_cubit.dart';
import 'package:elkhlod/Features/mosalat/presentation/manager/ta3mem_cubit/mosalat_cubit.dart';
import 'package:elkhlod/Features/mosalat/presentation/views/screens/mosalat_details_view.dart';
import 'package:elkhlod/Features/mosalat/presentation/views/screens/mosalat_view.dart';
import 'package:elkhlod/Features/my_orders/presentation/views/my_orders_view.dart';
import 'package:elkhlod/Features/new_bsama_add_Fingerprint/presentation/manger/new_finger_print_cubit.dart';
import 'package:elkhlod/Features/ezen/presentation/manager/add_ezen_cubit/add_ezen_cubit.dart';
import 'package:elkhlod/Features/ezen/presentation/manager/all_ezen_cubit/all_ezen_cubit.dart';
import 'package:elkhlod/Features/ezen/presentation/manager/delete_ezen_cubit/delete_ezen_cubit.dart';
import 'package:elkhlod/Features/ezen/presentation/manager/egraa_ezen_cubit/egraa_ezen_cubit.dart';
import 'package:elkhlod/Features/ezen/presentation/screens/edite_ezen_screen.dart';
import 'package:elkhlod/Features/ezen/presentation/screens/ezen_details_screen.dart';
import 'package:elkhlod/Features/ezen/presentation/screens/add_ezen_screen.dart';
import 'package:elkhlod/Features/ezen/presentation/screens/wared_list_screen.dart';
import 'package:elkhlod/Features/notification_view/presentation/manager/all_talabat_cubit/all_notification_cubit.dart';
import 'package:elkhlod/Features/permission_edara/presentation/manager/add_talabat_cubit/add_talabt_cubit.dart';
import 'package:elkhlod/Features/permission_edara/presentation/manager/all_talabat_cubit/all_talabat_cubit.dart';
import 'package:elkhlod/Features/permission_edara/presentation/manager/delete_ezen_cubit/delete_talabat_cubit.dart';
import 'package:elkhlod/Features/permission_edara/presentation/screens/permission_edra_details_screen.dart';
import 'package:elkhlod/Features/permission_edara/presentation/screens/request_permission_edara_screen.dart';
import 'package:elkhlod/Features/permission_edara/presentation/screens/status_request_screen.dart';
import 'package:elkhlod/Features/personal_account/presentation/manager/cubit/get_profile_cubit.dart';
import 'package:elkhlod/Features/personal_account/presentation/views/profile_screen.dart';
import 'package:elkhlod/Features/privacy_and_policy/presentation/manager/cubit/privacy_and_policy_cubit.dart';
import 'package:elkhlod/Features/privacy_and_policy/presentation/privacy_and_policy_view.dart';
import 'package:elkhlod/Features/rates/presentation/cubit/add_taqeem_cubit/add_taqeem_cubit.dart';
import 'package:elkhlod/Features/rates/presentation/cubit/all_emp_taqeem_cubit/all_emp_taqeem_cubit.dart';
import 'package:elkhlod/Features/rates/presentation/cubit/bnod_taqeem_cubit/bnod_taqeem_cubit.dart';
import 'package:elkhlod/Features/rates/presentation/cubit/delete_taqeem_cubit/delete_taqeem_cubit.dart';
import 'package:elkhlod/Features/rates/presentation/cubit/edit_taqeem_cubit/edit_taqeem_cubit.dart';
import 'package:elkhlod/Features/rates/presentation/cubit/last_taqeem_cubit/last_taqeem_cubit.dart';
import 'package:elkhlod/Features/rates/presentation/cubit/month_cubit/month_cubit.dart';
import 'package:elkhlod/Features/rates/presentation/cubit/my_taqeem_cubit/my_taqeem_cubit.dart';
import 'package:elkhlod/Features/rates/presentation/pages/bnod_taqeem_view.dart';
import 'package:elkhlod/Features/rates/presentation/pages/edit_bnod_taqeem_view.dart';
import 'package:elkhlod/Features/rates/presentation/pages/last_taqeem_view.dart';
import 'package:elkhlod/Features/rates/presentation/pages/my_taqeem_view.dart';
import 'package:elkhlod/Features/rates/presentation/pages/types_rate_view.dart';
import 'package:elkhlod/Features/select_file/presentation/cubit/select_file_cubit.dart';
import 'package:elkhlod/Features/ta3mem/presentation/manager/seen_cubit/seen_ta3mem_cubit.dart';
import 'package:elkhlod/Features/ta3mem/presentation/manager/ta3mem_cubit/ta3mem_cubit.dart';
import 'package:elkhlod/Features/ta3mem/presentation/views/screens/t3mem_details_view.dart';
import 'package:elkhlod/Features/ta3mem/presentation/views/screens/ta3mem_view.dart';
import 'package:elkhlod/Features/table_location/presentation/screens/table_screen.dart';
import 'package:elkhlod/Features/table_mohm_aml/presentation/manager/cubit/maham_table_cubit.dart';
import 'package:elkhlod/Features/table_mohm_aml/presentation/screens/table_screen.dart';
import 'package:elkhlod/Features/vacation/presentation/manager/add_vacation_cubit/add_vacation_cubit.dart';
import 'package:elkhlod/Features/vacation/presentation/manager/all_vacation_cubit/all_vacation_cubit.dart';
import 'package:elkhlod/Features/vacation/presentation/manager/delete_vacation_cubit/delete_vacation_cubit.dart';
import 'package:elkhlod/Features/vacation/presentation/manager/select_file/presentation/cubit/select_file_vacation_cubit.dart';
import 'package:elkhlod/Features/vacation/presentation/screens/edite_vacation_screen.dart';
import 'package:elkhlod/Features/vacation/presentation/screens/order_vacation_details_screen.dart';
import 'package:elkhlod/Features/vacation/presentation/screens/request_vacation_screen.dart';
import 'package:elkhlod/Features/vacation/presentation/screens/status_request_vacation_screen.dart';
import 'package:elkhlod/Features/visits/presentation/manager/all_visits/all_visits_cubit.dart';
import 'package:elkhlod/Features/visits/presentation/screens/status_request_visits_screen.dart';
import 'package:elkhlod/Features/wathaek/presentation/manager/select_multi_files/select_multi_file_cubit.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../about_app/presentation/about_app_view.dart';
import '../../../../about_app/presentation/manager/cubit/about_app_cubit.dart';
import '../../../../add_maham_aml/presentation/manager/add_location/add_mohema_cubit.dart';
import '../../../../add_maham_aml/presentation/views/screens/add_mohema.dart';
import '../../../../app_home/presentation/manger/toggle_cubit.dart';
import '../../../../app_home/presentation/views/home_views.dart';
import '../../../../change_bank_account/presentation/views/change_bank_account_view_step1.dart';
import '../../../../change_bank_account/presentation/views/change_bank_account_view_step2.dart';
import '../../../../contact_us/presentation/screens/contact_us_screen.dart';
import '../../../../edit_profile/presentation/screens/edit_profile_screen.dart';
import '../../../../employee_profile_form/presentation/screens/employee_profile_form_screen_step1.dart';
import '../../../../employee_profile_form/presentation/screens/employee_profile_form_screen_step2.dart';
import '../../../../following_request/following_request_screen.dart';
import '../../../../maham/presentation/manager/add_maham_cubit/add_maham_cubit.dart';
import '../../../../maham/presentation/manager/all_maham_cubit/all_maham_cubit.dart';
import '../../../../maham/presentation/manager/delete_maham_cubit/delete_maham_cubit.dart';
import '../../../../maham/presentation/screens/maham_details_screen.dart';
import '../../../../maham/presentation/screens/request_maham_screen.dart';
import '../../../../maham/presentation/screens/status_request_maham_screen.dart';
import '../../../../messages/my_messages/presentation/manager/cubit/my_messages_cubit.dart';
import '../../../../messages/my_messages/presentation/views/all_messages_view/messages_view.dart';
import '../../../../messages/send_message/presentation/manger/send_message_cubit.dart';
import '../../../../messages/send_message/presentation/send_message_view.dart';
import '../../../../mobadarat/presentation/screens/status_request_mobadarat_screen.dart';
import '../../../../notification_view/presentation/notification_view.dart';
import '../../../../payment_permission/presentation/screens/payment_permission_screen.dart';
import '../../../../ezen/presentation/screens/status_request_ezen_screen.dart';
import '../../../../personal_account/presentation/views/personal_account_screen.dart';
import '../../../../rates/presentation/cubit/types_rate_cubit/types_rate_cubit.dart';
import '../../../../rates/presentation/pages/all_emp_taqeem_view.dart';
import '../../../../request_dept/presentation/screens/request_dept_screen.dart';
import '../../../../table/presentation/manager/cubit/attendance_table_cubit.dart';
import '../../../../table/presentation/screens/table_screen.dart';
import '../../../../table_location/presentation/manager/cubit/location_table_cubit.dart';
import '../../../../vacation/presentation/manager/egraa_vacation_cubit/egraa_vaction_cubit.dart';
import '../../../../wathaek/presentation/manager/add_wathaek_cubit/add_wathaek_cubit.dart';
import '../../../../wathaek/presentation/manager/all_wathaek_cubit/all_wathaek_cubit.dart';
import '../../../../wathaek/presentation/manager/delete_wathaek_cubit/delete_wathaek_cubit.dart';
import '../../../../wathaek/presentation/screens/request_wathaek_screen.dart';
import '../../../../wathaek/presentation/screens/status_request_wathaek_screen.dart';
import '../../../../wathaek/presentation/screens/wathaek_details_screen.dart';

part 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(BottomNavInitial());
  int bottomNavIndex = 4;
  bool drawerIsOpen = false;
  late String? messageId;
  var details;
  var forId;

  List<Widget> bottomNavScreens = [

    //FIVE BOTTOM NAV ITEMS
    //0
    BlocProvider(
      create: (context) => getIt<GetProfileCubit>(),
      child: const PersonalAccountScreen(),
    ),

    //1
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<MyMessagesCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<SentMessagesCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<SeenMessageCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<DeleteMessageCubit>(),
        ),
      ],
      child: const MessagesView(),
    ),
    //2
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<AllNotificationCubit>(),
        ),
      ],
      child: const NotificationView(),
    ),
    //3
    BlocProvider(
      create: (context) => getIt<AttendanceTableCubit>(),
      child: const MyOrdersView(),
    ),
    //4
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<FingerPrintCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<ToggleCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<NewFingerPrintCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<AdsCubit>()..getAllAdsList(),
        ),
        BlocProvider(
          create: (context) => getIt<NtaqCubit>(),
        ),
      ],
      child: const HomeViews(),
    ),
    //5
    BlocProvider(
      create: (context) => SelectFileCubit(),
      child: const RequestVacationScreen(),
    ),
    //6
    const RequestDeptScreen(),
    //7
    BlocProvider(
      create: (context) => getIt<AddEzenCubit>(),
      child: const AddEzenScreen(),
    ),
    //8
    BlocProvider(
      create: (context) => getIt<AllEzenCubit>(),
      child: const StatusRequestEzen(),
    ),
    //9
    const EmployeeProfileFormScreenStep1(),

    //10
    const PaymentPermissionScreen(),
    //11
    const EmployeeProfileFormScreenStep2(),

    //12
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<SelectFileCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<SendMessageCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<EmployeesCubit>(),
        )
      ],
      child: const SendMessageView(),
    ),
    //13
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<AttendanceTableCubit>(),
        ),
      ],
      child: const DataTableView(),
    ),
    //14

    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<DeleteEzenCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<EgraaEzenCubit>(),
        ),
      ],
      child: const EzenDetailsScreen(),
    ),

    //15

    const FollowingRequestScreen(),
    //16
    const ChangeBankAccountViewStep1(),
    //17
    const ChangeBankAccountViewStep2(),

    //18
    const EditProfileScreen(),

    //19

    const ContactUsScreen(),

    //20

    const NotificationView(),

    //21

    BlocProvider(
      create: (context) => getIt<AboutAppCubit>(),
      child: const AboutAppView(),
    ),
//22
    BlocProvider(
      create: (context) => getIt<CalenderCubit>(),
      child: const CalenderView(),
    ),
    //23
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<MessageDetailsCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<EmployeesCubit>(),
        )
      ],
      child: const MessageDetailsView(),
    ),
    //24
    BlocProvider(
      create: (context) => getIt<PrivacyAndPolicyCubit>(),
      child: const PrivacyAndPolicyView(),
    ),
//25
    BlocProvider(
      create: (context) => getIt<AddEzenCubit>(),
      child: const EditeEzenScreen(),
    ),
//26
    BlocProvider(
      create: (context) => getIt<AddVacationCubit>(),
      child: const EditeVacationScreen(),
    ),
//27
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<DeleteVacationCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<EgraaVactionCubit>(),
        ),
      ],
      child: const OrderVacationDetailsScreen(),
    ),

    //28
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AddVacationCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<SelectFileVacationCubit>(),
        ),
      ],
      child: const RequestVacationScreen(),
    ),
//29
    BlocProvider(
      create: (context) => getIt<AllVacationCubit>(),
      child: const StatusRequestVacation(),
    ),
//30
    BlocProvider(
      create: (context) => getIt<AllEzenCubit>(),
      child: const WaredListScreen(),
    ),
//31
    BlocProvider(
      create: (_) => getIt<Ta3memCubit>(),
      child: const Ta3memView(),
    ),
//32
    BlocProvider(
      create: (context) => getIt<SeenTa3memCubit>(),
      child: const T3memDetailsView(),
    ),

    //33
    BlocProvider(
      create: (_) => getIt<EnzaratCubit>(),
      child: const EnzaratView(),
    ),
//34
    BlocProvider(
      create: (context) => getIt<SeenEnzaratCubit>(),
      child: const EnzaratDetailsView(),
    ),
//35
    BlocProvider(
      create: (context) => getIt<TypesRateCubit>()..typesRate(),
      child: const TypesRateView(),
    ),
    //36
    BlocProvider(
      create: (context) => getIt<AllEmpTaqeemCubit>(),
      child: const AllEmpTaqeemView(),
    ),
    //37
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<BnodTaqeemCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<AddTaqeemCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<MonthCubit>(),
        )
      ],
      child: const BnodTaqeemView(),
    ),
    //38
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<LastTaqeemCubit>(),
        ),
        BlocProvider(create: (context) => getIt<DeleteTaqeemCubit>()),
      ],
      child: const LastTaqeemView(),
    ),

    //39
    BlocProvider(
      create: (_) => getIt<Lwae7Cubit>(),
      child: const Lwae7View(),
    ),
//40
    BlocProvider(
      create: (context) => getIt<SeenLwae7Cubit>(),
      child: const Lwae7DetailsView(),
    ),
    //41
    BlocProvider(
      create: (context) => getIt<EditTaqeemCubit>(),
      child: const EditBnodTaqeemView(),
    ),
    //42
    BlocProvider(
      create: (context) => getIt<MosalatCubit>(),
      child: const MosalatView(),
    ),
    //43
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AddAnswerMosalatCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<SelectFileMosalatCubit>(),
        ),
      ],
      child: const MosalatDetailsView(),
    ),
//44
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<MyTaqeemCubit>(),
        ),
        BlocProvider(create: (context) => getIt<DeleteTaqeemCubit>()),
      ],
      child: const MyTaqeemView(),
    ),

    //45

    BlocProvider(
      create: (context) => getIt<GetProfileCubit>(),
      child: const ProfileScreen(),
    ),

    //46

    BlocProvider(
      create: (context) => getIt<AllTalabatCubit>(),
      child: const StatusTalabatRequest(),
    ),
//47
    BlocProvider(
      create: (context) => getIt<EhsaeyatCubit>(),
      child: const EhsaeyatView(),
    ),

    //48
    BlocProvider(
      create: (context) => getIt<AddTalabtCubit>(),
      child: const RequestPermissionEdaraScreen(),
    ),

    //49

    BlocProvider(
      create: (context) => getIt<DeleteTalabatCubit>(),
      child: const PermissionEdraDetailsScreen(),
    ),

    //50

    BlocProvider(
      create: (context) => getIt<AllMobadaratCubit>(),
      child: const StatusMobadaratRequest(),
    ),

    //51
    BlocProvider(
      create: (context) => getIt<DeleteMobadaratCubit>(),
      child: const MobadraDetailsScreen(),
    ),

    //52

    BlocProvider(
      create: (context) => getIt<AddMobadaratCubit>(),
      child: const RequestMobadaratScreen(),
    ),
//53

    BlocProvider(
      create: (context) => getIt<AllWathaekCubit>(),
      child: const StatusWathaekRequest(),
    ),

    //54
    BlocProvider(
      create: (context) => getIt<DeleteWathaekCubit>(),
      child: const WathaekDetailsScreen(),
    ),

    //55

    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AddWathaekCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<SelectMultiFileCubit>(),
        ),
      ],
      child: const RequestWathaekScreen(),
    ),

    //56

    BlocProvider(
      create: (context) => getIt<AllVisitsCubit>(),
      child: const StatusVisitsRequest(),
    ),
//57
    BlocProvider(
      create: (context) => getIt<AllMahamCubit>(),
      child: const StatusMahamRequest(),
    ),

    //58
    BlocProvider(
      create: (context) => getIt<DeleteMahamCubit>(),
      child: const MahamDetailsScreen(),
    ),

    //59

    BlocProvider(
      create: (context) => getIt<AddMahamCubit>(),
      child: const RequestMahamScreen(),
    ),

    //60
    BlocProvider(
      create: (context) => getIt<LocationsCubit>()..getAllLocations(),
      child: const LocationsView(),
    ),

    //61
    BlocProvider(
      create: (context) => getIt<AddLocationCubit>(),
      child: const AddLocation(),
    ),

    //62
    BlocProvider(
      create: (context) => getIt<DeleteLocationsCubit>(),
      child: const LocationsDetailsView(),
    ),

    //63
    BlocProvider(
      create: (context) => getIt<SitesTypeCubit>()..getSitesType(),
      child: const SelectScreen(),
    ),

    //64
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<LocationTableCubit>(),
        ),
      ],
      child: const TableLocationView(),
    ),

    //65
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<MahamTableCubit>(),
        ),
      ],
      child: const TableMahamView(),
    ),

    //66
    const SelectMahamScreen(),

    //67

    BlocProvider(
      create: (context) => getIt<AddMohemaCubit>(),
      child: const AddMohema(),
    ),

        //68
BlocProvider(
  create: (context) => getIt<LocationVacationCubit>(),
  child: const LocationVacationScreen(),
),

  ];

  Widget get selectedBottomNavScreen => bottomNavScreens[bottomNavIndex];

  ListQueue<int> navigationQueue = ListQueue();

void updateBottomNavIndex(int value) {

  if (value < 0 || value >= bottomNavScreens.length) {
    value =0; 
  }
  emit(BottomNavInitial());
  bottomNavIndex = value;
  emit(BottomNavIsChanging());
}


  void changeDrawerState(bool value) {
    emit(BottomNavInitial());
    drawerIsOpen = value;
    emit(DrawerState());
  }

  void getMessageId(String value) {
    emit(BottomNavInitial());
    messageId = value;
    emit(BottomNavIsChanging());
  }

  void getDetails(var value) {
    emit(BottomNavInitial());
    details = value;
    emit(BottomNavIsChanging());
  }

  void getForIdEmployee(var value) {
    emit(BottomNavInitial());
    forId = value;
    emit(BottomNavIsChanging());
  }
}
