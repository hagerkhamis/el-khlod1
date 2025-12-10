// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:elkhlod/Features/rates/data/models/month_model.dart';

import '../../../domain/usecases/rate_use_case.dart';

part 'month_state.dart';

class MonthCubit extends Cubit<MonthState> {
  RateUseCase rateUseCase;
  MonthCubit(this.rateUseCase) : super(MyMessagesInitial());

  Future<void> getMonth(String userId) async {
    emit(const FetchLoading());
    final result = await rateUseCase.fetchAllMonth(userId);

    emit(result.fold(FetchFailed.new, FetchSuccessful.new));
  }
}
