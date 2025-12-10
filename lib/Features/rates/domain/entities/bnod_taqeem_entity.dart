import 'package:equatable/equatable.dart';

class BnodTaqeemEntity extends Equatable {
  final String? id;
  final String? typeId;
  final String? title;
  final String? maxDegree;
  final String? typeName;
  const BnodTaqeemEntity({
    this.id,
    this.typeId,
    this.title,
    this.maxDegree,
    this.typeName,
  });

  @override
  List<Object?> get props => [
        id,
        typeId,
        title,
        maxDegree,
        typeName,
      ];
}
