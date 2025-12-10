import 'package:equatable/equatable.dart';

class TableDataEntity extends Equatable {
 final String? id;
 final String? name;
 final List<String>? x;

  const TableDataEntity({this.id, this.name, this.x});

  @override
  List<Object?> get props => [id, name, x];
}
