import 'package:elkhlod/Features/Splash/data/models/all_alert_model.dart';
import 'package:elkhlod/Features/Splash/data/models/show_alert_model.dart';
import 'package:elkhlod/Features/add_location/data/models/locations_model.dart';
import 'package:elkhlod/Features/add_location/data/models/sites_model.dart';
import 'package:elkhlod/Features/app_home/data/models/ads_model/ads_model.dart';
import 'package:elkhlod/Features/app_home/data/models/my_services_model.dart';
import 'package:elkhlod/Features/app_home/data/models/ntaq_model.dart';
import 'package:elkhlod/Features/app_home/data/models/ntaq_type_model.dart';
import 'package:elkhlod/Features/ehsaeyat/data/models/my_messages_model/ehsaeyat_model.dart';
import 'package:elkhlod/Features/ehsaeyat_table/data/models/table_data_model/ehsaeyat_table_data_model.dart';
import 'package:elkhlod/Features/enzarat/data/models/enzarat_model/my_enzarat_model.dart';
import 'package:elkhlod/Features/enzarat/data/models/seen_enzarat_model.dart';
import 'package:elkhlod/Features/introduction/data/models/my_services_model/my_intro_model.dart';
import 'package:elkhlod/Features/lwae7/data/models/my_messages_model/my_lwae7_model.dart';
import 'package:elkhlod/Features/lwae7/data/models/seen_lwae7_model.dart';
import 'package:elkhlod/Features/maham/data/models/maham_model.dart';
import 'package:elkhlod/Features/mosalat/data/models/my_messages_model/my_mosalat_model.dart';
import 'package:elkhlod/Features/new_bsama_add_Fingerprint/data/models/finger_print_model/new_finger_print_model.dart';
import 'package:elkhlod/Features/ezen/data/models/all_ezn_model.dart';
import 'package:elkhlod/Features/ezen/data/models/delete_and_add_ezen_model.dart';
import 'package:elkhlod/Features/ezen/data/models/type_ezen_model.dart';
import 'package:elkhlod/Features/notification_view/data/models/all_notification_model.dart';
import 'package:elkhlod/Features/permission_edara/data/models/all_talabat_model.dart';
import 'package:elkhlod/Features/permission_edara/data/models/delete_and_add_talabat_model.dart';
import 'package:elkhlod/Features/permission_edara/data/models/type_talab_model.dart';
import 'package:elkhlod/Features/privacy_and_policy/data/models/privacy_and_policy_model.dart';
import 'package:elkhlod/Features/rates/data/models/bnod_taqeem_model.dart';
import 'package:elkhlod/Features/rates/data/models/last_taqeem_model.dart';
import 'package:elkhlod/Features/rates/data/models/month_model.dart';
import 'package:elkhlod/Features/ta3mem/data/models/my_messages_model/my_ta3mem_model.dart';
import 'package:elkhlod/Features/table_location/data/models/table_model/location_table_model.dart';
import 'package:elkhlod/Features/table_mohm_aml/data/models/table_model/maham_table_model.dart';
import 'package:elkhlod/Features/vacation/data/models/all_vacation_model.dart';
import 'package:elkhlod/Features/vacation/data/models/delete_and_add_vacation_model.dart';
import 'package:elkhlod/Features/vacation/data/models/type_vacation_model.dart';
import 'package:elkhlod/Features/visits/data/models/all_visits_model.dart';
import 'package:elkhlod/Features/visits/data/models/bnod_model.dart';
import 'package:elkhlod/Features/visits/data/models/delete_and_add_visits_model.dart';

import '../../../Features/about_app/data/models/about_app_model/about_app_model.dart';
import '../../../Features/add_maham_aml/data/models/maham_aml_model.dart';
import '../../../Features/auth/fire_base_token/data/models/token_model.dart';
import '../../../Features/auth/login/data/models/login_model/login_model/employee_model.dart';
import '../../../Features/auth/register/data/models/register_model/register_model.dart';
import '../../../Features/calender/data/models/calender_model/calender_model.dart';
import '../../../Features/ehsaeyat_table/data/models/table_header_model/ehsaeyat_table_model.dart';
import '../../../Features/maham/data/models/delete_and_add_mahamt_model.dart';
import '../../../Features/messages/my_messages/data/models/delete_message_model.dart';
import '../../../Features/messages/my_messages/data/models/message_details_model/message_details_model.dart';
import '../../../Features/messages/my_messages/data/models/my_messages_model/my_messages_model.dart';
import '../../../Features/messages/my_messages/data/models/sent_messages_model/sent_messages_model.dart';
import '../../../Features/messages/send_message/data/models/send_message_model.dart';
import '../../../Features/mobadarat/data/models/all_mobadarat_model.dart';
import '../../../Features/mobadarat/data/models/delete_and_add_mobadarat_model.dart';
import '../../../Features/rates/data/models/types_rate_model.dart';
import '../../../Features/table/data/models/table_model/table_model.dart';
import '../../../Features/visits/data/models/teachers_model.dart';
import '../../../Features/wathaek/data/models/all_wathaek_model.dart';
import '../../../Features/wathaek/data/models/delete_and_add_wathaek_model.dart';
import 'base_response/general_response.dart';
import 'net_response.dart';

class EntityFactory {
  static T? generateOBJ<T>(json) {
    if (T.toString() == "BaseResponse") {
      return BaseResponse.fromJson(json) as T;
    } else if (T.toString() == "GeneralResponse") {
      return GeneralResponse.fromJson(json) as T;
    } else if (T.toString() == "EmployeeModel") {
      return EmployeeModel.fromJson(json) as T;
    } else if (T.toString() == "TokenModel") {
      return TokenModel.fromJson(json) as T;
    } else if (T.toString() == "TableModel") {
      return TableModel.fromJson(json) as T;
    } else if (T.toString() == "MyMessagesModel") {
      return MyMessagesModel.fromJson(json) as T;
    } else if (T.toString() == "SendMessageModel") {
      return SendMessageModel.fromJson(json) as T;
    } else if (T.toString() == "CalenderModel") {
      return CalenderModel.fromJson(json) as T;
    } else if (T.toString() == "RegisterModel") {
      return RegisterModel.fromJson(json) as T;
    } else if (T.toString() == "SentMessagesModel") {
      return SentMessagesModel.fromJson(json) as T;
    } else if (T.toString() == "MessageDetailsModel") {
      return MessageDetailsModel.fromJson(json) as T;
    } else if (T.toString() == "DeleteMessageModel") {
      return DeleteMessageModel.fromJson(json) as T;
    } else if (T.toString() == "AboutAppModel") {
      return AboutAppModel.fromJson(json) as T;
    } else if (T.toString() == "PrivacyAndPolicyModel") {
      return PrivacyAndPolicyModel.fromJson(json) as T;
    } else if (T.toString() == "TypeEzenModel") {
      return TypeEzenModel.fromJson(json) as T;
    } else if (T.toString() == "AllEznModel") {
      return AllEznModel.fromJson(json) as T;
    } else if (T.toString() == "DeleteAndAddEzenModel") {
      return DeleteAndAddEzenModel.fromJson(json) as T;
    } else if (T.toString() == "VacationModel") {
      return VacationModel.fromJson(json) as T;
    } else if (T.toString() == "AllVacationModel") {
      return AllVacationModel.fromJson(json) as T;
    } else if (T.toString() == "DeleteAndAddVacationModel") {
      return DeleteAndAddVacationModel.fromJson(json) as T;
    } else if (T.toString() == "MyTa3memModel") {
      return MyTa3memModel.fromJson(json) as T;
    } else if (T.toString() == "MyEnzaratModel") {
      return MyEnzaratModel.fromJson(json) as T;
    } else if (T.toString() == "TypesRateModel") {
      return TypesRateModel.fromJson(json) as T;
    } else if (T.toString() == "BnodTaqeemModel") {
      return BnodTaqeemModel.fromJson(json) as T;
    } else if (T.toString() == "LastTaqeemModel") {
      return LastTaqeemModel.fromJson(json) as T;
    } else if (T.toString() == "MonthsModel") {
      return MonthsModel.fromJson(json) as T;
    } else if (T.toString() == "MyLwae7Model") {
      return MyLwae7Model.fromJson(json) as T;
    } else if (T.toString() == "SeenLwae7Model") {
      return SeenLwae7Model.fromJson(json) as T;
    } else if (T.toString() == "MyMosalatModel") {
      return MyMosalatModel.fromJson(json) as T;
    } else if (T.toString() == "SeenEnzaratModel") {
      return SeenEnzaratModel.fromJson(json) as T;
    } else if (T.toString() == "MyServicesModel") {
      return MyServicesModel.fromJson(json) as T;
    } else if (T.toString() == "MyIntroModel") {
      return MyIntroModel.fromJson(json) as T;
    } else if (T.toString() == "NewFingerPrintModel") {
      return NewFingerPrintModel.fromJson(json) as T;
    } else if (T.toString() == "NtaqModel") {
      return NtaqModel.fromJson(json) as T;
    } else if (T.toString() == "NtaqTypeModel") {
      return NtaqTypeModel.fromJson(json) as T;
    } else if (T.toString() == "TalabatModel") {
      return TalabatModel.fromJson(json) as T;
    } else if (T.toString() == "TalabatListModel") {
      return TalabatListModel.fromJson(json) as T;
    } else if (T.toString() == "DeleteAndAddTalabatModel") {
      return DeleteAndAddTalabatModel.fromJson(json) as T;
    } else if (T.toString() == "EhsaeyatListModel") {
      return EhsaeyatListModel.fromJson(json) as T;
    } else if (T.toString() == "MobadaratListModel") {
      return MobadaratListModel.fromJson(json) as T;
    } else if (T.toString() == "DeleteAndAddMobadaratModel") {
      return DeleteAndAddMobadaratModel.fromJson(json) as T;
    } else if (T.toString() == "WathaekListModel") {
      return WathaekListModel.fromJson(json) as T;
    } else if (T.toString() == "DeleteAndAddWathaekModel") {
      return DeleteAndAddWathaekModel.fromJson(json) as T;
    } else if (T.toString() == "EhsaeyatTableModel") {
      return EhsaeyatTableModel.fromJson(json) as T;
    } else if (T.toString() == "EhsaeyatTableDataModel") {
      return EhsaeyatTableDataModel.fromJson(json) as T;
    } else if (T.toString() == "VisitsListModel") {
      return VisitsListModel.fromJson(json) as T;
    } else if (T.toString() == "TeacherModel") {
      return TeacherModel.fromJson(json) as T;
    } else if (T.toString() == "BnodModel") {
      return BnodModel.fromJson(json) as T;
    } else if (T.toString() == "DeleteAndAddVisitsModel") {
      return DeleteAndAddVisitsModel.fromJson(json) as T;
    } else if (T.toString() == "DeleteAndAddMahamtModel") {
      return DeleteAndAddMahamtModel.fromJson(json) as T;
    } else if (T.toString() == "MahamModel") {
      return MahamModel.fromJson(json) as T;
    } else if (T.toString() == "AdsModel") {
      return AdsModel.fromJson(json) as T;
    } else if (T.toString() == "AllAlertModel") {
      return AllAlertModel.fromJson(json) as T;
    } else if (T.toString() == "LocationsModel") {
      return LocationsModel.fromJson(json) as T;
    } else if (T.toString() == "ShowAlertModel") {
      return ShowAlertModel.fromJson(json) as T;
    } else if (T.toString() == "SitesModel") {
      return SitesModel.fromJson(json) as T;
    } else if (T.toString() == "LocationTableModel") {
      return LocationTableModel.fromJson(json) as T;
    } else if (T.toString() == "NotificationListModel") {
      return NotificationListModel.fromJson(json) as T;
    } else if (T.toString() == "MahamTableModel") {
      return MahamTableModel.fromJson(json) as T;
    } else if (T.toString() == "MahamAmlModel") {
      return MahamAmlModel.fromJson(json) as T;
//       }else if (T.toString() == "LocationVacationModel") {
//   return LocationVacationModel.fromJson(json) as T;
// } else {
    }else{
      return null;
    }
  }

}