part of 'seen_ta3mem_cubit.dart';

@immutable
abstract class SeenTa3memState {
  const SeenTa3memState();
  List<Object> get props => [];
}

class SeenTa3memInitial extends SeenTa3memState {}

class SeenTa3memLoading extends SeenTa3memState {
  const SeenTa3memLoading();
}

class SeenTa3memSuccessful extends SeenTa3memState {
  final SeenTa3memEntity? data;

  const SeenTa3memSuccessful(this.data);
}

class SeenTa3memFailed extends SeenTa3memState {
  final String message;
  const SeenTa3memFailed(this.message);
}
