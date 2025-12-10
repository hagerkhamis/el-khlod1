import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/auth/login/data/models/login_model/login_model/employee_model.dart';
import 'package:elkhlod/Features/auth/login/domain/entities/employee_entity.dart';
import 'package:elkhlod/Features/rates/data/models/bnod_taqeem_model.dart';
import 'package:elkhlod/Features/rates/data/models/last_taqeem_model.dart';
import 'package:elkhlod/Features/rates/data/models/month_model.dart';
import 'package:elkhlod/Features/rates/data/models/submitAnswer.dart';
import 'package:elkhlod/Features/vacation/data/models/delete_and_add_vacation_model.dart';
import 'package:elkhlod/core/utils/constants.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';
import '../../../messages/employees/data/data_sources/employees_data_source.dart';
import '../models/types_rate_model.dart';

typedef TypesRateResponse = Either<String, AllTypesRateList>;

typedef BnodTaqeemResponse = Either<String, BnodTaqeemList>;
typedef LastTaqeemResponse = Either<String, LastTaqeemList>;

typedef AddRateResponse = Either<String, String>;
typedef MonthResponse = Either<String, MonthList>;

abstract class TypesRateRemoteDataSource {
  Future<TypesRateResponse> fetchTypesRate();
  Future<EmployeesResponse> fetchAllEmpTaqeem(
      String userId, String search, String idType);
  Future<BnodTaqeemResponse> fetchAllBnodTaqeem(String typeId);

  Future<AddRateResponse> addTaqeem(String empId, String month, String year,
      List<SubmitAnswer> submitAnswerList);
  Future<LastTaqeemResponse> fetchAllLastTaqeem(String userId, String forEmpId);
  Future<LastTaqeemResponse> fetchAllMyTaqeem();

  Future<MonthResponse> fetchAllMonth(String userId);
  Future<AddRateResponse> deleteTaqeem(String taqeemId);

  Future<AddRateResponse> editTaqeem(String tqeemId, String month, String year,
      List<SubmitAnswer> submitAnswerList);
}

class TypesRateRemoteDataSourceImpl extends TypesRateRemoteDataSource {
  @override
  Future<TypesRateResponse> fetchTypesRate() async {
    TypesRateResponse typesRateResponse = left("");
    // var body = {
    //   "emp_id": userId,
    //   "status": status,
    // };
    await getIt<NetworkRequest>().requestFutureData<TypesRateModel>(
      Method.get,
      //params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerEvaluationTypes,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200 && data.data != null) {
          typesRateResponse = right(data.data!);
        } else if (data.status == 200 && data.data == null) {
          typesRateResponse = left(data.message!);
        } else {
          typesRateResponse = left(data.message!);
        }
      },
      onError: (code, msg) {
        typesRateResponse = left(code.toString());
      },
    );
    return typesRateResponse;
  }

  @override
  Future<EmployeesResponse> fetchAllEmpTaqeem(
      String userId, String search, String idType) async {
    EmployeesResponse allMessagesResponse = left("");
    var body = {
      "emp_id": userId,
      "page": 1,
      "per_page": 100,
      "search_title": search
    };
    await getIt<NetworkRequest>().requestFutureData<EmployeeModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: idType == "1"
          ? NewApi.doServerAllEmpTaqeem
          : NewApi.doServerAllManagerTaqeem,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200 && data.data != null) {
          allMessagesResponse = right(data.data!);
        } else if (data.status == 200 && data.data == null) {
          allMessagesResponse = left(data.message!);
        } else {
          allMessagesResponse = left(data.message!);
        }
      },
      onError: (code, msg) {
        allMessagesResponse = left(code.toString());
      },
    );
    return allMessagesResponse;
  }

  @override
  Future<BnodTaqeemResponse> fetchAllBnodTaqeem(String typeId) async {
    BnodTaqeemResponse bnodTaqeemResponse = left("");
    var body = {
      "type_id": typeId,
    };
    await getIt<NetworkRequest>().requestFutureData<BnodTaqeemModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerAllBnodTaqeem,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200 && data.data != null) {
          bnodTaqeemResponse = right(data.data!);
        } else if (data.status == 200 && data.data == null) {
          bnodTaqeemResponse = left(data.message!);
        } else {
          bnodTaqeemResponse = left(data.message!);
        }
      },
      onError: (code, msg) {
        bnodTaqeemResponse = left(code.toString());
      },
    );
    return bnodTaqeemResponse;
  }

  @override
  Future<AddRateResponse> addTaqeem(String empId, String month, String year,
      List<SubmitAnswer> submitAnswerList) async {
    var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);

    AddRateResponse bnodTaqeemResponse = left("");

    List<Map> answer = [];

    if (submitAnswerList.isNotEmpty) {
      for (int i = 0; i < submitAnswerList.length; i++) {
        answer.add(submitAnswerList[i].toJsonData());
      }
    }
    var body = {
      "emp_id": box.get(kEmployeeDataBox)!.employeeId!,
      "for_emp_id": empId,
      "for_month": month,
      "for_year": year,
      "bnodItemList": answer
    };

    await getIt<NetworkRequest>().requestFutureData<DeleteAndAddVacationModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.jsonContentType),
      url: NewApi.addTaqeem,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200) {
          bnodTaqeemResponse = right(data.message!);
        } else {
          bnodTaqeemResponse = left(data.message.toString());
        }
      },
      onError: (code, msg) {
        bnodTaqeemResponse = left(code.toString());
      },
    );
    return bnodTaqeemResponse;
  }

  @override
  Future<LastTaqeemResponse> fetchAllMyTaqeem() async {
    var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);

    LastTaqeemResponse lastTaqeemResponse = left("");
    var body = {
      "emp_id": box.get(kEmployeeDataBox)!.employeeId!,
      "page": 1,
      "per_page": 100,
    };
    await getIt<NetworkRequest>().requestFutureData<LastTaqeemModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.myTaqeem,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200 && data.data != null) {
          lastTaqeemResponse = right(data.data!);
        } else if (data.status == 200 && data.data == null) {
          lastTaqeemResponse = left("All My taqeem are seen");
        } else {
          lastTaqeemResponse = left(data.message.toString());
        }
      },
      onError: (code, msg) {
        lastTaqeemResponse = left(code.toString());
      },
    );
    return lastTaqeemResponse;
  }

  @override
  Future<LastTaqeemResponse> fetchAllLastTaqeem(
      String userId, String forEmpId) async {
    LastTaqeemResponse lastTaqeemResponse = left("");
    var body = {
      "emp_id": userId,
      "page": 1,
      "per_page": 100,
      "for_emp_id": forEmpId
    };
    await getIt<NetworkRequest>().requestFutureData<LastTaqeemModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.lastTaqeem,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200 && data.data != null) {
          lastTaqeemResponse = right(data.data!);
        } else if (data.status == 200 && data.data == null) {
          lastTaqeemResponse = left("All last taqeem are seen");
        } else {
          lastTaqeemResponse = left(data.message.toString());
        }
      },
      onError: (code, msg) {
        lastTaqeemResponse = left(code.toString());
      },
    );
    return lastTaqeemResponse;
  }

  @override
  Future<MonthResponse> fetchAllMonth(String userId) async {
    MonthResponse monthResponse = left("");
    var body = {
      "emp_id": userId,
    };
    await getIt<NetworkRequest>().requestFutureData<MonthsModel>(
      Method.get,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerMonth,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200 && data.data != null) {
          monthResponse = right(data.data!);
        } else if (data.status == 200 && data.data == null) {
          monthResponse = left(data.message!);
        } else {
          monthResponse = left(data.message!);
        }
      },
      onError: (code, msg) {
        monthResponse = left(code.toString());
      },
    );
    return monthResponse;
  }

  @override
  Future<AddRateResponse> deleteTaqeem(String taqeemId) async {
    AddRateResponse deleteMessageResponse = left("");
    var body = {
      "tqeem_id": taqeemId,
    };
    await getIt<NetworkRequest>().requestFutureData<DeleteAndAddVacationModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerDeleteTaqeem,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200) {
          deleteMessageResponse = right(data.doneMessage);
        } else {
          deleteMessageResponse = left(data.message!);
        }
      },
      onError: (code, msg) {
        deleteMessageResponse = left(code.toString());
      },
    );
    return deleteMessageResponse;
  }

  @override
  Future<AddRateResponse> editTaqeem(String tqeemId, String month, String year,
      List<SubmitAnswer> submitAnswerList) async {
    AddRateResponse bnodTaqeemResponse = left("");

    List<Map> answer = [];

    if (submitAnswerList.isNotEmpty) {
      for (int i = 0; i < submitAnswerList.length; i++) {
        answer.add(submitAnswerList[i].toJsonData());
      }
    }
    var body = {
      "tqeem_id": tqeemId,
      "for_month": month,
      "for_year": year,
      "bnodItemList": answer
    };

    await getIt<NetworkRequest>().requestFutureData<DeleteAndAddVacationModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.jsonContentType),
      url: NewApi.editTaqeem,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200) {
          bnodTaqeemResponse = right(data.message!);
        } else {
          bnodTaqeemResponse = left(data.message.toString());
        }
      },
      onError: (code, msg) {
        bnodTaqeemResponse = left(code.toString());
      },
    );
    return bnodTaqeemResponse;
  }
}
