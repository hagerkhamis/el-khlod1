import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/functions/setup_service_locator.dart';
import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_utils.dart';
import '../../../domain/entities/register_entity.dart';
import '../../models/register_model/register_model.dart';

typedef RegisterResponse = Either<String, RegisterEntity>;

abstract class RegisterRemoteDataSource {
  Future<RegisterResponse> register(
    String name,
    String email,
    String address,
    String phone,
    String password,
  );
}

class RegisterRemoteDataSourceImpl extends RegisterRemoteDataSource {
  @override
  Future<RegisterResponse> register(
    String name,
    String email,
    String address,
    String phone,
    String password,
  ) async {
    RegisterResponse registerResponse = left("");

    var body = {
      "user_name": name,
      "user_email": email,
      "user_phone": phone.trim(),
      "user_address": address,
      "user_pass": password,
    };
    await getIt<NetworkRequest>().requestFutureData<RegisterModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerRegisterApiCall,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200) {
          registerResponse = right(data);
        } else {
          registerResponse = left(data.message.toString());
        }
      },
      onError: (code, msg) {
        registerResponse = left(code.toString());
      },
    );
    return registerResponse;
  }
}
