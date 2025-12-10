import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elkhlod/Features/messages/send_message/data/models/send_message_model.dart';
import 'package:elkhlod/Features/vacation/data/models/delete_and_add_vacation_model.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';

typedef AddVacationResponse = Either<String, String>;

abstract class AddVacationRemoteDataSource {
  Future<AddVacationResponse> addVacation(String empId, String typeId,
      String fromTime, String toTime, String reason, dynamic attachment);
  Future<AddVacationResponse> editVacation(String ezenId, String empId,
      String typeId, String fromTime, String toTime, String reason);
}

class AddVacationRemoteDataSourceImpl extends AddVacationRemoteDataSource {
  @override
  Future<AddVacationResponse> addVacation(String empId, String typeId,
      String fromTime, String toTime, String reason, dynamic attachment) async {
    AddVacationResponse addVacationResponse = left("");

    var formData = FormData();
    formData.fields.add(MapEntry("emp_id", empId));
    formData.fields.add(MapEntry("no3_agaza_id", typeId));
    formData.fields.add(MapEntry("from_date", fromTime));
    formData.fields.add(MapEntry("to_date", toTime));
    formData.fields.add(MapEntry("reason", reason));

    if (attachment != null) {
      formData.files.add(MapEntry(
        "f_file",
        await MultipartFile.fromFile(attachment.path,
            filename: attachment.path.split('/').last),
      ));
    }

    await getIt<NetworkRequest>().requestFutureData<DeleteAndAddVacationModel>(
      Method.post,
      formData: formData,
      isFormData: true,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerAddVacation,
      newBaseUrl: NewApi.baseUrl,
      // isList: false,
      onSuccess: (data) {
        if (data.status == 200) {
          addVacationResponse = right(data.message!);
        } else {
          addVacationResponse = left(data.message.toString());
        }
      },
      onError: (code, msg) {
        addVacationResponse = left(code.toString());
      },
    );
    return addVacationResponse;
  }

  @override
  Future<AddVacationResponse> editVacation(String ezenId, String empId,
      String typeId, String fromTime, String toTime, String reason) async {
    AddVacationResponse addEzenResponse = left("");
    var body = {
      "agaza_id": ezenId,
      "emp_id": empId,
      "no3_agaza_id": typeId,
      "from_date": fromTime,
      "to_date": toTime,
      "reason": reason,
    };
    await getIt<NetworkRequest>().requestFutureData<SendMessageModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerEditVacation,
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
}
