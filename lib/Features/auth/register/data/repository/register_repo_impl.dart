import '../../domain/repositories/register_repo.dart';
import '../data_sources/register_remote_data_source/register_remote_data_source.dart';

class RegisterRepoImpl extends RegisterRepository {
  final RegisterRemoteDataSource registerRemoteDataSource;

  RegisterRepoImpl(this.registerRemoteDataSource);

  @override
  Future<RegisterResponse> register(
    String name,
    String email,
    String address,
    String phone,
    String password,
  ) async {
    var userData = await registerRemoteDataSource.register(
      name,
      email,
      address,
      phone,
      password,
    );
    return userData;
  }
}
