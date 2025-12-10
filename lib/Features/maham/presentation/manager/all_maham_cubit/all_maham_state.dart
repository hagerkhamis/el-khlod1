part of 'all_maham_cubit.dart';

abstract class AllMahamState {
  const AllMahamState();
  List<Object> get props => [];
}

class MahamInitial extends AllMahamState {}

class FetchMahamLoading extends AllMahamState {
  const FetchMahamLoading();
}

class FetchMahamSuccessful extends AllMahamState {
  final MahamTList? data;

  const FetchMahamSuccessful(this.data);
}

class FetchMahamFailed extends AllMahamState {
  final String message;
  const FetchMahamFailed(this.message);
}
