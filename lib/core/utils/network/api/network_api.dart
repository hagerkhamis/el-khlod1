class Api {
  //base Url

  static const String mainAppUrl = "https://alatheer.site/abnaa/qr_c/";

  static const String baseUrl = "${mainAppUrl}New_api/";

  static const String doServerLoginApiCall = "login_by_mobile";
  static const String doFireBasePhoneTokenApiCall = "insert_update_token";
  static const String doFingerPrintApiCall = "Basma_Today";
  static const String doNewMessageCall = "save_message";
  static const String doServerGetMessagesApiCall = "get_messages";

  static const String doServerCalenderApiCall = "report_calender";
}

class NewApi {
  static const String mainAppUrl = "https://metacodecx.com/Alkholoud/";

  static String baseUrl = "${mainAppUrl}Api/";

  static String imageBaseUrl = mainAppUrl;

  static const String doServerLoginApiCall = "login_app";
  static const String doServerRegisterApiCall = "register";
  static const String doServerChangePasswordApiCall = "update_pass";
  static const String doServerUpdateProfileApiCall = "update_profile_image";
  static const String doServerUpdateSignatureApiCall = "Add_signature";

  //getProfile
  static const String doServerGetProfileApiCall = "getProfile";

  //basma
  static const String doServerNewBasma = "add_hdor_ensraf";

  //table

  static const String doServerTablesApiCall = "Report_Basma";
  //table_location

  static const String doServerTablesLocationApiCall = "Report_Location_Basma";

  //table_maham_aml
  static const String doServerTablesMahamApiCall = "mohma_3mal_report";
  static const String doServerAddMahamAmlApiCall = "add_mohma_3mal";

  //today_notification
  static const String doServerNotificationList = "today_notification";

//Message
  static const String doServerSendMessageApiCall = "SendMessage";
  static const String doServerAllMessageApiCall = "InboxMessages";
  static const String doServerSentMessageApiCall = "SentMessages";

  static const String doServerMessageDetailsApiCall = "ViewMessage";
  static const String doServerEmployeesApiCall = "AllEmplyees";
  static const String doServerSeenMessageApiCall = "SeenMessage";
  static const String doServerDeleteMessageApiCall = "DeleteMessage";

  //appInfo
  static const String doServerAboutAppApiCall = "getAppinfo";

  //policy
  static const String doServerPrivacyAndPolicyCall = "getAppPolicy";

  //ezen
  static const String doServerAddEzen = "Add_Ezn";
  static const String doServerAlltypeOzonat = "Ozonat_types";
  static const String doServerAllEznApiCall = "Get_Ezn_List";
  static const String doServerDeleteEznApiCall = "Delete_ezn";
  static const String doServerEditEzen = "Edit_Ezn";
  static const String doServerWaredEznApiCall = "Get_Wared_Ezn_List";
  static const String doServerEgraaEznApiCall = "Egraa_ezn";
//Agaza
  static const String doServerAlltypeVacation = "Agazat_types";
  static const String doServerAddVacation = "Add_Agaza";
  static const String doServerAllVacationApiCall = "Get_agaza_List";
  static const String doServerDeleteVacationApiCall = "Delete_agaza";
  static const String doServerEditVacation = "Edit_Agaza";
  static const String doServerEgraaVacationApiCall = "Egraa_agaza";

//ta3mem
  static const String doServerGetTa3memList = "Get_ta3mem_list";
  static const String doServerSeenTa3mem = "SeenTa3mem";

  // loction
  static const String doServerAddLocation = "Add_location_hdoor_ensraf";
  static const String doServerGetLocationList = "get_employee_visits";
  static const String doServerGetSiteList = "sites_types";
  static const String doServerDeleteLocation = "Delete_zeyara";
//mosalat
  static const String doServerGetMosalatList = "Get_mosalat_list";
  static const String doServerAddAnswerMosalat = "Add_mosala_response";

//lawa2h
  static const String doServerGetLawa2hList = "Get_lawa2h_list";
  static const String doServerSeenLayha = "SeenLayha";
//Enzarat
  static const String doServerGetEnzaratList = "Get_Enzarat_list";
  static const String doServerSeenEnzarat = "SeenEnzar";

  //splash

  static const String doSplashScreens = "SplashScreens";

//Taqeem

  static const String doServerAllEmpTaqeem = "All_Emp_Taqeem";
  static const String doServerAllManagerTaqeem = "All_Emp_Manager_Taqeem";
  static const String doServerAllBnodTaqeem = "get_all_bnod_taqeem";
  static const String addTaqeem = "AddTaqeem";
  static const String editTaqeem = "EditTaqeem";

  static const String lastTaqeem = "All_Taqeem_list";
  static const String myTaqeem = "My_Taqeem_list";

  static const String doServerMonth = "Months_List";

  static const String doServerDeleteTaqeem = "Delete_Taqeem";

  static const String doServerEvaluationTypes = "get_evaluation_types";

  //servicesHome

  static const String doServerServicesList = "AppServices";

  //ntaqHome
  static const String doServerGetEmpNtaqList = "Get_emp_ntaq";
  static const String doServerNtaqTypes = "Ntaqat_types";

  ///Ads
  static const String doServerAdsList = "All_sliders";

//Talab
  static const String doServerTalabatList = "Get_Talabat_List";

  static const String doServerAddTalab = "Add_Talab";

  static const String doServerTalabatTypes = "Talabat_types";

  static const String doServerDeleteTalabatApiCall = "Delete_Talab_order";
//Mobadra
  static const String doServerDeleteMobadaratApiCall = "Delete_Mobadra";
  static const String doServerAddMobadaratApiCall = "Add_Mobadra";
  static const String doServerAllMobadaratApiCall = "Get_Mobadarat_List";

  //Maham
  static const String doServerDeleteMahamApiCall = "Delete_task";
  static const String doServerAddMahamApiCall = "Add_Task";
  static const String doServerAllMahamApiCall = "Get_Tasks_List";

//wathaek
  static const String doServerDeletewathaekApiCall = "Delete_Nashat";
  static const String doServerAddwathaekApiCall = "add_nashat";
  static const String doServerAllwathaekApiCall = "Get_Nashat_List";

  //Ehsaeyat

  static const String doServerEhsaeyatList = "Get_emp_ehsaeyat";
  //Ehsaeyat table

  static const String doServerEhsaeyatTablesHorizontalApiCall =
      "get_all_tables_horizontal";

  static const String doServerEhsaeyatTablesVerticalApiCall =
      "get_all_tables_vertical";
//visits
  static const String doServerAllVisitsApiCall = "My_Visits_list";
  static const String doServerAllTeachersApiCall = "Get_All_Teachers";
  static const String doServerAllBnodApiCall = "get_all_bnod_visit";

  static const String doServerAddVisitsApiCall = "AddVisit";

  //alert

  static const String doServerAlertApiCall = "Alert_Screen";

  static const String doServerAddAlertApiCall = "Add_Screen_action";

  static const String doServerShowAlertApiCall = "show_screen_alert";

  // location_vacation
static const String doServerAddLocationVacationApiCall = "location_agaza";
static const String doServerAlltypeLocationVacation = "Agazat_location_type";
      

}

class CodeApi {
  static const String mainAppUrl = "https://alatheertech.com/";
  static const String baseUrl = "${mainAppUrl}basma/Api/";
  static const String getCodeUrl = "All_Companies";
}

