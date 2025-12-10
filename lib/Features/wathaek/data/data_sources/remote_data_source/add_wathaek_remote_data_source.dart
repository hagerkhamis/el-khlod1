import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';
import '../../../../mobadarat/data/models/delete_and_add_mobadarat_model.dart';

typedef AddWathaekResponse = Either<String, String>;

abstract class AddWathaekRemoteDataSource {
  Future<AddWathaekResponse> addWathaek(
      String empId, String title, String reason, dynamic listFiles);
}

class AddWathaekRemoteDataSourceImpl extends AddWathaekRemoteDataSource {
  @override
  Future<AddWathaekResponse> addWathaek(
      String empId, String title, String reason, dynamic listFiles) async {
    AddWathaekResponse addWathaekResponse = left("");
    var formData =
        FormData.fromMap({"emp_id": empId, "title": title, "notes": reason});


    for (int i = 0; i < listFiles.length; i++) {
      formData.files.add(MapEntry(
        "files[]",
        await MultipartFile.fromFile(listFiles[i].path,
            filename: listFiles[i].path.split('/').last),
      ));
    } 

    await getIt<NetworkRequest>().requestFutureData<DeleteAndAddMobadaratModel>(
      Method.post,
      formData: formData,
      isFormData: true,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerAddwathaekApiCall,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200) {
          addWathaekResponse = right(data.message!);
        } else {
          addWathaekResponse = left(data.message.toString());
        }
      },
      onError: (code, msg) {
        addWathaekResponse = left(code.toString());
      },
    );
    return addWathaekResponse;
  }
}
