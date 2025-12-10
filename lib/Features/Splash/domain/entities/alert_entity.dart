import 'package:equatable/equatable.dart';

class AlertEntity extends Equatable {
  final String? id;
  final String? title;
  final String? details;

  const AlertEntity({this.id, this.title, this.details});

  @override
  List<Object?> get props => [id, title, details];
}
