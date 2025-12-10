import 'package:elkhlod/Features/table/domain/entities/table_entity.dart';

import '../../data/data_sources/remote_data_source/add_maham_aml_remote_data_source.dart';
import '../repositories/add_maham_repo.dart';

abstract class UseCase<type, Param> {
  Future<AddMahamResponse> callAddMaham(String empId, dynamic image, String lat,
      String long, String empNam, String mahamGeham, String mahamReason);
}

class AddMahamUseCase extends UseCase<TableEntity, void> {
  final AddMahamRepo locationRepository;
  AddMahamUseCase(this.locationRepository);

  @override
  Future<AddMahamResponse> callAddMaham(String empId, dynamic image, String lat,
      String long, String empNam, String mahamGeham, String mahamReason) async {
    return await locationRepository.addMaham(
        empId, image, lat, empNam, long, mahamGeham, mahamReason);
  }
}
