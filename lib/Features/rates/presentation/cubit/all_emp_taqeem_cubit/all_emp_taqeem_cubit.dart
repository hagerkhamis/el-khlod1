// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

import '../../../../auth/login/domain/entities/employee_entity.dart';
import '../../../domain/usecases/rate_use_case.dart';

part 'all_emp_taqeem_state.dart';

class AllEmpTaqeemCubit extends Cubit<AllEmpTaqeemState> {
  RateUseCase rateUseCase;
  AllEmpTaqeemCubit(this.rateUseCase) : super(MyMessagesInitial());

  Future<void> getAllEmployeesList(
      String userId, String search, String idType) async {
    emit(const FetchLoading());
    final result = await rateUseCase.allEmpTaqeem(userId, search, idType);

    emit(result.fold(FetchFailed.new, FetchSuccessful.new));
  }
}
