// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:elkhlod/Features/enzarat/domain/entities/seen_ta3mem_entity.dart';

import '../../../domain/use_cases/enzarat_use_case.dart';

part 'seen_enzarat_state.dart';

class SeenEnzaratCubit extends Cubit<SeenEnzaratState> {
  EnzaratUseCase enzaratUseCase;

  SeenEnzaratCubit(this.enzaratUseCase) : super(SeenEnzaratInitial());
  Future<void> seenEnzarat(
    String messageId,
    String toUserId,
  ) async {
    emit(const SeenEnzaratLoading());
    final result = await enzaratUseCase.seenEnzarat(messageId, toUserId);

    emit(
      result.fold(
        SeenEnzaratFailed.new,
        SeenEnzaratSuccessful.new,
      ),
    );
  }
}
