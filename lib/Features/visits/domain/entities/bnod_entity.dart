import 'package:equatable/equatable.dart';

class BnodEntity extends Equatable {
  final String? bandId;
  final String? bandName;
  final String? maxDegree;

  const BnodEntity({
    this.bandId,
    this.bandName,
    this.maxDegree,
  });

  @override
  List<Object?> get props => [
        bandId,
        bandName,
        maxDegree,
      ];
}
