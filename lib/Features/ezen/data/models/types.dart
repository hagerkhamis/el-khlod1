import 'package:elkhlod/Features/ezen/domain/entities/types_entity.dart';

typedef TypeEzenList = List<TypesEntity>?;

class Types extends TypesEntity {


 const Types ({
    super.eznId,
    super.exzName,
  });

  factory Types.fromJson(Map<String, dynamic> json) => Types(
        eznId: json['ezn_id'] as String?,
        exzName: json['ezn_name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'ezn_id': eznId,
        'ezn_name': exzName,
      };
}
