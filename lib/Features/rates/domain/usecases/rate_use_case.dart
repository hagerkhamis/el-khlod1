import 'package:elkhlod/Features/rates/data/models/submitAnswer.dart';

import '../../../messages/employees/data/data_sources/employees_data_source.dart';
import '../../data/datasources/types_rate_remote_data_source.dart';
import '../repositories/rate_repo.dart';

abstract class UseCase<type, Param> {
  Future<TypesRateResponse> typesRate();
  Future<EmployeesResponse> allEmpTaqeem(
      String userId, String search, String idType);
  Future<BnodTaqeemResponse> bnodTaqeem(String typeId);
  Future<AddRateResponse> addTaqeem(String empId, String month, String year,
      List<SubmitAnswer> submitAnswerList);
  Future<LastTaqeemResponse> lastTaqeem(String userId, String forEmpId);
  Future<LastTaqeemResponse> myTaqeem();

  Future<MonthResponse> fetchAllMonth(String userId);
  Future<AddRateResponse> deleteTaqeem(String taqeemId);
  Future<AddRateResponse> editTaqeem(String empId, String month, String year,
      List<SubmitAnswer> submitAnswerList);
}

class RateUseCase extends UseCase<dynamic, void> {
  final RateRepo rateRepository;
  RateUseCase(this.rateRepository);

  @override
  Future<TypesRateResponse> typesRate() async {
    return await rateRepository.fetchAllEzen();
  }

  @override
  Future<EmployeesResponse> allEmpTaqeem(
      String userId, String search, String idType) async {
    return await rateRepository.fetchAllEmpTqeem(userId, search, idType);
  }

  @override
  Future<BnodTaqeemResponse> bnodTaqeem(String typeId) async {
    return await rateRepository.bnodTaqeem(typeId);
  }

  @override
  Future<AddRateResponse> addTaqeem(String empId, String month, String year,
      List<SubmitAnswer> submitAnswerList) async {
    return await rateRepository.addTaqeem(empId, month, year, submitAnswerList);
  }

  @override
  Future<AddRateResponse> editTaqeem(String empId, String month, String year,
      List<SubmitAnswer> submitAnswerList) async {
    return await rateRepository.editTaqeem(
        empId, month, year, submitAnswerList);
  }

  @override
  Future<LastTaqeemResponse> lastTaqeem(String userId, String forEmpId) async {
    return await rateRepository.fetchAllLastTaqeem(userId, forEmpId);
  }

  @override
  Future<LastTaqeemResponse> myTaqeem() async {
    return await rateRepository.fetchAllMyTaqeem();
  }

  @override
  Future<MonthResponse> fetchAllMonth(String userId) async {
    return await rateRepository.fetchAllMonth(userId);
  }

  @override
  Future<AddRateResponse> deleteTaqeem(String taqeemId) async {
    return await rateRepository.deleteTaqeem(taqeemId);
  }
}
