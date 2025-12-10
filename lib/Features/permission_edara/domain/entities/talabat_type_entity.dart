import 'package:equatable/equatable.dart';

class TalabatTypesEntity extends Equatable {
  final String? id;
  final String? title;


  const TalabatTypesEntity({this.id, this.title});
  @override
  List<Object?> get props => [id, title];
}
