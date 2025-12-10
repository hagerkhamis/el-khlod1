import 'package:equatable/equatable.dart';

class ShowAlertEntity extends Equatable {
  final String? showScreen;

  const ShowAlertEntity({this.showScreen});

  @override
  List<Object?> get props => [showScreen];
}
