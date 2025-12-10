part of 'maham_table_cubit.dart';

abstract class MahamTableState {
  const MahamTableState();
  List<Object> get props => [];
}

class FetchInitial extends MahamTableState {}

class FetchLoading extends MahamTableState {
  const FetchLoading();
}

class FetchSuccessful extends MahamTableState {
  final MahamTableList? data;

  const FetchSuccessful(this.data);
}

class FetchFailed extends MahamTableState {
  final String message;
  const FetchFailed(this.message);
}
