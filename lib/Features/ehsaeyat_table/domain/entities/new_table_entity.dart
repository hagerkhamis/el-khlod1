import 'package:equatable/equatable.dart';

class TableEntity extends Equatable {
  final dynamic id;
  final dynamic name;

  const TableEntity({
    this.id,
    this.name,
  });

  @override
  List<Object?> get props => [id, name];
}
