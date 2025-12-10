import 'package:elkhlod/Features/table/domain/entities/table_entity.dart';

import '../../data/data_sources/remote_data_source/all_ehsaeyat_remote_data_source.dart';
import '../repositories/ehsaeyat_repo.dart';

abstract class UseCase<type, Param> {
  Future<AllEhsaeyatResponse> callAllEhsaeyat(String userId);
}

class EhsaeyatUseCase extends UseCase<TableEntity, void> {
  final EhsaeyatRepo ehsaeyatRepository;
  EhsaeyatUseCase(this.ehsaeyatRepository);
  @override
  Future<AllEhsaeyatResponse> callAllEhsaeyat(String userId) async {
    return await ehsaeyatRepository.fetchAllEhsaeyat(userId);
  }
}
