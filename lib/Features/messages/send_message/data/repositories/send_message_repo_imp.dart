import '../../domain/repositories/send_message_repo.dart';
import '../data_sources/send_message_remote_data_source.dart';

class SendMessageRepoImpl extends SendMessageRepo {
  final SendMessageRemoteDataSource sendMessageRemoteDataSource;

  SendMessageRepoImpl(this.sendMessageRemoteDataSource);

  @override
  Future<SendMessageResponse> sendMessage(
    String fromEmpId,
    List<int> toEmpId,
    String messageTitle,
    String messageBody,
    dynamic attachment,
  ) async {
    var messageData = await sendMessageRemoteDataSource.sendNewMessage(
      fromEmpId,
      toEmpId,
      messageTitle,
      messageBody,
      attachment,
    );
    return messageData;
  }
}
