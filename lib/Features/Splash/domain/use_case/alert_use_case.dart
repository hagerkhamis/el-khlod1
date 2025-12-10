import 'package:elkhlod/Features/Splash/data/datasources/alert_remote_data_source.dart';

import '../repositories/alert_repo.dart';

abstract class UseCase<type, Param> {
  Future<AlertResponse> getALert(String empId);
  Future<AddAlertResponse> addAlert(String empId, String eqrarId);

  Future<ShowAlertResponse> getShowAlert(String empId);
}

class AlertUseCase extends UseCase<dynamic, void> {
  final AlertRepo alertRepo;
  AlertUseCase(this.alertRepo);

  @override
  Future<AlertResponse> getALert(String empId) async {
    return await alertRepo.getAlert(empId);
  }

  @override
  Future<AddAlertResponse> addAlert(String empId, String eqrarId) {
    return alertRepo.addAlert(empId, eqrarId);
  }

  @override
  Future<ShowAlertResponse> getShowAlert(String empId) async {
    return await alertRepo.getShowAlert(empId);
  }
}
