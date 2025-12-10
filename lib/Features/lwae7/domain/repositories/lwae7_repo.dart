import '../../data/data_sources/remote_data_source/all_lwae7_remote_data_source.dart';
import '../../data/data_sources/remote_data_source/seen_lwae7_remote_data_source.dart';

abstract class Lwae7Repo {
  Future<AllLwae7Response> fetchAllLwae7(
    String userId,
    String seen,
  );

  Future<SeenLwae7Response> seenLwae7(
    String messageId,
    String toUserId,
  );
}
