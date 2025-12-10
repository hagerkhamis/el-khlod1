import 'package:elkhlod/Features/ta3mem/data/data_sources/remote_data_source/seen_ta3mem_remote_data_source.dart';

import '../../domain/repositories/ta3mem_repo.dart';
import '../data_sources/remote_data_source/all_ta3mem_remote_data_source.dart';

class Ta3memRepositoryImp extends Ta3memRepo {
  final AllTa3memRemoteDataSource myTa3memRemoteDataSource;

  final SeenTa3memRemoteDataSource seenTa3memRemoteDataSource;

  Ta3memRepositoryImp(
      this.myTa3memRemoteDataSource, this.seenTa3memRemoteDataSource);

  @override
  Future<AllTa3memResponse> fetchAllTa3mem(String userId, String seen) async {
    var userData = await myTa3memRemoteDataSource.fetchAllTa3mem(userId, seen);

    return userData;
  }

  @override
  Future<SeenTa3memResponse> seenTa3mem(
      String messageId, String toUserId) async {
    var userData = await seenTa3memRemoteDataSource.seenTa3mem(
      messageId,
      toUserId,
    );

    return userData;
  }
}
