import 'package:elkhlod/Features/rates/data/models/submitAnswer.dart';

import '../../../messages/employees/data/data_sources/employees_data_source.dart';
import '../../data/datasources/types_rate_remote_data_source.dart';

abstract class RateRepo {
  Future<TypesRateResponse> fetchAllEzen();
  Future<EmployeesResponse> fetchAllEmpTqeem(
      String userId, String search, String idType);
  Future<BnodTaqeemResponse> bnodTaqeem(String typeId);
  Future<AddRateResponse> addTaqeem(String empId, String month, String year,
      List<SubmitAnswer> submitAnswerList);

  Future<LastTaqeemResponse> fetchAllLastTaqeem(String userId, String forEmpId);
  Future<LastTaqeemResponse> fetchAllMyTaqeem();

  Future<MonthResponse> fetchAllMonth(String userId);
  Future<AddRateResponse> deleteTaqeem(String taqeemId);
  Future<AddRateResponse> editTaqeem(String empId, String month, String year,
      List<SubmitAnswer> submitAnswerList);
}
