// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:elkhlod/Features/rates/data/models/bnod_taqeem_model.dart';

import '../../../domain/usecases/rate_use_case.dart';

part 'bnod_taqeem_state.dart';

class BnodTaqeemCubit extends Cubit<BnodTaqeemState> {
  RateUseCase rateUseCase;
  BnodTaqeemCubit(this.rateUseCase) : super(MyMessagesInitial());

  Future<void> getBnodTaqeemList(String typeId) async {
    emit(const FetchBnodLoading());
    final result = await rateUseCase.bnodTaqeem(typeId);

    emit(result.fold(FetchBnodFailed.new, FetchBnodSuccessful.new));
  }
}
