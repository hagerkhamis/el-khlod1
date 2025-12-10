import '../../domain/repositories/mosalat_repo.dart';
import '../data_sources/remote_data_source/add_answer_mosalat_remote_data_source.dart';
import '../data_sources/remote_data_source/all_mosalat_remote_data_source.dart';

class MosalatRepositoryImp extends MosalatRepo {
  final AllMosalatRemoteDataSource myMosalatRemoteDataSource;

  final AddAnswerMosalatRemoteDataSource seenMosalatRemoteDataSource;

  MosalatRepositoryImp(
      this.myMosalatRemoteDataSource, this.seenMosalatRemoteDataSource);

  @override
  Future<AllMosalatResponse> fetchAllMosalat(String userId, String seen) async {
    var userData =
        await myMosalatRemoteDataSource.fetchAllMosalat(userId, seen);

    return userData;
  }

  @override
  Future<SeenMosalatResponse> seenMosalat(
    String messageId,
    String toUserId,
    String mobarer,
    String other,
    String reason,
    dynamic attachment,
  ) async {
    var userData = await seenMosalatRemoteDataSource.seenMosalat(
      messageId,
      toUserId,
      mobarer,
      other,
      reason,
      attachment,
    );

    return userData;
  }
}
