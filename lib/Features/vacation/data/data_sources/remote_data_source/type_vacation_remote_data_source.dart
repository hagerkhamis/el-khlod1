import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elkhlod/Features/vacation/data/models/type_vacation_model.dart';
import 'package:elkhlod/Features/vacation/data/models/types.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';

typedef TypeVacationResponse = Either<String, TypeVacationList>;

abstract class TypeVacationRemoteDataSource {
  Future<TypeVacationResponse> fetchTypesEzen();
}

class TypeVacationRemoteDataSourceImpl extends TypeVacationRemoteDataSource {
  @override
  Future<TypeVacationResponse> fetchTypesEzen() async {
    TypeVacationResponse typeEzenResponse = left("");

    await getIt<NetworkRequest>().requestFutureData<VacationModel>(
      Method.post,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerAlltypeVacation,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200 && data.data != null) {
          typeEzenResponse = right(data.data!);
        } else if (data.status == 200 && data.data == null) {
          typeEzenResponse = left(data.message!);
        } else {
          typeEzenResponse = left(data.message!);
        }
      },
      onError: (code, msg) {
        typeEzenResponse = left(code.toString());
      },
    );
    return typeEzenResponse;
  }
}
