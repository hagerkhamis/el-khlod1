part of 'all_wathaek_cubit.dart';

abstract class AllWathaekState {
  const AllWathaekState();
  List<Object> get props => [];
}

class WathaekInitial extends AllWathaekState {}

class FetchWathaekLoading extends AllWathaekState {
  const FetchWathaekLoading();
}

class FetchWathaekSuccessful extends AllWathaekState {
  final WathaekList? data;

  const FetchWathaekSuccessful(this.data);
}

class FetchWathaekFailed extends AllWathaekState {
  final String message;
  const FetchWathaekFailed(this.message);
}
