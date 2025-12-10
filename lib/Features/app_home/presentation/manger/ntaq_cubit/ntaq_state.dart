part of 'ntaq_cubit.dart';

abstract class NtaqState {
  const NtaqState();
  List<Object> get props => [];
}

class NtaqInitial extends NtaqState {}

class NtaqLoading extends NtaqState {
  const NtaqLoading();
}

class FetchNtaqSuccessful extends NtaqState {
  final NtaqEntity? data;

  const FetchNtaqSuccessful(this.data);
}

class FetchNtaqFailed extends NtaqState {
  final String message;
  const FetchNtaqFailed(this.message);
}
