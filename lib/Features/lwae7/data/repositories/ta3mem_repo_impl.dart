import 'package:elkhlod/Features/lwae7/data/data_sources/remote_data_source/seen_lwae7_remote_data_source.dart';

import '../../domain/repositories/lwae7_repo.dart';
import '../data_sources/remote_data_source/all_lwae7_remote_data_source.dart';

class Lwae7RepositoryImp extends Lwae7Repo {
  final AllLwae7RemoteDataSource myLwae7RemoteDataSource;

  final SeenLwae7RemoteDataSource seenLwae7RemoteDataSource;

  Lwae7RepositoryImp(
      this.myLwae7RemoteDataSource, this.seenLwae7RemoteDataSource);

  @override
  Future<AllLwae7Response> fetchAllLwae7(String userId, String seen) async {
    var userData = await myLwae7RemoteDataSource.fetchAllTa3mem(userId, seen);

    return userData;
  }

  @override
  Future<SeenLwae7Response> seenLwae7(String messageId, String toUserId) async {
    var userData = await seenLwae7RemoteDataSource.seenlwae7(
      messageId,
      toUserId,
    );

    return userData;
  }
}
