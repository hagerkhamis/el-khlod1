import '../../data/data_sources/remote_data_source/add_maham_aml_remote_data_source.dart';

abstract class AddMahamRepo {
  Future<AddMahamResponse> addMaham(String empId, dynamic image, String lat,
      String long, String empNam, String mahamGeham, String mahamReason);
}
