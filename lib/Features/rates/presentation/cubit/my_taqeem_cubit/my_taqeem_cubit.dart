// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:elkhlod/Features/rates/data/models/last_taqeem_model.dart';

import '../../../domain/usecases/rate_use_case.dart';

part 'my_taqeem_state.dart';

class MyTaqeemCubit extends Cubit<MyTaqeemState> {
  RateUseCase rateUseCase;
  MyTaqeemCubit(this.rateUseCase) : super(Initial());

  Future<void> getMyTaqeemList() async {
    emit(const FetchLoading());
    final result = await rateUseCase.myTaqeem();

    emit(result.fold(FetchFailed.new, FetchSuccessful.new));
  }
}
