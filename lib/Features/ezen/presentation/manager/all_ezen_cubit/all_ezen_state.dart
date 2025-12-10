part of 'all_ezen_cubit.dart';

abstract class AllEzenState {
  const AllEzenState();
  List<Object> get props => [];
}

class EzenInitial extends AllEzenState {}

class FetchEzenLoading extends AllEzenState {
  const FetchEzenLoading();
}

class FetchEzenSuccessful extends AllEzenState {
  final AllEzenList? data;

  const FetchEzenSuccessful(this.data);
}

class FetchEzenFailed extends AllEzenState {
  final String message;
  const FetchEzenFailed(this.message);
}
