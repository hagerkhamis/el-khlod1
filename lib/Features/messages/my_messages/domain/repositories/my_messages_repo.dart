import 'package:elkhlod/Features/messages/my_messages/data/data_sources/remote_data_source/message_details_remote_data_source.dart';

import '../../data/data_sources/remote_data_source/all_messages_remote_data_source.dart';
import '../../data/data_sources/remote_data_source/delete_messages_remote_data_Source.dart';
import '../../data/data_sources/remote_data_source/sent_messages_remote_data_source.dart';

abstract class MessagesRepo {
  Future<AllMessagesResponse> fetchAllMessages(
    String userId,
    String seen,
  );
  Future<SentMessagesResponse> fetchSentMessages(
    String userId,
  );
  Future<MessageDetailsResponse> fetchMessageDetails(
    String messageId,
  );
  Future<MessageDetailsResponse> setAsSeen(
    String messageId,
    String toUserId,
  );
  Future<DeleteMessageResponse> deleteMessage(
    String messageId,
    String toUserId,
  );
}
