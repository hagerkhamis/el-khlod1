import '../../data/data_sources/remote_data_source/all_enzarat_remote_data_source.dart';
import '../../data/data_sources/remote_data_source/seen_enzarat_remote_data_source.dart';

abstract class EnzaratRepo {
  Future<AllEnzaratResponse> fetchAllEnzarat(
    String userId,
    String seen,
  );

  Future<SeenEnzaratResponse> seenEnzarat(
    String messageId,
    String toUserId,
  );
}
