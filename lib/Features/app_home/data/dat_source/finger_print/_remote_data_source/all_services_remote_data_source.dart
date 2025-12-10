import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:elkhlod/Features/app_home/data/models/ads_model/ads_model.dart';
import 'package:elkhlod/Features/app_home/data/models/my_services_model.dart';
import 'package:elkhlod/Features/app_home/data/models/ntaq_model.dart';
import 'package:elkhlod/Features/app_home/data/models/ntaq_type_model.dart';
import 'package:elkhlod/Features/app_home/domain/entities/ntaq_model_entity.dart';
import 'package:elkhlod/Features/app_home/domain/entities/services_entity.dart';
import 'package:elkhlod/core/utils/constants.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';
import '../../../../../auth/login/domain/entities/employee_entity.dart';

typedef AllServicesResponse = Either<String, ServicesEntity>;
typedef NtaqResponse = Either<String, NtaqEntity>;
typedef NtaqTypesResponse = Either<String, NtaqTypesList>;
typedef AllAdsResponse = Either<String, AdsList>;

abstract class AllServicesRemoteDataSource {
  Future<AllServicesResponse> fetchAllServices();
  Future<NtaqResponse> fetchNtaq(String empId);
  Future<NtaqTypesResponse> fetchNtaqTypes();
  Future<AllAdsResponse> fetchAllAds();
}

class AllServicesRemoteDataSourceImpl extends AllServicesRemoteDataSource {
  @override
  Future<AllServicesResponse> fetchAllServices() async {
    AllServicesResponse allTa3memResponse = left("");
    var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);

    var body = {
      'emp_id': box.get(kEmployeeDataBox)!.employeeId!,
    };

    await getIt<NetworkRequest>().requestFutureData<MyServicesModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerServicesList,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200 && data.data != null) {
          allTa3memResponse = right(data);
        } else if (data.status == 200 && data.data == null) {
          allTa3memResponse = left(data.message!);
        } else {
          allTa3memResponse = left(data.message!);
        }
      },
      onError: (code, msg) {
        allTa3memResponse = left(code.toString());
      },
    );
    return allTa3memResponse;
  }

  @override
  Future<NtaqResponse> fetchNtaq(String empId) async {
    NtaqResponse allTa3memResponse = left("");
    var body = {
      'emp_id': empId,
    };
    await getIt<NetworkRequest>().requestFutureData<NtaqModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerGetEmpNtaqList,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200 && data.data != null) {
          allTa3memResponse = right(data.data!);
        } else if (data.status == 200 && data.data == null) {
          allTa3memResponse = left(data.message!);
        } else {
          allTa3memResponse = left(data.message!);
        }
      },
      onError: (code, msg) {
        allTa3memResponse = left(code.toString());
      },
    );
    return allTa3memResponse;
  }

  @override
  Future<NtaqTypesResponse> fetchNtaqTypes() async {
    NtaqTypesResponse allTa3memResponse = left("");

    await getIt<NetworkRequest>().requestFutureData<NtaqTypeModel>(
      Method.post,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerNtaqTypes,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200 && data.data != null) {
          allTa3memResponse = right(data.data);
        } else if (data.status == 200 && data.data == null) {
          allTa3memResponse = left(data.message!);
        } else {
          allTa3memResponse = left(data.message!);
        }
      },
      onError: (code, msg) {
        allTa3memResponse = left(code.toString());
      },
    );
    return allTa3memResponse;
  }

  @override
  Future<AllAdsResponse> fetchAllAds() async {
    AllAdsResponse adsResponse = left("");

    var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);
    var empId = box.get(kEmployeeDataBox)!.employeeId!;

    var body = {
      'emp_id': empId,
    };
    await getIt<NetworkRequest>().requestFutureData<AdsModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerAdsList,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200 && data.data != null) {
          adsResponse = right(data.data!);
        } else if (data.status == 200 && data.data == null) {
          adsResponse = left(data.message!);
        } else {
          adsResponse = left(data.message!);
        }
      },
      onError: (code, msg) {
        adsResponse = left(code.toString());
      },
    );
    return adsResponse;
  }
}
