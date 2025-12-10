import 'package:elkhlod/Features/Splash/data/datasources/alert_remote_data_source.dart';
import 'package:elkhlod/Features/Splash/domain/repositories/alert_repo.dart';

class AlertRepositoryImp extends AlertRepo {
  final AlertRemoteDataSource alertRemoteDataSource;

  AlertRepositoryImp(
    this.alertRemoteDataSource,
  );

  @override
  Future<AlertResponse> getAlert(String empId) async {
    var userData = await alertRemoteDataSource.getAlert(empId);

    return userData;
  }

  @override
  Future<AddAlertResponse> addAlert(String empId, String eqrarId) {
    var userData = alertRemoteDataSource.addAlert(empId, eqrarId);
    return userData;
  }

  @override
  Future<ShowAlertResponse> getShowAlert(String empId) async {
    var userData = await alertRemoteDataSource.getShowAlert(empId);
    return userData;
  }
}
