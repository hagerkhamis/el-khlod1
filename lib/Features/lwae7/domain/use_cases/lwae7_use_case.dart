import 'package:elkhlod/Features/table/domain/entities/table_entity.dart';

import '../../data/data_sources/remote_data_source/all_lwae7_remote_data_source.dart';
import '../../data/data_sources/remote_data_source/seen_lwae7_remote_data_source.dart';
import '../repositories/lwae7_repo.dart';

abstract class UseCase<type, Param> {
  Future<AllLwae7Response> callAllLwae7(String userId, String seen);
}

class Lwae7UseCase extends UseCase<TableEntity, void> {
  final Lwae7Repo lwae7Repository;
  Lwae7UseCase(this.lwae7Repository);
  @override
  Future<AllLwae7Response> callAllLwae7(String userId, String seen) async {
    return await lwae7Repository.fetchAllLwae7(userId, seen);
  }

  Future<SeenLwae7Response> seenLwae7(String messageId, String toUserId) async {
    return await lwae7Repository.seenLwae7(
      messageId,
      toUserId,
    );
  }
}
