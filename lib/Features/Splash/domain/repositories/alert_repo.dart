import 'package:elkhlod/Features/Splash/data/datasources/alert_remote_data_source.dart';

abstract class AlertRepo {
  Future<AlertResponse> getAlert(String empId);

  Future<AddAlertResponse> addAlert(String empId, String eqrarId);

  Future<ShowAlertResponse> getShowAlert(String empId);
}
