part of 'add_mosalat_cubit.dart';

@immutable
abstract class AddAnswerMosalatState {
  const AddAnswerMosalatState();
  List<Object> get props => [];
}

class SeenMosalatInitial extends AddAnswerMosalatState {}

class SeenMosalatLoading extends AddAnswerMosalatState {
  const SeenMosalatLoading();
}

class SeenMosalatSuccessful extends AddAnswerMosalatState {
  final String data;

  const SeenMosalatSuccessful(this.data);
}

class SeenMosalatFailed extends AddAnswerMosalatState {
  final String message;
  const SeenMosalatFailed(this.message);
}
