import 'package:elkhlod/Features/mobadarat/data/data_sources/remote_data_source/all_mobadarat_remote_data_source.dart';
import 'package:elkhlod/Features/mobadarat/data/data_sources/remote_data_source/delete_mobadarat_remote_data_Source.dart';

import '../../data/data_sources/remote_data_source/sent_mobadarat_remote_data_source.dart';

abstract class MobadaratRepo {
  Future<AllMobadaratResponse> fetchAllMobadarat(String userId, String status);
  Future<AddMobadaratResponse> addMobadarat(
      String empId, String typeId, String reason);
  Future<DeleteMobadaratResponse> deleteMobadarat(
      String talabId, String userId);
}
