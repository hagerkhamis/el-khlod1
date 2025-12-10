// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../../domain/entities/delete_message_entity.dart';
import '../../../domain/use_cases/my_messages_use_case.dart';

part 'delete_message_state.dart';

class DeleteMessageCubit extends Cubit<DeleteMessageState> {
  MyMessagesUseCase myMessagesUseCase;

  DeleteMessageCubit(this.myMessagesUseCase) : super(DeleteMessageInitial());
  Future<void> deleteMessage(
    String messageId,
    String toUserId,
  ) async {
    emit(const DeleteLoading());
    final result = await myMessagesUseCase.deleteMessage(messageId, toUserId);

    emit(
      result.fold(
        DeleteFailed.new,
        DeleteSuccessful.new,
      ),
    );
  }
}
