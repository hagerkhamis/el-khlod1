import 'package:elkhlod/Features/privacy_and_policy/data/models/privacy_and_policy_model.dart';
import 'package:elkhlod/Features/privacy_and_policy/domain/entities/privacy_and_policy_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../../core/utils/functions/setup_service_locator.dart';
import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';

typedef PrivacyAndPolicyResponse = Either<String, PrivacyAndPolicyEntity>;

abstract class PrivacyAndPolicyRemoteDataSource {
  Future<PrivacyAndPolicyResponse> getPrivacyAndPolicyData();
}

class PrivacyAndPolicyRemoteDataSourceImpl
    extends PrivacyAndPolicyRemoteDataSource {
  @override
  Future<PrivacyAndPolicyResponse> getPrivacyAndPolicyData() async {
    PrivacyAndPolicyResponse privacyAndPolicyResponse = left("");

    await getIt<NetworkRequest>().requestFutureData<PrivacyAndPolicyModel>(
      Method.get,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerPrivacyAndPolicyCall,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200) {
          privacyAndPolicyResponse = right(data);
        } else {
          privacyAndPolicyResponse = left(data.message!);
        }
      },
      onError: (code, msg) {
        privacyAndPolicyResponse = left(code.toString());
      },
    );
    return privacyAndPolicyResponse;
  }
}
