// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../../domain/entities/seen_ta3mem_entity.dart';
import '../../../domain/use_cases/ta3mem_use_case.dart';

part 'seen_ta3mem_state.dart';

class SeenTa3memCubit extends Cubit<SeenTa3memState> {
  Ta3memUseCase ta3memUseCase;

  SeenTa3memCubit(this.ta3memUseCase) : super(SeenTa3memInitial());
  Future<void> deleteMessage(
    String messageId,
    String toUserId,
  ) async {
    emit(const SeenTa3memLoading());
    final result = await ta3memUseCase.seenTa3mem(messageId, toUserId);

    emit(
      result.fold(
        SeenTa3memFailed.new,
        SeenTa3memSuccessful.new,
      ),
    );
  }
}
