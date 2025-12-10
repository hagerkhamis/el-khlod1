import 'package:equatable/equatable.dart';

class MonthEntity extends Equatable {
  final String? monthId;
  final String? monthName;

  const MonthEntity({
    this.monthId,
    this.monthName,
  });

  @override
  List<Object?> get props => [
        monthId,
        monthName,
      ];
}
