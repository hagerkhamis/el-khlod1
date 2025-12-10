import 'package:elkhlod/Features/rates/data/models/submitAnswer.dart';

import '../../../messages/employees/data/data_sources/employees_data_source.dart';
import '../../domain/repositories/rate_repo.dart';
import '../datasources/types_rate_remote_data_source.dart';

class RateRepositoryImp extends RateRepo {
  final TypesRateRemoteDataSource allEzenRemoteDataSource;

  RateRepositoryImp(
    this.allEzenRemoteDataSource,
  );

  @override
  Future<TypesRateResponse> fetchAllEzen() async {
    var typeData = await allEzenRemoteDataSource.fetchTypesRate();

    return typeData;
  }

  @override
  Future<EmployeesResponse> fetchAllEmpTqeem(
      String userId, String search, String idType) async {
    var userData =
        await allEzenRemoteDataSource.fetchAllEmpTaqeem(userId, search, idType);

    return userData;
  }

  @override
  Future<BnodTaqeemResponse> bnodTaqeem(String typeId) async {
    var bnodTaqeem = await allEzenRemoteDataSource.fetchAllBnodTaqeem(typeId);

    return bnodTaqeem;
  }

  @override
  Future<AddRateResponse> addTaqeem(String empId, String month, String year,
      List<SubmitAnswer> submitAnswerList) async {
    var addTaqeem = await allEzenRemoteDataSource.addTaqeem(
        empId, month, year, submitAnswerList);

    return addTaqeem;
  }

  @override
  Future<LastTaqeemResponse> fetchAllLastTaqeem(
      String userId, String forEmpId) async {
    var addTaqeem =
        await allEzenRemoteDataSource.fetchAllLastTaqeem(userId, forEmpId);

    return addTaqeem;
  }

  @override
  Future<LastTaqeemResponse> fetchAllMyTaqeem() async {
    var myTaqeem = await allEzenRemoteDataSource.fetchAllMyTaqeem();

    return myTaqeem;
  }

  @override
  Future<MonthResponse> fetchAllMonth(String userId) async {
    var getMonth = await allEzenRemoteDataSource.fetchAllMonth(userId);

    return getMonth;
  }

  @override
  Future<AddRateResponse> deleteTaqeem(String taqeemId) async {
    var deleteTaqeem = await allEzenRemoteDataSource.deleteTaqeem(taqeemId);

    return deleteTaqeem;
  }

  @override
  Future<AddRateResponse> editTaqeem(String empId, String month, String year,
      List<SubmitAnswer> submitAnswerList) {
    var editTaqeem = allEzenRemoteDataSource.editTaqeem(
        empId, month, year, submitAnswerList);
    return editTaqeem;
  }
}
