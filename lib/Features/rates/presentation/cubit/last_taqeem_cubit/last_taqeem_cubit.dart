// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:elkhlod/Features/rates/data/models/last_taqeem_model.dart';

import '../../../domain/usecases/rate_use_case.dart';

part 'last_taqeem_state.dart';

class LastTaqeemCubit extends Cubit<LastTaqeemState> {
  RateUseCase rateUseCase;
  LastTaqeemCubit(this.rateUseCase) : super(LastInitial());

  Future<void> getLastTaqeemList(String userId, String forEmpId) async {
    emit(const LastFetchLoading());
    final result = await rateUseCase.lastTaqeem(userId, forEmpId);

    emit(result.fold(LastFetchFailed.new, LastFetchSuccessful.new));
  }
}
