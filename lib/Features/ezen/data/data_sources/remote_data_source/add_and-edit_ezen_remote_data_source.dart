
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elkhlod/Features/messages/send_message/data/models/send_message_model.dart';
import 'package:elkhlod/Features/ezen/data/models/delete_and_add_ezen_model.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';

typedef AddAndEditEzenResponse = Either<String, String>;

abstract class AddAndEditEzenRemoteDataSource {
  Future<AddAndEditEzenResponse> addEzen(String empId, String typeId,
      String fromTime, String toTime, String reason, String ezenDate);
  Future<AddAndEditEzenResponse> editEzen(
      String ezenId,
      String empId,
      String typeId,
      String fromTime,
      String toTime,
      String reason,
      String ezenDate);
}

class AddAndEditEzenRemoteDataSourceImpl
    extends AddAndEditEzenRemoteDataSource {
  @override
  Future<AddAndEditEzenResponse> addEzen(String empId, String typeId,
      String fromTime, String toTime, String reason, String ezenDate) async {
    AddAndEditEzenResponse addEzenResponse = left("");
    var body = {
      "emp_id": empId,
      "ezn_type_id": typeId,
      "from_time": fromTime,
      "to_time": toTime,
      "reason": reason,
      "ezn_date": ezenDate.isEmpty ? DateTime.now().toString() : ezenDate,
    };
    await getIt<NetworkRequest>().requestFutureData<DeleteAndAddEzenModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerAddEzen,
      newBaseUrl: NewApi.baseUrl,

      // isList: false,
      onSuccess: (data) {
        if (data.status == 200) {
          addEzenResponse = right(data.message!);
        } else {
          addEzenResponse = left(data.message.toString());
        }
      },
      onError: (code, msg) {
        addEzenResponse = left(code.toString());
      },
    );
    return addEzenResponse;
  }

  @override
  Future<AddAndEditEzenResponse> editEzen(
      String ezenId,
      String empId,
      String typeId,
      String fromTime,
      String toTime,
      String reason,
      String ezenDate) async {
    AddAndEditEzenResponse editEzenResponse = left("");
    var body = {
      "ezn_id": ezenId,
      "emp_id": empId,
      "ezn_type_id": typeId,
      "from_time": fromTime,
      "to_time": toTime,
      "reason": reason,
      "ezn_date": ezenDate.isEmpty ? DateTime.now().toString() : ezenDate,
    };
    await getIt<NetworkRequest>().requestFutureData<SendMessageModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerEditEzen,
      newBaseUrl: NewApi.baseUrl,
      // isList: false,
      onSuccess: (data) {
        if (data.status == 200) {
          editEzenResponse = right(data.message!);
        } else {
          editEzenResponse = left(data.message.toString());
        }
      },
      onError: (code, msg) {
        editEzenResponse = left(code.toString());
      },
    );
    return editEzenResponse;
  }
}
