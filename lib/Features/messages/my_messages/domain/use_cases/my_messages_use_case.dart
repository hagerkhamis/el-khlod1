import 'package:elkhlod/Features/table/domain/entities/table_entity.dart';

import '../../data/data_sources/remote_data_source/all_messages_remote_data_source.dart';
import '../../data/data_sources/remote_data_source/delete_messages_remote_data_Source.dart';
import '../../data/data_sources/remote_data_source/message_details_remote_data_source.dart';
import '../../data/data_sources/remote_data_source/sent_messages_remote_data_source.dart';
import '../repositories/my_messages_repo.dart';

abstract class UseCase<type, Param> {
  Future<AllMessagesResponse> callAllMessages(String userId, String seen);
  Future<SentMessagesResponse> callSentMessages(String userId);
  Future<MessageDetailsResponse> callMessageDetails(String messageId);
}

class MyMessagesUseCase extends UseCase<TableEntity, void> {
  final MessagesRepo myMessagesRepository;
  MyMessagesUseCase(this.myMessagesRepository);
  @override
  Future<AllMessagesResponse> callAllMessages(
      String userId, String seen) async {
    return await myMessagesRepository.fetchAllMessages(userId, seen);
  }

  @override
  Future<SentMessagesResponse> callSentMessages(
    String userId,
  ) async {
    return await myMessagesRepository.fetchSentMessages(userId);
  }

  @override
  Future<MessageDetailsResponse> callMessageDetails(
    String messageId,
  ) async {
    return await myMessagesRepository.fetchMessageDetails(messageId);
  }

  Future<MessageDetailsResponse> seeMessage(
    String messageId,
    String toUserId,
  ) async {
    return await myMessagesRepository.setAsSeen(
      messageId,
      toUserId,
    );
  }

  Future<DeleteMessageResponse> deleteMessage(
      String messageId, String toUserId) async {
    return await myMessagesRepository.deleteMessage(
      messageId,
      toUserId,
    );
  }
}
