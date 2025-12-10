// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

import '../../../data/models/types_rate_model.dart';
import '../../../domain/usecases/rate_use_case.dart';

part 'types_rate_state.dart';

class TypesRateCubit extends Cubit<TypesRateState> {
  RateUseCase rateUseCase;
  TypesRateCubit(this.rateUseCase) : super(MyMessagesInitial());

  Future<void> typesRate() async {
    emit(const FetchLoading());
    final result = await rateUseCase.typesRate();

    emit(result.fold(FetchFailed.new, FetchSuccessful.new));
  }
}
