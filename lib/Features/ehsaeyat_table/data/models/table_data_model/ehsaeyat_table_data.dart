import 'package:elkhlod/Features/ehsaeyat_table/domain/entities/new_table_data_entity.dart';

typedef TableDataList = List<TableDataEntity>?;

class EhsaeyatTableData extends TableDataEntity {
  const EhsaeyatTableData({super.id, super.name, super.x});

  factory EhsaeyatTableData.fromJson(Map<String, dynamic> json) =>
      EhsaeyatTableData(
          id: json['id'], name: json['name'], x: json['x'].cast<String>());

  Map<String, dynamic> toJson() => {'id': id, 'name': name, "x": x};
}
