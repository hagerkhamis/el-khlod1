import 'package:elkhlod/Features/enzarat/data/data_sources/remote_data_source/seen_enzarat_remote_data_source.dart';

import '../../domain/repositories/enzarat_repo.dart';
import '../data_sources/remote_data_source/all_enzarat_remote_data_source.dart';

class EnzaratRepositoryImp extends EnzaratRepo {
  final AllEnzaratRemoteDataSource myEnzaratRemoteDataSource;

  final SeenEnzaratRemoteDataSource seenEnzaratRemoteDataSource;

  EnzaratRepositoryImp(
      this.myEnzaratRemoteDataSource, this.seenEnzaratRemoteDataSource);

  @override
  Future<AllEnzaratResponse> fetchAllEnzarat(String userId, String seen) async {
    var userData =
        await myEnzaratRemoteDataSource.fetchAllEnzarat(userId, seen);

    return userData;
  }

  @override
  Future<SeenEnzaratResponse> seenEnzarat(
      String messageId, String toUserId) async {
    var userData = await seenEnzaratRemoteDataSource.seenEnzarat(
      messageId,
      toUserId,
    );

    return userData;
  }
}
