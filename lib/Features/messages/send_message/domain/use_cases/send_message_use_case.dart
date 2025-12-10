import '../../data/data_sources/send_message_remote_data_source.dart';
import '../entities/send_message_entity.dart';
import '../repositories/send_message_repo.dart';

abstract class UseCase<type> {
  Future<SendMessageResponse> call(
    String fromEmpId,
    List<int> toEmpId,
    String messageTitle,
    String messageBody,
    dynamic attachment,
  );
}

class SendMessageUseCase extends UseCase<SendMessageEntity> {
  final SendMessageRepo sendMessageRepo;
  SendMessageUseCase(this.sendMessageRepo);

  @override
  Future<SendMessageResponse> call(String fromEmpId, List<int> toEmpId,
      String messageTitle, String messageBody, dynamic attachment) async {
    return await sendMessageRepo.sendMessage(
        fromEmpId, toEmpId, messageTitle, messageBody, attachment);
  }
}
