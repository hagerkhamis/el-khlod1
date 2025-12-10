import 'package:elkhlod/Features/table/domain/entities/table_entity.dart';

import '../../data/data_sources/remote_data_source/all_enzarat_remote_data_source.dart';
import '../../data/data_sources/remote_data_source/seen_enzarat_remote_data_source.dart';
import '../repositories/enzarat_repo.dart';

abstract class UseCase<type, Param> {
  Future<AllEnzaratResponse> callAllEnzarat(String userId, String seen);
}

class EnzaratUseCase extends UseCase<TableEntity, void> {
  final EnzaratRepo enzaratRepository;
  EnzaratUseCase(this.enzaratRepository);
  @override
  Future<AllEnzaratResponse> callAllEnzarat(String userId, String seen) async {
    return await enzaratRepository.fetchAllEnzarat(userId, seen);
  }

  Future<SeenEnzaratResponse> seenEnzarat(
      String messageId, String toUserId) async {
    return await enzaratRepository.seenEnzarat(
      messageId,
      toUserId,
    );
  }
}
