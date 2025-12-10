import 'package:equatable/equatable.dart';

typedef TypeEzenList = List<TypesEntity>?;

class TypesEntity extends Equatable {
  final String? eznId;
  final String? exzName;

  const TypesEntity({
    this.eznId,
    this.exzName,
  });

  @override
  List<Object?> get props => [
        eznId,
        exzName,
      ];
}
