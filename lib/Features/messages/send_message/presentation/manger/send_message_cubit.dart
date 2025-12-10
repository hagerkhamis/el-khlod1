// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import '../../domain/entities/send_message_entity.dart';
import '../../domain/use_cases/send_message_use_case.dart';

part 'send_message_state.dart';

class SendMessageCubit extends Cubit<SendMessageState> {
  final SendMessageUseCase sendMessageRequest;
  bool isLoading = false;

  SendMessageCubit(this.sendMessageRequest) : super(SendMessageInitial());

  Future<void> sendData(
    String fromEmpId,
    List<int> toEmpId,
    String messageTitle,
    String messageBody,
    dynamic attachment,
  ) async {
    emit(const SendMessageLoading());

    final result = await sendMessageRequest.call(
      fromEmpId,
      toEmpId,
      messageTitle,
      messageBody,
      attachment,
    );

    emit(result.fold(SendMessageFailed.new, SendMessageSuccessful.new));
  }
}
