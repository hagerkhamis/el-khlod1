part of 'all_bnod_cubit.dart';

abstract class AllBnodState {
  const AllBnodState();
  List<Object> get props => [];
}

class AllBnodInitialState extends AllBnodState {}

class FetchBnodLoading extends AllBnodState {
  const FetchBnodLoading();
}

class AllBnodFetchSuccess extends AllBnodState {
  final BandsTList? data;

  const AllBnodFetchSuccess(this.data);
}

class AllBnodFetchFailure extends AllBnodState {
  final String message;
  const AllBnodFetchFailure(this.message);
}
