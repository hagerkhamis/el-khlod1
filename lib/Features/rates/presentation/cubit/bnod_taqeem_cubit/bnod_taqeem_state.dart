part of 'bnod_taqeem_cubit.dart';

abstract class BnodTaqeemState {
  const BnodTaqeemState();
  List<Object> get props => [];
}

class MyMessagesInitial extends BnodTaqeemState {}

class FetchBnodLoading extends BnodTaqeemState {
  const FetchBnodLoading();
}

class FetchBnodSuccessful extends BnodTaqeemState {
  final BnodTaqeemList? data;

  const FetchBnodSuccessful(this.data);
}

class FetchBnodFailed extends BnodTaqeemState {
  final String message;
  const FetchBnodFailed(this.message);
}
