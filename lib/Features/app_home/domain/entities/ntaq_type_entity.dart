import 'package:equatable/equatable.dart';

class NtaqTypesEntity extends Equatable {
  final String? id;
  final String? title;
  final String? color;
  final String? msg;

  const NtaqTypesEntity({this.id, this.title, this.color, this.msg});
  @override
  List<Object?> get props => [id, title, color, msg];
}
