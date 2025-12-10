part of 'seen_enzarat_cubit.dart';

@immutable
abstract class SeenEnzaratState {
  const SeenEnzaratState();
  List<Object> get props => [];
}

class SeenEnzaratInitial extends SeenEnzaratState {}

class SeenEnzaratLoading extends SeenEnzaratState {
  const SeenEnzaratLoading();
}

class SeenEnzaratSuccessful extends SeenEnzaratState {
  final SeenEnzaratEntity? data;

  const SeenEnzaratSuccessful(this.data);
}

class SeenEnzaratFailed extends SeenEnzaratState {
  final String message;
  const SeenEnzaratFailed(this.message);
}
