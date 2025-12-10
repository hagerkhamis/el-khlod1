import '../../data/data_sources/remote_data_source/all_ta3mem_remote_data_source.dart';
import '../../data/data_sources/remote_data_source/seen_ta3mem_remote_data_source.dart';

abstract class Ta3memRepo {
  Future<AllTa3memResponse> fetchAllTa3mem(
    String userId,
    String seen,
  );

  Future<SeenTa3memResponse> seenTa3mem(
    String messageId,
    String toUserId,
  );
}
