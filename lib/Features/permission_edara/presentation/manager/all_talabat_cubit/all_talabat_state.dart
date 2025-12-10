part of 'all_talabat_cubit.dart';

abstract class AllTalabatState {
  const AllTalabatState();
  List<Object> get props => [];
}

class MyMessagesInitial extends AllTalabatState {}

class FetchLoading extends AllTalabatState {
  const FetchLoading();
}

class FetchSuccessful extends AllTalabatState {
  final TalabatTList? data;

  const FetchSuccessful(this.data);
}

class FetchFailed extends AllTalabatState {
  final String message;
  const FetchFailed(this.message);
}
