import 'package:elkhlod/Features/messages/my_messages/data/data_sources/remote_data_source/delete_messages_remote_data_Source.dart';
import 'package:elkhlod/Features/messages/my_messages/data/data_sources/remote_data_source/seen_message_remote_data_source.dart';

import '../../domain/repositories/my_messages_repo.dart';
import '../data_sources/remote_data_source/all_messages_remote_data_source.dart';
import '../data_sources/remote_data_source/message_details_remote_data_source.dart';
import '../data_sources/remote_data_source/sent_messages_remote_data_source.dart';

class MessagesRepositoryImp extends MessagesRepo {
  final AllMessagesRemoteDataSource myMessagesRemoteDataSource;
  final SentMessagesRemoteDataSource sentMessagesRemoteDataSource;
  final MessageDetailsRemoteDataSource messageDetailsRemoteDataSource;
  final SeenMessageRemoteDataSource seenMessageRemoteDataSource;
  final DeleteMessageRemoteDataSource deleteMessageRemoteDataSource;

  MessagesRepositoryImp(
      this.myMessagesRemoteDataSource,
      this.seenMessageRemoteDataSource,
      this.sentMessagesRemoteDataSource,
      this.messageDetailsRemoteDataSource,
      this.deleteMessageRemoteDataSource);

  @override
  Future<AllMessagesResponse> fetchAllMessages(
      String userId, String seen) async {
    var userData =
        await myMessagesRemoteDataSource.fetchAllMessages(userId, seen);

    return userData;
  }

  @override
  Future<SentMessagesResponse> fetchSentMessages(String userId) async {
    var userData = await sentMessagesRemoteDataSource.fetchSentMessages(userId);

    return userData;
  }

  @override
  Future<MessageDetailsResponse> fetchMessageDetails(String messageId) async {
    var userData =
        await messageDetailsRemoteDataSource.fetchMessageDetails(messageId);

    return userData;
  }

  @override
  Future<MessageDetailsResponse> setAsSeen(
      String messageId, String toUserId) async {
    var userData = await seenMessageRemoteDataSource.seeMessage(
      messageId,
      toUserId,
    );

    return userData;
  }

  @override
  Future<DeleteMessageResponse> deleteMessage(
      String messageId, String toUserId) async {
    var userData = await deleteMessageRemoteDataSource.deleteMessage(
      messageId,
      toUserId,
    );

    return userData;
  }
}
