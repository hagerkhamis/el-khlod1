import 'package:equatable/equatable.dart';

class EhsaeyatEntity extends Equatable {
  final String? id;
  final String? title;
  final String? notes;

  const EhsaeyatEntity({this.id, this.title, this.notes});
  @override
  List<Object?> get props => [
        id,
        title,
        notes,
      ];
}
