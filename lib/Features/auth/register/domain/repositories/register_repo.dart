import '../../data/data_sources/register_remote_data_source/register_remote_data_source.dart';

abstract class RegisterRepository {
  Future<RegisterResponse> register(
    String name,
    String email,
    String address,
    String phone,
    String password,
  );
}
