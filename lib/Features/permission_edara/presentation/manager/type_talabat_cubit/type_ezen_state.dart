part of 'type_talabat_cubit.dart';

abstract class TypeTalabatState {
  const TypeTalabatState();
  List<Object> get props => [];
}

class MyMessagesInitial extends TypeTalabatState {}

class FetchLoading extends TypeTalabatState {
  const FetchLoading();
}

class FetchSuccessful extends TypeTalabatState {
  final TalabatTypesList? data;

  const FetchSuccessful(this.data);
}

class FetchFailed extends TypeTalabatState {
  final String message;
  const FetchFailed(this.message);
}
