import 'package:elkhlod/Features/table/domain/entities/table_entity.dart';

import '../../data/data_sources/remote_data_source/all_ta3mem_remote_data_source.dart';
import '../../data/data_sources/remote_data_source/seen_ta3mem_remote_data_source.dart';
import '../repositories/ta3mem_repo.dart';

abstract class UseCase<type, Param> {
  Future<AllTa3memResponse> callAllTa3mem(String userId, String seen);
}

class Ta3memUseCase extends UseCase<TableEntity, void> {
  final Ta3memRepo ta3memRepository;
  Ta3memUseCase(this.ta3memRepository);
  @override
  Future<AllTa3memResponse> callAllTa3mem(String userId, String seen) async {
    return await ta3memRepository.fetchAllTa3mem(userId, seen);
  }

  Future<SeenTa3memResponse> seenTa3mem(
      String messageId, String toUserId) async {
    return await ta3memRepository.seenTa3mem(
      messageId,
      toUserId,
    );
  }
}
