// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

import '../../../data/models/my_messages_model/ehsaeyat_model.dart';
import '../../../domain/use_cases/ehsaeyat_use_case.dart';

part 'ehsaeyat_state.dart';

class EhsaeyatCubit extends Cubit<EhsaeyatState> {
  EhsaeyatUseCase ehsaeyatUseCase;
  EhsaeyatCubit(this.ehsaeyatUseCase) : super(EhsaeyatInitial());

  Future<void> getAllEhsaeyat(String userId) async {
    emit(const FetchEhsaeyatLoading());
    final result = await ehsaeyatUseCase.callAllEhsaeyat(userId);

    emit(result.fold(FetchEhsaeyatFailed.new, FetchEhsaeyatSuccessful.new));
  }
}
