import '../../data/data_sources/register_remote_data_source/register_remote_data_source.dart';
import '../entities/register_entity.dart';
import '../repositories/register_repo.dart';

abstract class UseCase<type> {
  Future<RegisterResponse> call(
    String name,
    String email,
    String address,
    String phone,
    String password,
  );
}

class RegisterUseCase extends UseCase<RegisterEntity> {
  final RegisterRepository registerRepository;
  RegisterUseCase(this.registerRepository);

  @override
  Future<RegisterResponse> call(
    String name,
    String email,
    String address,
    String phone,
    String password,
  ) async {
    return await registerRepository.register(
      name,
      email,
      address,
      phone,
      password,
    );
  }
}
