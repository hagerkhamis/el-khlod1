import 'package:equatable/equatable.dart';

class TypeRateEntity extends Equatable {
  final String? id;
  final String? title;

  const TypeRateEntity({
    this.id,
    this.title,
  });

  @override
  List<Object?> get props => [
        id,
        title,
      ];
}
