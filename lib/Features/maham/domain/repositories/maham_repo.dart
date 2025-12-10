import 'package:elkhlod/Features/maham/data/data_sources/remote_data_source/all_maham_remote_data_source.dart';
import 'package:elkhlod/Features/maham/data/data_sources/remote_data_source/delete_maham_remote_data_Source.dart';

import '../../data/data_sources/remote_data_source/sent_maham_remote_data_source.dart';

abstract class MahamRepo {
  Future<AllMahamResponse> fetchAllMaham(String userId, String status);
  Future<AddMahamResponse> addMaham(
      String empId, String typeId, String reason, String status);
  Future<DeleteMohamResponse> deleteMaham(String talabId, String userId);
}
