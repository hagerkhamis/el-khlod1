// ignore_for_file: depend_on_referenced_packages

import 'package:get_it/get_it.dart';
import 'package:elkhlod/Features/Splash/data/datasources/alert_remote_data_source.dart';
import 'package:elkhlod/Features/Splash/data/repositories/alert_repo_impl.dart';
import 'package:elkhlod/Features/Splash/domain/repositories/alert_repo.dart';
import 'package:elkhlod/Features/Splash/domain/use_case/alert_use_case.dart';
import 'package:elkhlod/Features/Splash/presentation/manger/add_alert_cubit/add_alert_cubit.dart';
import 'package:elkhlod/Features/Splash/presentation/manger/alert_cubit/alert_cubit.dart';
import 'package:elkhlod/Features/Splash/presentation/manger/show_alert_cubit/show_alert_cubit.dart';
import 'package:elkhlod/Features/add_location/data/repositories/locations_repo_impl.dart';
import 'package:elkhlod/Features/add_location/domain/repositories/locations_repo.dart';
import 'package:elkhlod/Features/add_location/domain/use_cases/locations_use_case.dart';
import 'package:elkhlod/Features/add_location/presentation/manager/add_location/add_location_cubit.dart';
import 'package:elkhlod/Features/add_location/presentation/manager/delete_locations_cubit/delete_locations_cubit.dart';
import 'package:elkhlod/Features/add_location/presentation/manager/locations_cubit/locations_cubit.dart';
import 'package:elkhlod/Features/add_location/presentation/manager/sites_types/sites_type_cubit.dart';
import 'package:elkhlod/Features/app_home/data/dat_source/finger_print/_remote_data_source/all_services_remote_data_source.dart';
import 'package:elkhlod/Features/app_home/presentation/manger/ads_cubit/ads_cubit.dart';
import 'package:elkhlod/Features/app_home/presentation/manger/ntaq_cubit/ntaq_cubit.dart';
import 'package:elkhlod/Features/app_home/presentation/manger/ntaq_type_cubit/ntaq_types_cubit.dart';
import 'package:elkhlod/Features/app_home/presentation/manger/services_cubit/services_cubit.dart';
import 'package:elkhlod/Features/app_home/presentation/manger/toggle_cubit.dart';
import 'package:elkhlod/Features/auth/register/presentation/manager/cubit/count_down_timer_cubit.dart';
import 'package:elkhlod/Features/auth/update_profile/data/data_sources/update_profile_remote_data_source.dart';
import 'package:elkhlod/Features/auth/update_profile/data/repositories/update_profile_repo_impl.dart';
import 'package:elkhlod/Features/auth/update_profile/domain/repositories/update_profile_repo.dart';
import 'package:elkhlod/Features/auth/update_profile/domain/use_cases/update_profile_use_case.dart';
import 'package:elkhlod/Features/auth/update_profile/presentation/manager/cubit/update_profile_cubit.dart';
import 'package:elkhlod/Features/auth/update_signature/data/data_sources/update_signature_remote_data_source.dart';
import 'package:elkhlod/Features/auth/update_signature/data/repositories/update_signature_repo_impl.dart';
import 'package:elkhlod/Features/auth/update_signature/domain/repositories/update_signature_repo.dart';
import 'package:elkhlod/Features/auth/update_signature/domain/use_cases/update_signature_use_case.dart';
import 'package:elkhlod/Features/auth/update_signature/presentation/manager/cubit/update_signature_cubit.dart';
import 'package:elkhlod/Features/ehsaeyat/data/data_sources/remote_data_source/all_ehsaeyat_remote_data_source.dart';
import 'package:elkhlod/Features/ehsaeyat/data/repositories/ehsaeyat_repo_impl.dart';
import 'package:elkhlod/Features/ehsaeyat/domain/repositories/ehsaeyat_repo.dart';
import 'package:elkhlod/Features/ehsaeyat/domain/use_cases/ehsaeyat_use_case.dart';
import 'package:elkhlod/Features/ehsaeyat/presentation/manager/ehsaeyat_cubit/ehsaeyat_cubit.dart';
import 'package:elkhlod/Features/ehsaeyat_table/data/data_sources/table_remote_data_source/ehsaeyat_table_data_remote_data_source.dart';
import 'package:elkhlod/Features/ehsaeyat_table/domain/repositories/table_repository.dart';
import 'package:elkhlod/Features/ehsaeyat_table/domain/use_case/table_use_case.dart';
import 'package:elkhlod/Features/ehsaeyat_table/presentation/manager/cubit_table_horizental/ehsaeyat_table_cubit.dart';
import 'package:elkhlod/Features/ehsaeyat_table/presentation/manager/cubit_table_vertical/ehsaeyat_table_data_cubit.dart';
import 'package:elkhlod/Features/enzarat/data/data_sources/remote_data_source/all_enzarat_remote_data_source.dart';
import 'package:elkhlod/Features/enzarat/data/data_sources/remote_data_source/seen_enzarat_remote_data_source.dart';
import 'package:elkhlod/Features/enzarat/data/repositories/ta3mem_repo_impl.dart';
import 'package:elkhlod/Features/enzarat/domain/repositories/enzarat_repo.dart';
import 'package:elkhlod/Features/enzarat/domain/use_cases/enzarat_use_case.dart';
import 'package:elkhlod/Features/enzarat/presentation/manager/enzarat_cubit/enzarat_cubit.dart';
import 'package:elkhlod/Features/enzarat/presentation/manager/seen_cubit/seen_enzarat_cubit.dart';
import 'package:elkhlod/Features/introduction/data/dat_source/remote_data_source/all_intro_remote_data_source.dart';
import 'package:elkhlod/Features/introduction/data/repository/intro_repository_implementation.dart';
import 'package:elkhlod/Features/introduction/domain/repository/intro_repo.dart';
import 'package:elkhlod/Features/introduction/domain/use_cases/intro_use_case.dart';
import 'package:elkhlod/Features/introduction/presentation/manger/services_cubit/intro_cubit.dart';
import 'package:elkhlod/Features/location_vacation/data/data_sources/remote_data_source/location_vacation_remote_data_source.dart';
import 'package:elkhlod/Features/location_vacation/data/repositories/location_vacation_repo_impl.dart';
import 'package:elkhlod/Features/location_vacation/domain/repositories/location_vacation_repo.dart';
import 'package:elkhlod/Features/location_vacation/domain/use_cases/location_vacation_use_case.dart';
import 'package:elkhlod/Features/location_vacation/presentation/manager/location_vacation_cubit/location_vacation_cubit.dart';
import 'package:elkhlod/Features/lwae7/data/data_sources/remote_data_source/seen_lwae7_remote_data_source.dart';
import 'package:elkhlod/Features/lwae7/domain/use_cases/lwae7_use_case.dart';
import 'package:elkhlod/Features/lwae7/presentation/manager/lwae7_cubit/lwae7_cubit.dart';
import 'package:elkhlod/Features/messages/my_messages/data/data_sources/remote_data_source/delete_messages_remote_data_Source.dart';
import 'package:elkhlod/Features/mobadarat/data/data_sources/remote_data_source/all_mobadarat_remote_data_source.dart';
import 'package:elkhlod/Features/mobadarat/data/data_sources/remote_data_source/delete_mobadarat_remote_data_Source.dart';
import 'package:elkhlod/Features/mobadarat/data/data_sources/remote_data_source/sent_mobadarat_remote_data_source.dart';
import 'package:elkhlod/Features/mobadarat/domain/repositories/mobadarat_repo.dart';
import 'package:elkhlod/Features/mobadarat/domain/use_cases/type_mobadarat_use_case.dart';
import 'package:elkhlod/Features/mobadarat/presentation/manager/add_mobadarat_cubit/add_mobadarat_cubit.dart';
import 'package:elkhlod/Features/mosalat/data/data_sources/remote_data_source/add_answer_mosalat_remote_data_source.dart';
import 'package:elkhlod/Features/mosalat/data/data_sources/remote_data_source/all_mosalat_remote_data_source.dart';
import 'package:elkhlod/Features/mosalat/data/repositories/mosalat_repo_impl.dart';
import 'package:elkhlod/Features/mosalat/domain/repositories/mosalat_repo.dart';
import 'package:elkhlod/Features/mosalat/domain/use_cases/mosalat_use_case.dart';
import 'package:elkhlod/Features/mosalat/presentation/manager/seen_cubit/add_mosalat_cubit.dart';
import 'package:elkhlod/Features/mosalat/presentation/manager/select_file/presentation/cubit/select_file_mosalat_cubit.dart';
import 'package:elkhlod/Features/mosalat/presentation/manager/ta3mem_cubit/mosalat_cubit.dart';
import 'package:elkhlod/Features/new_bsama_add_Fingerprint/data/dat_source/finger_print/_remote_data_source/new_finger_print_remote_data_source.dart';
import 'package:elkhlod/Features/new_bsama_add_Fingerprint/data/repository/new_finger_print_repository_implementation.dart';
import 'package:elkhlod/Features/new_bsama_add_Fingerprint/domain/repository/new_finger_print_repo.dart';
import 'package:elkhlod/Features/new_bsama_add_Fingerprint/domain/use_cases/new_finger_print_use_case.dart';
import 'package:elkhlod/Features/new_bsama_add_Fingerprint/presentation/manger/new_finger_print_cubit.dart';
import 'package:elkhlod/Features/ezen/data/data_sources/remote_data_source/all_ezen_remote_data_source.dart';
import 'package:elkhlod/Features/ezen/data/data_sources/remote_data_source/delete_ezen_remote_data_Source.dart';
import 'package:elkhlod/Features/ezen/data/data_sources/remote_data_source/egraa_ezen_remote_data_source.dart';
import 'package:elkhlod/Features/ezen/data/data_sources/remote_data_source/add_and-edit_ezen_remote_data_source.dart';
import 'package:elkhlod/Features/ezen/data/data_sources/remote_data_source/type_ezen_remote_data_source.dart';
import 'package:elkhlod/Features/ezen/data/repositories/type_ezen_repo_impl.dart';
import 'package:elkhlod/Features/ezen/domain/repositories/ezen_repo.dart';
import 'package:elkhlod/Features/ezen/domain/use_cases/ezen_use_case.dart';
import 'package:elkhlod/Features/ezen/presentation/manager/add_ezen_cubit/add_ezen_cubit.dart';
import 'package:elkhlod/Features/ezen/presentation/manager/all_ezen_cubit/all_ezen_cubit.dart';
import 'package:elkhlod/Features/ezen/presentation/manager/delete_ezen_cubit/delete_ezen_cubit.dart';
import 'package:elkhlod/Features/ezen/presentation/manager/egraa_ezen_cubit/egraa_ezen_cubit.dart';
import 'package:elkhlod/Features/ezen/presentation/manager/type_ezen_cubit/type_ezen_cubit.dart';
import 'package:elkhlod/Features/notification_view/data/repositories/notification_repo_impl.dart';
import 'package:elkhlod/Features/notification_view/domain/use_cases/notification_use_case.dart';
import 'package:elkhlod/Features/permission_edara/data/data_sources/remote_data_source/all_talabat_remote_data_source.dart';
import 'package:elkhlod/Features/permission_edara/data/data_sources/remote_data_source/delete_ezen_remote_data_Source.dart';
import 'package:elkhlod/Features/permission_edara/data/data_sources/remote_data_source/sent_talabat_remote_data_source.dart';
import 'package:elkhlod/Features/permission_edara/data/data_sources/remote_data_source/type_talabat_remote_data_source.dart';
import 'package:elkhlod/Features/permission_edara/data/repositories/type_talab_repo_impl.dart';
import 'package:elkhlod/Features/permission_edara/domain/repositories/talab_repo.dart';
import 'package:elkhlod/Features/permission_edara/domain/use_cases/type_ezen_use_case.dart';
import 'package:elkhlod/Features/permission_edara/presentation/manager/add_talabat_cubit/add_talabt_cubit.dart';
import 'package:elkhlod/Features/permission_edara/presentation/manager/all_talabat_cubit/all_talabat_cubit.dart';
import 'package:elkhlod/Features/permission_edara/presentation/manager/delete_ezen_cubit/delete_talabat_cubit.dart';
import 'package:elkhlod/Features/permission_edara/presentation/manager/type_talabat_cubit/type_talabat_cubit.dart';
import 'package:elkhlod/Features/personal_account/data/data_sources/get_profile_remote_data_source.dart';
import 'package:elkhlod/Features/personal_account/data/repositories/get_profile_repo_impl.dart';
import 'package:elkhlod/Features/personal_account/domain/repositories/get_profile_repo.dart';
import 'package:elkhlod/Features/personal_account/domain/use_cases/get_profile_use_case.dart';
import 'package:elkhlod/Features/personal_account/presentation/manager/cubit/get_profile_cubit.dart';
import 'package:elkhlod/Features/privacy_and_policy/data/data_sources/privacy_and_policy_remote_data_sources.dart';
import 'package:elkhlod/Features/privacy_and_policy/data/repositories/privacy_and_policy_repo_impl.dart';
import 'package:elkhlod/Features/privacy_and_policy/domain/repositories/privacy_and_policy_repo.dart';
import 'package:elkhlod/Features/privacy_and_policy/domain/use_cases/privacy_and_policy_use_case.dart';
import 'package:elkhlod/Features/privacy_and_policy/presentation/manager/cubit/privacy_and_policy_cubit.dart';
import 'package:elkhlod/Features/rates/data/datasources/types_rate_remote_data_source.dart';
import 'package:elkhlod/Features/rates/domain/repositories/rate_repo.dart';
import 'package:elkhlod/Features/rates/domain/usecases/rate_use_case.dart';
import 'package:elkhlod/Features/rates/presentation/cubit/add_taqeem_cubit/add_taqeem_cubit.dart';
import 'package:elkhlod/Features/rates/presentation/cubit/all_emp_taqeem_cubit/all_emp_taqeem_cubit.dart';
import 'package:elkhlod/Features/rates/presentation/cubit/bnod_taqeem_cubit/bnod_taqeem_cubit.dart';
import 'package:elkhlod/Features/rates/presentation/cubit/delete_taqeem_cubit/delete_taqeem_cubit.dart';
import 'package:elkhlod/Features/rates/presentation/cubit/edit_taqeem_cubit/edit_taqeem_cubit.dart';
import 'package:elkhlod/Features/rates/presentation/cubit/last_taqeem_cubit/last_taqeem_cubit.dart';
import 'package:elkhlod/Features/rates/presentation/cubit/month_cubit/month_cubit.dart';
import 'package:elkhlod/Features/rates/presentation/cubit/my_taqeem_cubit/my_taqeem_cubit.dart';
import 'package:elkhlod/Features/ta3mem/data/data_sources/remote_data_source/all_ta3mem_remote_data_source.dart';
import 'package:elkhlod/Features/ta3mem/data/data_sources/remote_data_source/seen_ta3mem_remote_data_source.dart';
import 'package:elkhlod/Features/ta3mem/data/repositories/ta3mem_repo_impl.dart';
import 'package:elkhlod/Features/ta3mem/domain/repositories/ta3mem_repo.dart';
import 'package:elkhlod/Features/ta3mem/domain/use_cases/ta3mem_use_case.dart';
import 'package:elkhlod/Features/ta3mem/presentation/manager/seen_cubit/seen_ta3mem_cubit.dart';
import 'package:elkhlod/Features/ta3mem/presentation/manager/ta3mem_cubit/ta3mem_cubit.dart';
import 'package:elkhlod/Features/table_location/presentation/manager/cubit/location_table_cubit.dart';
import 'package:elkhlod/Features/table_mohm_aml/data/data_sources/table_remote_data_source/maham_table_remote_data_source.dart';
import 'package:elkhlod/Features/table_mohm_aml/data/repository/table_repo_implementation.dart';
import 'package:elkhlod/Features/table_mohm_aml/domain/repositories/maham_table_repository.dart';
import 'package:elkhlod/Features/table_mohm_aml/domain/use_case/maham_table_use_case.dart';
import 'package:elkhlod/Features/table_mohm_aml/presentation/manager/cubit/maham_table_cubit.dart';
import 'package:elkhlod/Features/vacation/data/data_sources/remote_data_source/all_vacation_remote_data_source.dart';
import 'package:elkhlod/Features/vacation/data/data_sources/remote_data_source/delete_vacation_remote_data_Source.dart';
import 'package:elkhlod/Features/vacation/data/data_sources/remote_data_source/egraa_vacation_remote_data_source.dart';
import 'package:elkhlod/Features/vacation/data/data_sources/remote_data_source/sent_vacation_remote_data_source.dart';
import 'package:elkhlod/Features/vacation/data/data_sources/remote_data_source/type_vacation_remote_data_source.dart';
import 'package:elkhlod/Features/vacation/data/repositories/vacation_repo_impl.dart';
import 'package:elkhlod/Features/vacation/domain/repositories/type_vacation_repo.dart';
import 'package:elkhlod/Features/vacation/domain/use_cases/vacation_use_case.dart';
import 'package:elkhlod/Features/vacation/presentation/manager/add_vacation_cubit/add_vacation_cubit.dart';
import 'package:elkhlod/Features/vacation/presentation/manager/all_vacation_cubit/all_vacation_cubit.dart';
import 'package:elkhlod/Features/vacation/presentation/manager/delete_vacation_cubit/delete_vacation_cubit.dart';
import 'package:elkhlod/Features/vacation/presentation/manager/egraa_vacation_cubit/egraa_vaction_cubit.dart';
import 'package:elkhlod/Features/vacation/presentation/manager/select_file/presentation/cubit/select_file_vacation_cubit.dart';
import 'package:elkhlod/Features/vacation/presentation/manager/type_vacation_cubit/type_vacation_cubit.dart';
import 'package:elkhlod/Features/visits/data/data_sources/remote_data_source/all_visits_remote_data_source.dart';
import 'package:elkhlod/Features/visits/data/data_sources/remote_data_source/bnod_remote_data_source.dart';
import 'package:elkhlod/Features/visits/data/data_sources/remote_data_source/delete_visits_remote_data_Source.dart';
import 'package:elkhlod/Features/visits/data/data_sources/remote_data_source/sent_visits_remote_data_source.dart';
import 'package:elkhlod/Features/visits/data/data_sources/remote_data_source/teachers_remote_data_source.dart';
import 'package:elkhlod/Features/visits/data/repositories/visits_repo_impl.dart';
import 'package:elkhlod/Features/visits/domain/repositories/visits_repo.dart';
import 'package:elkhlod/Features/visits/domain/use_cases/type_visits_use_case.dart';
import 'package:elkhlod/Features/visits/presentation/manager/add_mobadarat_cubit/add_visits_cubit.dart';
import 'package:elkhlod/Features/visits/presentation/manager/all_bnod/all_bnod_cubit.dart';
import 'package:elkhlod/Features/visits/presentation/manager/all_teacher/all_teacher_cubit.dart';
import 'package:elkhlod/Features/visits/presentation/manager/all_visits/all_visits_cubit.dart';
import 'package:elkhlod/Features/visits/presentation/manager/delete_mobadarat_cubit/delete_visits_cubit.dart';
import 'package:elkhlod/Features/wathaek/presentation/manager/select_multi_files/select_multi_file_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Features/about_app/data/data_sources/about_app_remote_data_sources.dart';
import '../../../Features/about_app/data/repositories/about_app_repo_impl.dart';
import '../../../Features/about_app/domain/repositories/about_app_repo.dart';
import '../../../Features/about_app/domain/use_cases/about_app_use_case.dart';
import '../../../Features/about_app/presentation/manager/cubit/about_app_cubit.dart';
import '../../../Features/add_location/data/data_sources/remote_data_source/all_locations_remote_data_source.dart';
import '../../../Features/add_maham_aml/data/data_sources/remote_data_source/add_maham_aml_remote_data_source.dart';
import '../../../Features/add_maham_aml/data/repositories/add_maham_repo_impl.dart';
import '../../../Features/add_maham_aml/domain/repositories/add_maham_repo.dart';
import '../../../Features/add_maham_aml/domain/use_cases/add_maham_use_case.dart';
import '../../../Features/add_maham_aml/presentation/manager/add_location/add_mohema_cubit.dart';
import '../../../Features/app_home/data/dat_source/finger_print/_remote_data_source/finger_print_remote_data_source.dart';
import '../../../Features/app_home/data/repository/finger_print_repository_implementation.dart';
import '../../../Features/app_home/domain/repository/finger_print_repo.dart';
import '../../../Features/app_home/domain/use_cases/finger_print_use_case.dart';
import '../../../Features/app_home/presentation/manger/finger_print_cubit.dart';
import '../../../Features/auth/change_password/data/data_sources/change_password_remote_data_source.dart';
import '../../../Features/auth/change_password/data/repositories/change_password_repo_impl.dart';
import '../../../Features/auth/change_password/domain/repositories/change_password_repo.dart';
import '../../../Features/auth/change_password/domain/use_cases/change_password_use_case.dart';
import '../../../Features/auth/change_password/presentation/manager/cubit/change_password_cubit.dart';
import '../../../Features/auth/fire_base_token/data/dat_source/token_data_source.dart';
import '../../../Features/auth/fire_base_token/data/repository/token_repository_implementation.dart';
import '../../../Features/auth/fire_base_token/domain/repository/token_repo.dart';
import '../../../Features/auth/fire_base_token/domain/use_cases/token_use_case.dart';
import '../../../Features/auth/fire_base_token/presentation/manger/token_cubit.dart';
import '../../../Features/auth/login/data/dat_source/login_remote_data_source/login_remote_data_source.dart';
import '../../../Features/auth/login/data/repository/login_repository_implementation.dart';
import '../../../Features/auth/login/domain/repository/login_repo.dart';
import '../../../Features/auth/login/domain/use_cases/login_use_case.dart';
import '../../../Features/auth/login/presentation/manger/login_cubit.dart';
import '../../../Features/auth/register/data/data_sources/register_remote_data_source/register_remote_data_source.dart';
import '../../../Features/auth/register/data/repository/register_repo_impl.dart';
import '../../../Features/auth/register/domain/repositories/register_repo.dart';
import '../../../Features/auth/register/domain/use_cases/register_use_case.dart';
import '../../../Features/auth/register/presentation/manager/cubit/register_cubit.dart';
import '../../../Features/bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import '../../../Features/calender/data/data_sources/calender_remote_data_source/calender_remote_data_source.dart';
import '../../../Features/calender/data/repository/table_repo_implementation.dart';
import '../../../Features/calender/domain/repositories/calender_repository.dart';
import '../../../Features/calender/domain/use_case/calender_use_case.dart';
import '../../../Features/calender/presentation/manager/cubit/calender_table_cubit.dart';

import '../../../Features/ehsaeyat_table/data/data_sources/table_remote_data_source/ehsaeyat_table_remote_data_source.dart';
import '../../../Features/ehsaeyat_table/data/repository/table_repo_implementation.dart';
import '../../../Features/lwae7/data/data_sources/remote_data_source/all_lwae7_remote_data_source.dart';
import '../../../Features/lwae7/data/repositories/ta3mem_repo_impl.dart';
import '../../../Features/lwae7/domain/repositories/lwae7_repo.dart';
import '../../../Features/lwae7/presentation/manager/seen_cubit/seen_lwae7_cubit.dart';
import '../../../Features/maham/data/data_sources/remote_data_source/all_maham_remote_data_source.dart';
import '../../../Features/maham/data/data_sources/remote_data_source/delete_maham_remote_data_Source.dart';
import '../../../Features/maham/data/data_sources/remote_data_source/sent_maham_remote_data_source.dart';
import '../../../Features/maham/data/repositories/mobadarat_repo_impl.dart';
import '../../../Features/maham/domain/repositories/maham_repo.dart';
import '../../../Features/maham/domain/use_cases/type_maham_use_case.dart';
import '../../../Features/maham/presentation/manager/add_maham_cubit/add_maham_cubit.dart';
import '../../../Features/maham/presentation/manager/all_maham_cubit/all_maham_cubit.dart';
import '../../../Features/maham/presentation/manager/delete_maham_cubit/delete_maham_cubit.dart';
import '../../../Features/messages/employees/data/data_sources/employees_data_source.dart';
import '../../../Features/messages/employees/data/repositories/employees_rop_impl.dart';
import '../../../Features/messages/employees/domain/repositories/employees_repo.dart';
import '../../../Features/messages/employees/domain/use_cases/employees_use_case.dart';
import '../../../Features/messages/employees/presentation/manager/cubit/employees_cubit.dart';
import '../../../Features/messages/my_messages/data/data_sources/remote_data_source/all_messages_remote_data_source.dart';
import '../../../Features/messages/my_messages/data/data_sources/remote_data_source/message_details_remote_data_source.dart';
import '../../../Features/messages/my_messages/data/data_sources/remote_data_source/seen_message_remote_data_source.dart';
import '../../../Features/messages/my_messages/data/data_sources/remote_data_source/sent_messages_remote_data_source.dart';
import '../../../Features/messages/my_messages/data/repositories/messages_repo_impl.dart';
import '../../../Features/messages/my_messages/domain/repositories/my_messages_repo.dart';
import '../../../Features/messages/my_messages/domain/use_cases/my_messages_use_case.dart';
import '../../../Features/messages/my_messages/presentation/manager/cubit/delete_message_cubit.dart';
import '../../../Features/messages/my_messages/presentation/manager/cubit/message_details_cubit.dart';
import '../../../Features/messages/my_messages/presentation/manager/cubit/my_messages_cubit.dart';
import '../../../Features/messages/my_messages/presentation/manager/cubit/seen_message_cubit.dart';
import '../../../Features/messages/my_messages/presentation/manager/cubit/sent_messages_cubit.dart';
import '../../../Features/messages/send_message/data/data_sources/send_message_remote_data_source.dart';
import '../../../Features/messages/send_message/data/repositories/send_message_repo_imp.dart';
import '../../../Features/messages/send_message/domain/repositories/send_message_repo.dart';
import '../../../Features/messages/send_message/domain/use_cases/send_message_use_case.dart';
import '../../../Features/messages/send_message/presentation/manger/send_message_cubit.dart';
import '../../../Features/mobadarat/data/repositories/mobadarat_repo_impl.dart';
import '../../../Features/mobadarat/presentation/manager/all_mobadarat_cubit/all_mobadarat_cubit.dart';
import '../../../Features/mobadarat/presentation/manager/delete_mobadarat_cubit/delete_mobadarat_cubit.dart';
import '../../../Features/notification_view/data/data_sources/all_notification_remote_data_source.dart';
import '../../../Features/notification_view/domain/repositories/notification_repo.dart';
import '../../../Features/notification_view/presentation/manager/all_talabat_cubit/all_notification_cubit.dart';
import '../../../Features/rates/data/repositories/rate_repo_impl.dart';
import '../../../Features/rates/presentation/cubit/types_rate_cubit/types_rate_cubit.dart';
import '../../../Features/select_file/presentation/cubit/select_file_cubit.dart';
import '../../../Features/splash/data/datasources/language_local_data_source.dart';
import '../../../Features/splash/data/datasources/language_local_data_source_impl.dart';
import '../../../Features/splash/data/repositories/language_repository_impl.dart';
import '../../../Features/splash/domain/repositories/language_repository.dart';
import '../../../Features/splash/domain/use_case/change_locale_use_case.dart';
import '../../../Features/splash/domain/use_case/get_saved_lang_use_case.dart';
import '../../../Features/splash/presentation/manger/locale_cubit/locale_cubit.dart';
import '../../../Features/table/data/data_sources/table_remote_data_source/table_remote_data_source.dart';
import '../../../Features/table/data/repository/table_repo_implementation.dart';
import '../../../Features/table/domain/repositories/table_repository.dart';
import '../../../Features/table/domain/use_case/table_use_case.dart';
import '../../../Features/table/presentation/manager/cubit/attendance_table_cubit.dart';
import '../../../Features/table/presentation/manager/cubit/pick_date_cubit.dart';
import '../../../Features/table_location/data/data_sources/table_remote_data_source/location_table_remote_data_source.dart';
import '../../../Features/table_location/data/repository/table_repo_implementation.dart';
import '../../../Features/table_location/domain/repositories/location_table_repository.dart';
import '../../../Features/table_location/domain/use_case/location_table_use_case.dart';
import '../../../Features/wathaek/data/data_sources/remote_data_source/add_wathaek_remote_data_source.dart';
import '../../../Features/wathaek/data/data_sources/remote_data_source/all_wathaek_remote_data_source.dart';
import '../../../Features/wathaek/data/data_sources/remote_data_source/delete_wathaek_remote_data_Source.dart';
import '../../../Features/wathaek/data/repositories/mobadarat_repo_impl.dart';
import '../../../Features/wathaek/domain/repositories/Wathaek_repo.dart';
import '../../../Features/wathaek/domain/use_cases/type_mobadarat_use_case.dart';
import '../../../Features/wathaek/presentation/manager/add_wathaek_cubit/add_wathaek_cubit.dart';
import '../../../Features/wathaek/presentation/manager/all_wathaek_cubit/all_wathaek_cubit.dart';
import '../../../Features/wathaek/presentation/manager/delete_wathaek_cubit/delete_wathaek_cubit.dart';



import '../network/network_request.dart';

final getIt = GetIt.instance;
Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  getIt.registerFactory<LocaleCubit>(() => LocaleCubit(
      changeLocaleUseCase: getIt.call(), getSavedLangUseCase: getIt.call()));

  getIt.registerLazySingleton<GetSavedLangUseCase>(
      () => GetSavedLangUseCase(languageRepository: getIt.call()));
  getIt.registerLazySingleton<ChangeLocaleUseCase>(
      () => ChangeLocaleUseCase(languageRepository: getIt.call()));

  getIt.registerLazySingleton<LanguageRepository>(
      () => LanguageRepositoryImpl(languageLocalDataSource: getIt.call()));

  ///datePicker
  getIt.registerFactory<PickDateCubit>(() => PickDateCubit());

  ///  Login
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt.call()));

  getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase(getIt.call()));

  getIt.registerLazySingleton<LoginRepository>(
      () => LoginRepoImpl(getIt.call()));

  getIt.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl());

  getIt.registerLazySingleton<NetworkRequest>(() => NetworkRequestImp());

///////////////////
  ///
  ///  Code
  ///
  ///
  ///
  ///
  ///

  getIt.registerFactory<AlertCubit>(() => AlertCubit(getIt.call()));
  getIt.registerFactory<AddAlertCubit>(() => AddAlertCubit(getIt.call()));
  getIt.registerFactory<ShowAlertCubit>(() => ShowAlertCubit(getIt.call()));

  getIt.registerLazySingleton<AlertUseCase>(() => AlertUseCase(getIt.call()));

  getIt
      .registerLazySingleton<AlertRepo>(() => AlertRepositoryImp(getIt.call()));

  getIt.registerLazySingleton<AlertRemoteDataSource>(
      () => AlertRemoteDataSourceImpl());

  ///Ft3
  ///
  ///  token
  getIt.registerFactory<TokenCubit>(() => TokenCubit(getIt.call()));

  getIt.registerLazySingleton<TokenUseCase>(() => TokenUseCase(getIt.call()));

  getIt.registerLazySingleton<TokenRepository>(
      () => TokenRepoImpl(getIt.call()));

  getIt.registerLazySingleton<TokenRemoteDataSource>(
      () => TokenRemoteDataSourceImpl());

///////////////////
  ///
  /// FingerPrint
  getIt.registerFactory<FingerPrintCubit>(() => FingerPrintCubit(getIt.call()));

  getIt.registerFactory<ServicesCubit>(() => ServicesCubit(getIt.call()));
  getIt.registerFactory<NtaqCubit>(() => NtaqCubit(getIt.call()));
  getIt.registerFactory<AdsCubit>(() => AdsCubit(getIt.call()));

  getIt.registerFactory<NtaqTypesCubit>(() => NtaqTypesCubit(getIt.call()));

  getIt.registerLazySingleton<FingerPrintUseCase>(
      () => FingerPrintUseCase(getIt.call()));

  getIt.registerLazySingleton<FingerPrintRepository>(
      () => FingerPrintRepoImpl(getIt.call(), getIt.call()));

  getIt.registerLazySingleton<FingerPrintRemoteDataSource>(
      () => FingerPrintRemoteDataSourceImpl());

  getIt.registerLazySingleton<AllServicesRemoteDataSource>(
      () => AllServicesRemoteDataSourceImpl());
///////////////////
  ///
  /// Ehsaeyat Table Data
  getIt.registerFactory<EhsaeyatTableCubit>(
      () => EhsaeyatTableCubit(getIt.call()));
  getIt.registerFactory<EhsaeyatTableDataCubit>(
      () => EhsaeyatTableDataCubit(getIt.call()));

  getIt.registerLazySingleton<EhsaeyatTableUseCase>(
      () => EhsaeyatTableUseCase(getIt.call()));

  getIt.registerLazySingleton<EhsaeyatTableRepository>(
      () => EhsaeyatTableRepositoryImp(getIt.call(), getIt.call()));

  getIt.registerLazySingleton<EhsaeyatTableRemoteDataSource>(
      () => EhsaeyatTableRemoteDataSourceImpl());

  getIt.registerLazySingleton<EhsaeyatTableDataRemoteDataSource>(
      () => EhsaeyatTableDataRemoteDataSourceImpl());
// Table Data
  getIt.registerFactory<AttendanceTableCubit>(
      () => AttendanceTableCubit(getIt.call()));

  getIt.registerLazySingleton<TableUseCase>(() => TableUseCase(getIt.call()));

  getIt.registerLazySingleton<TableRepository>(
      () => TableRepositoryImp(getIt.call()));

  getIt.registerLazySingleton<TableRemoteDataSource>(
      () => TableRemoteDataSourceImpl());
  // Table Location Data
  getIt.registerFactory<LocationTableCubit>(
      () => LocationTableCubit(getIt.call()));

  getIt.registerLazySingleton<LocationTableUseCase>(
      () => LocationTableUseCase(getIt.call()));

  getIt.registerLazySingleton<LocationTableRepository>(
      () => LocationTableRepositoryImp(getIt.call()));

  getIt.registerLazySingleton<LocationTableRemoteDataSource>(
      () => LocationTableRemoteDataSourceImpl());

  // Table Maham Data
  getIt.registerFactory<MahamTableCubit>(() => MahamTableCubit(getIt.call()));

  getIt.registerLazySingleton<MahamTableUseCase>(
      () => MahamTableUseCase(getIt.call()));

  getIt.registerLazySingleton<MahamTableRepository>(
      () => MahamTableRepositoryImp(getIt.call()));

  getIt.registerLazySingleton<MahamTableRemoteDataSource>(
      () => MahamTableRemoteDataSourceImpl());

  // ADD Maham Data
  getIt.registerFactory<AddMohemaCubit>(() => AddMohemaCubit(getIt.call()));

  getIt.registerLazySingleton<AddMahamUseCase>(
      () => AddMahamUseCase(getIt.call()));

  getIt.registerLazySingleton<AddMahamRepo>(
      () => AddMahamAmlRepositoryImp(getIt.call()));

  getIt.registerLazySingleton<AddMahamRemoteDataSource>(
      () => AddMahamRemoteDataSourceImpl());

// Notification Today
  getIt.registerFactory<AllNotificationCubit>(
      () => AllNotificationCubit(getIt.call()));

  getIt.registerLazySingleton<NotificationUseCase>(
      () => NotificationUseCase(getIt.call()));

  getIt.registerLazySingleton<NotificationRepo>(
      () => NotificationRepositoryImp(getIt.call()));

  getIt.registerLazySingleton<AllNotificationRemoteDataSource>(
      () => AllNotificationRemoteDataSourceImp());
  // Calender Data
  getIt.registerFactory<CalenderCubit>(() => CalenderCubit(getIt.call()));

  getIt.registerLazySingleton<CalenderUseCase>(
      () => CalenderUseCase(getIt.call()));

  getIt.registerLazySingleton<CalenderRepository>(
      () => CalenderRepositoryImp(getIt.call()));

  getIt.registerLazySingleton<CalenderRemoteDataSource>(
      () => CalenderRemoteDataSourceImpl());

  ///// New Messege

  getIt.registerFactory<SendMessageCubit>(() => SendMessageCubit(getIt.call()));

  getIt.registerLazySingleton<SendMessageUseCase>(
      () => SendMessageUseCase(getIt.call()));

  getIt.registerLazySingleton<SendMessageRepo>(
      () => SendMessageRepoImpl(getIt.call()));

  getIt.registerLazySingleton<SendMessageRemoteDataSource>(
      () => SendMessageRemoteDataSourceImpl());

  /////
  ///ALLMESSAGES
  getIt.registerFactory<MyMessagesCubit>(() => MyMessagesCubit(getIt.call()));
  getIt.registerFactory<SentMessagesCubit>(
      () => SentMessagesCubit(getIt.call()));
  getIt.registerFactory<MessageDetailsCubit>(
      () => MessageDetailsCubit(getIt.call()));
  getIt.registerFactory<SeenMessageCubit>(() => SeenMessageCubit(getIt.call()));
  getIt.registerFactory<DeleteMessageCubit>(
      () => DeleteMessageCubit(getIt.call()));
  getIt.registerLazySingleton<MyMessagesUseCase>(
      () => MyMessagesUseCase(getIt.call()));

  getIt.registerLazySingleton<MessagesRepo>(() => MessagesRepositoryImp(
        getIt.call(),
        getIt.call(),
        getIt.call(),
        getIt.call(),
        getIt.call(),
      ));
////AllMessages
  getIt.registerLazySingleton<AllMessagesRemoteDataSource>(
      () => AllMessagesRemoteDataSourceImpl());
  ////sentMessages
//seenMessage
  getIt.registerLazySingleton<SeenMessageRemoteDataSource>(
      () => SeenMessageRemoteDataSourceImpl());

  ///
  getIt.registerLazySingleton<SentMessagesRemoteDataSource>(
      () => SentMessagesRemoteDataSourceImpl());
  ////MessageDetails
  getIt.registerLazySingleton<MessageDetailsRemoteDataSource>(
      () => MessageDetailsRemoteDataSourceImpl());
  ////DeleteMessage
  getIt.registerLazySingleton<DeleteMessageRemoteDataSource>(
      () => DeleteMessageRemoteDataSourceImpl());
  /////
  () => MessagesRepositoryImp(
        getIt.call(),
        (getIt.call()),
        (getIt.call()),
        getIt.call(),
        getIt.call(),
      );

  ////
  ///
  ///AllEmployees
  getIt.registerFactory<EmployeesCubit>(() => EmployeesCubit(getIt.call()));

  getIt.registerLazySingleton<EmployeesUseCase>(
      () => EmployeesUseCase(getIt.call()));

  getIt.registerLazySingleton<EmployeesRepo>(
      () => EmployeesRepositoryImp(getIt.call()));

  getIt.registerLazySingleton<EmployeesRemoteDataSource>(
      () => EmployeesRemoteDataSourceImpl());

  ////
  ///OTP PHONE AUTH

  ////Count down Timer
  getIt.registerFactory<CountDownTimerCubit>(() => CountDownTimerCubit());

  ///REGISTER
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt.call()));

  getIt.registerLazySingleton<RegisterUseCase>(
      () => RegisterUseCase(getIt.call()));

  getIt.registerLazySingleton<RegisterRepository>(
      () => RegisterRepoImpl(getIt.call()));

  getIt.registerLazySingleton<RegisterRemoteDataSource>(
      () => RegisterRemoteDataSourceImpl());
////////////
  ///CHANGEPASSWORD
  getIt.registerFactory<ChangePasswordCubit>(
      () => ChangePasswordCubit(getIt.call()));

  getIt.registerLazySingleton<ChangePasswordUseCase>(
      () => ChangePasswordUseCase(getIt.call()));

  getIt.registerLazySingleton<ChangePasswordRepository>(
      () => ChangePasswordRepoImpl(getIt.call()));

  getIt.registerLazySingleton<ChangePasswordRemoteDataSource>(
      () => ChangePasswordRemoteDataSourceImpl());
//////////////
  ///
//////
  ///
  ///  //finger

  getIt.registerFactory<NewFingerPrintCubit>(
      () => NewFingerPrintCubit(getIt.call()));

  getIt.registerLazySingleton<NewFingerPrintUseCase>(
      () => NewFingerPrintUseCase(getIt.call()));

  getIt.registerLazySingleton<NewFingerPrintRepository>(
      () => NewFingerPrintRepoImpl(getIt.call()));

  getIt.registerLazySingleton<NewFingerPrintRemoteDataSource>(
      () => NewFingerPrintRemoteDataSourceImpl());

  ///   intro

  getIt.registerFactory<IntroCubit>(() => IntroCubit(getIt.call()));

  getIt.registerLazySingleton<IntroUseCase>(() => IntroUseCase(getIt.call()));

  getIt.registerLazySingleton<IntroRepository>(
      () => IntroRepoImpl(getIt.call()));

  getIt.registerLazySingleton<AllIntroRemoteDataSource>(
      () => AllIntroRemoteDataSourceImpl());

  ///
  /// /Update profile
  getIt.registerFactory<UpdateProfileCubit>(
      () => UpdateProfileCubit(getIt.call()));

  getIt.registerLazySingleton<UpdateProfileUseCase>(
      () => UpdateProfileUseCase(getIt.call()));

  getIt.registerLazySingleton<UpdateProfileRepository>(
      () => UpdateProfileRepoImpl(getIt.call()));

  getIt.registerLazySingleton<UpdateProfileRemoteDataSource>(
      () => UpdateProfileRemoteDataSourceImpl());

  /// /get profile
  getIt.registerFactory<GetProfileCubit>(() => GetProfileCubit(getIt.call()));

  getIt.registerLazySingleton<GetProfileUseCase>(
      () => GetProfileUseCase(getIt.call()));

  getIt.registerLazySingleton<GetProfileRepository>(
      () => GetProfileRepoImpl(getIt.call()));

  getIt.registerLazySingleton<GetProfileRemoteDataSource>(
      () => GetProfileRemoteDataSourceImpl());

  /// /Update Signature
  getIt.registerFactory<UpdateSignatureCubit>(
      () => UpdateSignatureCubit(getIt.call()));

  getIt.registerLazySingleton<UpdateSignatureUseCase>(
      () => UpdateSignatureUseCase(getIt.call()));

  getIt.registerLazySingleton<UpdateSignatureRepository>(
      () => UpdateSignatureRepoImpl(getIt.call()));

  getIt.registerLazySingleton<UpdateSignatureRemoteDataSource>(
      () => UpdateSignatureRemoteDataSourceImpl());
//////////////
  getIt.registerLazySingleton<LanguageLocalDataSource>(
    () => LanguageLocalDataSourceImpl(sharedPreferences: getIt()),
  );
  getIt.registerFactory<BottomNavCubit>(() => BottomNavCubit());
  getIt.registerFactory<SelectFileCubit>(() => SelectFileCubit());
  getIt.registerFactory<SelectFileMosalatCubit>(() => SelectFileMosalatCubit());

  getIt.registerFactory<ToggleCubit>(() => ToggleCubit(0));

//////////
  ///About App
  getIt.registerFactory<AboutAppCubit>(() => AboutAppCubit(getIt.call()));

  getIt.registerLazySingleton<AboutAppUseCase>(
      () => AboutAppUseCase(getIt.call()));

  getIt.registerLazySingleton<AboutAppRepo>(
      () => AboutAppRepositoryImpl(getIt.call()));

  getIt.registerLazySingleton<AboutAppRemoteDataSource>(
      () => AboutAppRemoteDataSourceImpl());

  ///
  ///Privacy And Policy
  getIt.registerFactory<PrivacyAndPolicyCubit>(
      () => PrivacyAndPolicyCubit(getIt.call()));

  getIt.registerLazySingleton<PrivacyAndPolicyUseCase>(
      () => PrivacyAndPolicyUseCase(getIt.call()));

  getIt.registerLazySingleton<PrivacyAndPolicyRepo>(
      () => PrivacyAndPolicyImpl(getIt.call()));

  getIt.registerLazySingleton<PrivacyAndPolicyRemoteDataSource>(
      () => PrivacyAndPolicyRemoteDataSourceImpl());

  ///
  ///
  //  ezen
  getIt.registerFactory<TypeEzenCubit>(() => TypeEzenCubit(getIt.call()));
  getIt.registerFactory<AddEzenCubit>(() => AddEzenCubit(getIt.call()));
  getIt.registerFactory<AllEzenCubit>(() => AllEzenCubit(getIt.call()));
  getIt.registerFactory<DeleteEzenCubit>(() => DeleteEzenCubit(getIt.call()));
  getIt.registerFactory<EgraaEzenCubit>(() => EgraaEzenCubit(getIt.call()));

  getIt.registerLazySingleton<EzenUseCase>(() => EzenUseCase(getIt.call()));

  getIt.registerLazySingleton<EzenRepo>(() => EzenRepositoryImp(
      getIt.call(), getIt.call(), getIt.call(), getIt.call(), getIt.call()));

  getIt.registerLazySingleton<AddAndEditEzenRemoteDataSource>(
      () => AddAndEditEzenRemoteDataSourceImpl());

  getIt.registerLazySingleton<AllEzenRemoteDataSource>(
      () => AllEzenRemoteDataSourceImpl());

  getIt.registerLazySingleton<DeleteEzenRemoteDataSource>(
      () => DeleteEzenRemoteDataSourceImpl());

  getIt.registerLazySingleton<TypeEzenRemoteDataSource>(
      () => TypeEzenRemoteDataSourceImpl());

  getIt.registerLazySingleton<EgraaEzenRemoteDataSource>(
      () => EgraaEzenRemoteDataSourceImpl());

  ///
  ///
  ///
  ///   Talabat
  getIt.registerFactory<AllTalabatCubit>(() => AllTalabatCubit(getIt.call()));
  getIt.registerFactory<TypeTalabatCubit>(() => TypeTalabatCubit(getIt.call()));
  getIt.registerFactory<AddTalabtCubit>(() => AddTalabtCubit(getIt.call()));
  getIt.registerFactory<DeleteTalabatCubit>(
      () => DeleteTalabatCubit(getIt.call()));

  getIt.registerLazySingleton<TalabatUseCase>(
      () => TalabatUseCase(getIt.call()));

  getIt.registerLazySingleton<TalabatRepo>(() => TalabatRepositoryImp(
      getIt.call(), getIt.call(), getIt.call(), getIt.call()));

  getIt.registerLazySingleton<AddTalabatRemoteDataSource>(
      () => AddTalabatRemoteDataSourceImpl());

  getIt.registerLazySingleton<AllTalabatRemoteDataSource>(
      () => AllTalabtRemoteDataSourceImpl());

  getIt.registerLazySingleton<TypeTalabatRemoteDataSource>(
      () => TypeTalabatRemoteDataSourceImpl());

  getIt.registerLazySingleton<DeleteTalabatRemoteDataSource>(
      () => DeleteTalabatRemoteDataSourceImpl());

  ///
  ///
  ///
  ///
  ///     Wathaek
  getIt.registerFactory<AllWathaekCubit>(() => AllWathaekCubit(getIt.call()));
  getIt.registerFactory<AddWathaekCubit>(() => AddWathaekCubit(getIt.call()));
  getIt.registerFactory<DeleteWathaekCubit>(
      () => DeleteWathaekCubit(getIt.call()));

  getIt.registerFactory<SelectMultiFileCubit>(() => SelectMultiFileCubit());

  getIt.registerLazySingleton<WathaekUseCase>(
      () => WathaekUseCase(getIt.call()));

  getIt.registerLazySingleton<WathaekRepo>(
      () => WathaekRepositoryImp(getIt.call(), getIt.call(), getIt.call()));

  getIt.registerLazySingleton<AddWathaekRemoteDataSource>(
      () => AddWathaekRemoteDataSourceImpl());

  getIt.registerLazySingleton<AllWathaekRemoteDataSource>(
      () => AllWathaekRemoteDataSourceImpl());

  getIt.registerLazySingleton<DeleteWathaekRemoteDataSource>(
      () => DeleteWathaektRemoteDataSourceImpl());

  ///     maham
  getIt.registerFactory<AllMahamCubit>(() => AllMahamCubit(getIt.call()));
  getIt.registerFactory<AddMahamCubit>(() => AddMahamCubit(getIt.call()));
  getIt.registerFactory<DeleteMahamCubit>(() => DeleteMahamCubit(getIt.call()));

  getIt.registerLazySingleton<MahamUseCase>(() => MahamUseCase(getIt.call()));

  getIt.registerLazySingleton<MahamRepo>(
      () => MahamRepositoryImp(getIt.call(), getIt.call(), getIt.call()));

  getIt.registerLazySingleton<AddMahamAmlRemoteDataSource>(
      () => AddMahamAmlRemoteDataSourceImpl());

  getIt.registerLazySingleton<AllMahamRemoteDataSource>(
      () => AllMahamRemoteDataSourceImpl());

  getIt.registerLazySingleton<DeleteMahamRemoteDataSource>(
      () => DeleteMahamRemoteDataSourceImpl());

  ///
  ///     mobadarat
  getIt.registerFactory<AllMobadaratCubit>(
      () => AllMobadaratCubit(getIt.call()));
  getIt.registerFactory<AddMobadaratCubit>(
      () => AddMobadaratCubit(getIt.call()));
  getIt.registerFactory<DeleteMobadaratCubit>(
      () => DeleteMobadaratCubit(getIt.call()));

  getIt.registerLazySingleton<MobadaratUseCase>(
      () => MobadaratUseCase(getIt.call()));

  getIt.registerLazySingleton<MobadaratRepo>(
      () => MobadaratRepositoryImp(getIt.call(), getIt.call(), getIt.call()));

  getIt.registerLazySingleton<AddMobadaratRemoteDataSource>(
      () => AddMobadaratRemoteDataSourceImpl());

  getIt.registerLazySingleton<AllMobadaratRemoteDataSource>(
      () => AllMobadaratRemoteDataSourceImpl());

  getIt.registerLazySingleton<DeleteMobadaratRemoteDataSource>(
      () => DeleteMobadaratRemoteDataSourceImpl());

  ///
  ///
  ///  /    Visits
  getIt.registerFactory<AllVisitsCubit>(() => AllVisitsCubit(getIt.call()));
  getIt.registerFactory<AddVisitsCubit>(() => AddVisitsCubit(getIt.call()));
  getIt.registerFactory<DeleteVisitsCubit>(
      () => DeleteVisitsCubit(getIt.call()));

  getIt.registerFactory<AllTeacherCubit>(() => AllTeacherCubit(getIt.call()));
  getIt.registerFactory<AllBnodCubit>(() => AllBnodCubit(getIt.call()));

  getIt.registerLazySingleton<VisitsUseCase>(() => VisitsUseCase(getIt.call()));

  getIt.registerLazySingleton<VisitsRepo>(() => VisitsRepositoryImp(
      getIt.call(), getIt.call(), getIt.call(), getIt.call(), getIt.call()));

  getIt.registerLazySingleton<AddVisitsRemoteDataSource>(
      () => AddVisitsRemoteDataSourceImpl());

  getIt.registerLazySingleton<AllVisitsRemoteDataSource>(
      () => AllVisitsRemoteDataSourceImpl());

  getIt.registerLazySingleton<DeleteVisitsRemoteDataSource>(
      () => DeleteVisitsRemoteDataSourceImpl());

  getIt.registerLazySingleton<AllBnodRemoteDataSource>(
      () => AllBnodRemoteDataSourceImpl());

  getIt.registerLazySingleton<AllTeachersRemoteDataSource>(
      () => AllTeachersRemoteDataSourceImpl());

  ///
  //  vacation
  getIt.registerFactory<SelectFileVacationCubit>(
      () => SelectFileVacationCubit());

  getIt.registerFactory<TypeVacationCubit>(
      () => TypeVacationCubit(getIt.call()));
  getIt.registerFactory<AddVacationCubit>(() => AddVacationCubit(getIt.call()));
  getIt.registerFactory<AllVacationCubit>(() => AllVacationCubit(getIt.call()));
  getIt.registerFactory<DeleteVacationCubit>(
      () => DeleteVacationCubit(getIt.call()));

  getIt.registerFactory<EgraaVactionCubit>(
      () => EgraaVactionCubit(getIt.call()));

  getIt.registerLazySingleton<VacationUseCase>(
      () => VacationUseCase(getIt.call()));

  getIt.registerLazySingleton<VacationRepo>(() => VacationRepositoryImp(
      getIt.call(), getIt.call(), getIt.call(), getIt.call(), getIt.call()));

  getIt.registerLazySingleton<AddVacationRemoteDataSource>(
      () => AddVacationRemoteDataSourceImpl());

  getIt.registerLazySingleton<AllVacationRemoteDataSource>(
      () => AllVacationRemoteDataSourceImpl());

  getIt.registerLazySingleton<DeleteVacationRemoteDataSource>(
      () => DeleteVacationRemoteDataSourceImpl());

  getIt.registerLazySingleton<TypeVacationRemoteDataSource>(
      () => TypeVacationRemoteDataSourceImpl());

  getIt.registerLazySingleton<EgraaVacationRemoteDataSource>(
      () => EgraaVacationRemoteDataSourceImpl());
  


  
  ///
  ///
  ///Ehsaeyat
  getIt.registerFactory<EhsaeyatCubit>(() => EhsaeyatCubit(getIt.call()));

  getIt.registerLazySingleton<EhsaeyatUseCase>(
      () => EhsaeyatUseCase(getIt.call()));

  getIt.registerLazySingleton<EhsaeyatRepo>(() => EhsaeyatRepositoryImp(
        getIt.call(),
      ));

  getIt.registerLazySingleton<AllEhsaeyatRemoteDataSource>(
      () => AllEhsaeyatRemoteDataSourceImpl());

  ///Ta3mem
  getIt.registerFactory<Ta3memCubit>(() => Ta3memCubit(getIt.call()));
  getIt.registerFactory<SeenTa3memCubit>(() => SeenTa3memCubit(getIt.call()));

  getIt.registerLazySingleton<Ta3memUseCase>(() => Ta3memUseCase(getIt.call()));

  getIt.registerLazySingleton<Ta3memRepo>(() => Ta3memRepositoryImp(
        getIt.call(),
        getIt.call(),
      ));

  getIt.registerLazySingleton<AllTa3memRemoteDataSource>(
      () => AllTa3memRemoteDataSourceImpl());

  getIt.registerLazySingleton<SeenTa3memRemoteDataSource>(
      () => SeenTa3memRemoteDataSourceImpl());

  ///locations
  getIt.registerFactory<LocationsCubit>(() => LocationsCubit(getIt.call()));

  getIt.registerFactory<SitesTypeCubit>(() => SitesTypeCubit(getIt.call()));

  getIt.registerFactory<AddLocationCubit>(() => AddLocationCubit(getIt.call()));

  getIt.registerFactory<DeleteLocationsCubit>(
      () => DeleteLocationsCubit(getIt.call()));

  getIt.registerLazySingleton<LocationsUseCase>(
      () => LocationsUseCase(getIt.call()));

  getIt.registerLazySingleton<LocationsRepo>(() => LocationsRepositoryImp(
        getIt.call(),
      ));

  getIt.registerLazySingleton<AllLocationsRemoteDataSource>(
      () => AllLocationsRemoteDataSourceImpl());

  ///Mosalat
  getIt.registerFactory<MosalatCubit>(() => MosalatCubit(getIt.call()));
  getIt.registerFactory<AddAnswerMosalatCubit>(
      () => AddAnswerMosalatCubit(getIt.call()));

  getIt.registerLazySingleton<MosalatUseCase>(
      () => MosalatUseCase(getIt.call()));

  getIt.registerLazySingleton<MosalatRepo>(() => MosalatRepositoryImp(
        getIt.call(),
        getIt.call(),
      ));

  getIt.registerLazySingleton<AllMosalatRemoteDataSource>(
      () => AllMosalatRemoteDataSourceImpl());

  getIt.registerLazySingleton<AddAnswerMosalatRemoteDataSource>(
      () => AddAnswerMosalatDataSourceImpl());

  ///lwae7
  ///

  getIt.registerFactory<Lwae7Cubit>(() => Lwae7Cubit(getIt.call()));
  getIt.registerFactory<SeenLwae7Cubit>(() => SeenLwae7Cubit(getIt.call()));

  getIt.registerLazySingleton<Lwae7UseCase>(() => Lwae7UseCase(getIt.call()));

  getIt.registerLazySingleton<Lwae7Repo>(() => Lwae7RepositoryImp(
        getIt.call(),
        getIt.call(),
      ));

  getIt.registerLazySingleton<AllLwae7RemoteDataSource>(
      () => AllLwae7RemoteDataSourceImpl());

  getIt.registerLazySingleton<SeenLwae7RemoteDataSource>(
      () => SeenLwae7RemoteDataSourceImpl());

  ///Enzarat
  ///
  ///
  getIt.registerFactory<EnzaratCubit>(() => EnzaratCubit(getIt.call()));
  getIt.registerFactory<SeenEnzaratCubit>(() => SeenEnzaratCubit(getIt.call()));

  getIt.registerLazySingleton<EnzaratUseCase>(
      () => EnzaratUseCase(getIt.call()));

  getIt.registerLazySingleton<EnzaratRepo>(() => EnzaratRepositoryImp(
        getIt.call(),
        getIt.call(),
      ));

  getIt.registerLazySingleton<AllEnzaratRemoteDataSource>(
      () => AllEnzaratRemoteDataSourceImpl());

  getIt.registerLazySingleton<SeenEnzaratRemoteDataSource>(
      () => SeenEnzaratRemoteDataSourceImpl());

  ///Rate
  getIt.registerFactory<TypesRateCubit>(() => TypesRateCubit(getIt.call()));
  getIt.registerFactory<AllEmpTaqeemCubit>(
      () => AllEmpTaqeemCubit(getIt.call()));

  getIt.registerLazySingleton<BnodTaqeemCubit>(
      () => BnodTaqeemCubit(getIt.call()));

  getIt.registerLazySingleton<AddTaqeemCubit>(
      () => AddTaqeemCubit(getIt.call()));

  getIt.registerLazySingleton<LastTaqeemCubit>(
      () => LastTaqeemCubit(getIt.call()));
  getIt.registerLazySingleton<MyTaqeemCubit>(() => MyTaqeemCubit(getIt.call()));

  getIt.registerLazySingleton<MonthCubit>(() => MonthCubit(getIt.call()));

  getIt.registerLazySingleton<DeleteTaqeemCubit>(
      () => DeleteTaqeemCubit(getIt.call()));

  getIt.registerLazySingleton<EditTaqeemCubit>(
      () => EditTaqeemCubit(getIt.call()));

  getIt.registerLazySingleton<RateUseCase>(() => RateUseCase(getIt.call()));

  getIt.registerLazySingleton<RateRepo>(() => RateRepositoryImp(
        getIt.call(),
      ));

  getIt.registerLazySingleton<TypesRateRemoteDataSource>(
      () => TypesRateRemoteDataSourceImpl());

// Remote Data Source
getIt.registerLazySingleton<LocationVacationRemoteDataSource>(
  () => LocationVacationRemoteDataSourceImpl(),
);


getIt.registerLazySingleton<LocationVacationRepo>(
  () => LocationVacationRepoImpl(
    remoteDataSource: getIt<LocationVacationRemoteDataSource>(),
  ),
);


// Use Case
getIt.registerLazySingleton<LocationVacationUseCase>(
  () => LocationVacationUseCase(getIt<LocationVacationRepo>()),
);

// Cubit
getIt.registerFactory<LocationVacationCubit>(
  () => LocationVacationCubit(getIt<LocationVacationUseCase>()),
);




}
