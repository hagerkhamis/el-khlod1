import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';
import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';
import '../../models/maham_aml_model.dart';

typedef AddMahamResponse = Either<String, String>;

abstract class AddMahamAmlRemoteDataSource {
  Future<AddMahamResponse> addMaham(String empId, dynamic image, String lat,
      String long, String empNam, String mahamGeham, String mahamReason);
}

class AddMahamAmlRemoteDataSourceImpl extends AddMahamAmlRemoteDataSource {
  @override
  Future<AddMahamResponse> addMaham(String empId, dynamic image, String lat,
      String long, String empNam, String mahamGeha, String mahamReason) async {
    AddMahamResponse fingerPrintResponse = left("");

    var formData = FormData();
    formData.fields.add(MapEntry("emp_id", empId));
    formData.fields.add(MapEntry("m_lat", lat));
    formData.fields.add(MapEntry("m_long", long));
    formData.fields.add(MapEntry("send_emp_name", empNam));
    formData.fields.add(MapEntry("mohma_reason", mahamGeha));
    formData.fields.add(MapEntry("mohma_geha", mahamReason));

    if (image != null) {
      formData.files.add(MapEntry(
        "emp_img",
        await MultipartFile.fromFile(image.path,
            filename: image.path.split('/').last),
      ));
    }
    await getIt<NetworkRequest>().requestFutureData<MahamAmlModel>(
      Method.post,
      formData: formData,
      isFormData: true,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerAddMahamAmlApiCall,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200) {
          fingerPrintResponse = right(data.message!);
        } else {
          fingerPrintResponse = left(data.message.toString());
        }
      },
      onError: (code, msg) {
        fingerPrintResponse = left(msg.toString());
      },
    );
    return fingerPrintResponse;
  }
}
