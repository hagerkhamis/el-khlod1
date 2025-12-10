part of 'ehsaeyat_cubit.dart';

abstract class EhsaeyatState {
  const EhsaeyatState();
  List<Object> get props => [];
}

class EhsaeyatInitial extends EhsaeyatState {}

class FetchEhsaeyatLoading extends EhsaeyatState {
  const FetchEhsaeyatLoading();
}

class FetchEhsaeyatSuccessful extends EhsaeyatState {
  final EhsaeyatList? data;

  const FetchEhsaeyatSuccessful(this.data);
}

class FetchEhsaeyatFailed extends EhsaeyatState {
  final String message;
  const FetchEhsaeyatFailed(this.message);
}
