part of 'all_teacher_cubit.dart';

abstract class AllTeacherState {
  const AllTeacherState();
  List<Object> get props => [];
}

class AllTeacherInitialState extends AllTeacherState {}

class FetchTeacherLoading extends AllTeacherState {
  const FetchTeacherLoading();
}

class AllTeacherFetchSuccess extends AllTeacherState {
  final TeachersTList? data;

  const AllTeacherFetchSuccess(this.data);
}

class AllTeacherFetchFailure extends AllTeacherState {
  final String message;
  const AllTeacherFetchFailure(this.message);
}
