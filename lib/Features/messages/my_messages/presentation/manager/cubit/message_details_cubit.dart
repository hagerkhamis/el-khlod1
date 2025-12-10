// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../../data/models/message_details_model/datum.dart';
import '../../../domain/use_cases/my_messages_use_case.dart';

part 'message_details_state.dart';

class MessageDetailsCubit extends Cubit<MessageDetailsState> {
  MyMessagesUseCase myMessagesUseCase;
  MessageDetailsCubit(this.myMessagesUseCase) : super(MessageDetailsInitial());
  Future<void> getMessageDetails(
    String messageId,
  ) async {
    emit(const MessageDetailsLoading());
    final result = await myMessagesUseCase.callMessageDetails(messageId);

    emit(result.fold(MessageDetailsFailed.new, MessageDetailsSuccessful.new));
  }
}
