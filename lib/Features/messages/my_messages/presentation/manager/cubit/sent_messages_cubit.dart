// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../../data/models/sent_messages_model/datum.dart';
import '../../../domain/use_cases/my_messages_use_case.dart';

part 'sent_messages_state.dart';

class SentMessagesCubit extends Cubit<SentMessagesState> {
  MyMessagesUseCase myMessagesUseCase;
  SentMessagesCubit(this.myMessagesUseCase) : super(SentMessagesInitial());

  Future<void> getSentMessages(
    String userId,
  ) async {
    emit(const SentMessagesLoading());
    final result = await myMessagesUseCase.callSentMessages(userId);

    emit(result.fold(SentMessagesFailed.new, SentMessagesSuccessful.new));
  }
}
