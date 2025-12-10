// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:elkhlod/Features/mosalat/domain/use_cases/mosalat_use_case.dart';

part 'add_mosalat_state.dart';

class AddAnswerMosalatCubit extends Cubit<AddAnswerMosalatState> {
  MosalatUseCase mosalatUseCase;

  AddAnswerMosalatCubit(this.mosalatUseCase) : super(SeenMosalatInitial());
  Future<void> addAnswer(
    String messageId,
    String toUserId,
    String mobarer,
    String other,
    String reason,
    dynamic attachment,
  ) async {
    emit(const SeenMosalatLoading());
    final result = await mosalatUseCase.seenMosalat(
        messageId, toUserId, mobarer, other, reason, attachment);

    emit(
      result.fold(
        SeenMosalatFailed.new,
        SeenMosalatSuccessful.new,
      ),
    );
  }
}
