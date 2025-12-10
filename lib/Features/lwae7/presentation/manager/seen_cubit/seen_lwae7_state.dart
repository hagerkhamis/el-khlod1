part of 'seen_lwae7_cubit.dart';

@immutable
abstract class SeenLwae7State {
  const SeenLwae7State();
  List<Object> get props => [];
}

class SeenLwae7Initial extends SeenLwae7State {}

class SeenLwae7Loading extends SeenLwae7State {
  const SeenLwae7Loading();
}

class SeenLwae7Successful extends SeenLwae7State {
  final SeenLwae7Entity? data;

  const SeenLwae7Successful(this.data);
}

class SeenLwae7Failed extends SeenLwae7State {
  final String message;
  const SeenLwae7Failed(this.message);
}
