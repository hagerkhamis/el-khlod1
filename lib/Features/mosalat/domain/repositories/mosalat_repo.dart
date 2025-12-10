import 'package:elkhlod/Features/mosalat/data/data_sources/remote_data_source/all_mosalat_remote_data_source.dart';

import '../../data/data_sources/remote_data_source/add_answer_mosalat_remote_data_source.dart';

abstract class MosalatRepo {
  Future<AllMosalatResponse> fetchAllMosalat(
    String userId,
    String seen,
  );

  Future<SeenMosalatResponse> seenMosalat(
    String messageId,
    String toUserId,
    String mobarer,
    String other,
    String reason,
    dynamic attachment,
  );
}
