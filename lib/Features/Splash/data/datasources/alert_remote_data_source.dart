import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elkhlod/Features/Splash/data/models/all_alert_model.dart';
import 'package:elkhlod/Features/Splash/data/models/show_alert_model.dart';
import 'package:elkhlod/Features/Splash/domain/entities/alert_entity.dart';
import 'package:elkhlod/Features/Splash/domain/entities/show_alert_entity.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';

typedef AlertResponse = Either<String, AlertEntity>;
typedef AddAlertResponse = Either<String, String>;

typedef ShowAlertResponse = Either<String, ShowAlertEntity>;

abstract class AlertRemoteDataSource {
  Future<AlertResponse> getAlert(String empId);
  Future<AddAlertResponse> addAlert(String empId, String eqrarId);
  Future<ShowAlertResponse> getShowAlert(String empId);
}

class AlertRemoteDataSourceImpl extends AlertRemoteDataSource {
  @override
  Future<AlertResponse> getAlert(String empId) async {
    AlertResponse alertResponse = left("");
    var body = {
      "emp_id": empId,
    };
    await getIt<NetworkRequest>().requestFutureData<AllAlertModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerAlertApiCall,
      newBaseUrl: NewApi.baseUrl,
      // isList: false,
      onSuccess: (data) {
        if (data.status == 200) {
          alertResponse = right(data.data);
        } else {
          alertResponse = left(data.message.toString());
        }
      },
      onError: (code, msg) {
        alertResponse = left(code.toString());
      },
    );
    return alertResponse;
  }

  @override
  Future<AddAlertResponse> addAlert(String empId, String eqrarId) async {
    AddAlertResponse addAlertResponse = left("");

    var body = {
      "emp_id": empId,
      "eqrar_id": eqrarId,
    };
    await getIt<NetworkRequest>().requestFutureData<AllAlertModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerAddAlertApiCall,
      newBaseUrl: NewApi.baseUrl,
      // isList: false,
      onSuccess: (data) {
        if (data.status == 200) {
          addAlertResponse = right(data.message!);
        } else {
          addAlertResponse = left(data.message.toString());
        }
      },
      onError: (code, msg) {
        addAlertResponse = left(code.toString());
      },
    );
    return addAlertResponse;
  }

  @override
  Future<ShowAlertResponse> getShowAlert(String empId) async {
    ShowAlertResponse showAlertResponse = left("");
    var body = {
      "emp_id": empId,
    };
    await getIt<NetworkRequest>().requestFutureData<ShowAlertModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerShowAlertApiCall,
      newBaseUrl: NewApi.baseUrl,
      // isList: false,
      onSuccess: (data) {
        if (data.status == 200) {
          showAlertResponse = right(data.data!);
        } else {
          showAlertResponse = left(data.message.toString());
        }
      },
      onError: (code, msg) {
        showAlertResponse = left(code.toString());
      },
    );
    return showAlertResponse;
  }
}
