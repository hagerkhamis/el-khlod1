// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

import '../../../data/models/my_messages_model/ta3mem.dart';
import '../../../domain/use_cases/ta3mem_use_case.dart';

part 'ta3mem_state.dart';

class Ta3memCubit extends Cubit<Ta3memState> {
  Ta3memUseCase ta3memUseCase;
  Ta3memCubit(this.ta3memUseCase) : super(Ta3memInitial());

  Future<void> getAllTa3mem(String userId, String seen) async {
    emit(const FetchLoading());
    final result = await ta3memUseCase.callAllTa3mem(userId, seen);

    emit(result.fold(FetchFailed.new, FetchSuccessful.new));
  }
}
