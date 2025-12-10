part of 'type_ezen_cubit.dart';

abstract class EzenState {
  const EzenState();
  List<Object> get props => [];
}

class TypesEzenInitial extends EzenState {}

class FetchTypesEzenLoading extends EzenState {
  const FetchTypesEzenLoading();
}

class FetchTypesEzenSuccessful extends EzenState {
  final TypeEzenList? data;

  const FetchTypesEzenSuccessful(this.data);
}

class FetchTypesEzenFailed extends EzenState {
  final String message;
  const FetchTypesEzenFailed(this.message);
}
