part of 'all_mobadarat_cubit.dart';

abstract class AllMobadaratState {
  const AllMobadaratState();
  List<Object> get props => [];
}

class MobadaratInitial extends AllMobadaratState {}

class FetchMobadaratLoading extends AllMobadaratState {
  const FetchMobadaratLoading();
}

class FetchMobadaratSuccessful extends AllMobadaratState {
  final MobadaratTList? data;

  const FetchMobadaratSuccessful(this.data);
}

class FetchMobadaratFailed extends AllMobadaratState {
  final String message;
  const FetchMobadaratFailed(this.message);
}
