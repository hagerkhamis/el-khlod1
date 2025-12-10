// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../../data/models/message_details_model/datum.dart';
import '../../../domain/use_cases/my_messages_use_case.dart';

part 'seen_message_state.dart';

class SeenMessageCubit extends Cubit<SeenMessageState> {
  MyMessagesUseCase myMessagesUseCase;
  SeenMessageCubit(this.myMessagesUseCase) : super(SeenMessageInitial());

  Future<void> setAsSeen(
    String messageId,
    String toUserId,
  ) async {
    emit(const SeenLoading());
    final result = await myMessagesUseCase.seeMessage(messageId, toUserId);

    emit(result.fold(SeenFailed.new, SeenSuccessful.new));
  }
}
