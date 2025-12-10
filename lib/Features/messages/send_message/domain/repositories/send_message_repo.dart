import '../../data/data_sources/send_message_remote_data_source.dart';

abstract class SendMessageRepo {
  Future<SendMessageResponse> sendMessage(String fromEmpId, List<int> toEmpId,
      String messageTitle, String messageBody, dynamic attachment);
}
