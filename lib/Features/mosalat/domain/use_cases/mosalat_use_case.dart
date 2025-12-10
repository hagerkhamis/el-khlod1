import 'package:elkhlod/Features/mosalat/data/data_sources/remote_data_source/add_answer_mosalat_remote_data_source.dart';
import 'package:elkhlod/Features/mosalat/data/data_sources/remote_data_source/all_mosalat_remote_data_source.dart';
import 'package:elkhlod/Features/mosalat/domain/repositories/mosalat_repo.dart';
import 'package:elkhlod/Features/table/domain/entities/table_entity.dart';

abstract class UseCase<type, Param> {
  Future<AllMosalatResponse> callAllMosalat(String userId, String seen);
}

class MosalatUseCase extends UseCase<TableEntity, void> {
  final MosalatRepo mosalatRepository;
  MosalatUseCase(this.mosalatRepository);
  @override
  Future<AllMosalatResponse> callAllMosalat(String userId, String seen) async {
    return await mosalatRepository.fetchAllMosalat(userId, seen);
  }

  Future<SeenMosalatResponse> seenMosalat(
    String messageId,
    String toUserId,
    String mobarer,
    String other,
    String reason,
    dynamic attachment,
  ) async {
    return await mosalatRepository.seenMosalat(
      messageId,
      toUserId,
      mobarer,
      other,
      reason,
      attachment,
    );
  }
}
