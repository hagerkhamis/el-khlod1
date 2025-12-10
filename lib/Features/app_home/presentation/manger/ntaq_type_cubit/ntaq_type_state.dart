part of 'ntaq_types_cubit.dart';

abstract class NtaqTypesState {
  const NtaqTypesState();
  List<Object> get props => [];
}

class NtaqTypesInitial extends NtaqTypesState {}

class NtaqTypesLoading extends NtaqTypesState {
  const NtaqTypesLoading();
}

class FetchNtaqTypesSuccessful extends NtaqTypesState {
  final NtaqTypesList? data;

  const FetchNtaqTypesSuccessful(this.data);
}

class FetchNtaqTypesFailed extends NtaqTypesState {
  final String message;
  const FetchNtaqTypesFailed(this.message);
}
