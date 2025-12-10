part of 'all_visits_cubit.dart';

abstract class AllVisitsState {
  const AllVisitsState();
  List<Object> get props => [];
}

class AllVisitsInitialState extends AllVisitsState {}

class FetchVisitsLoading extends AllVisitsState {
  const FetchVisitsLoading();
}

class AllVisitsFetchSuccess extends AllVisitsState {
  final VisitsTList? data;

  const AllVisitsFetchSuccess(this.data);
}

class AllVisitsFetchFailure extends AllVisitsState {
  final String message;
  const AllVisitsFetchFailure(this.message);
}
