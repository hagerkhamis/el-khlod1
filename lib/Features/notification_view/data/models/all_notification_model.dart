import 'package:elkhlod/core/utils/functions/base_one_response.dart';

import '../../domain/entities/notification_list_entity.dart';

class NotificationListModel extends BaseOneResponse {
  const NotificationListModel({
    super.status,
    super.data,
    super.message,
  });

  factory NotificationListModel.fromJson(Map<String, dynamic> json) {
    return NotificationListModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => NotificationList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() =>
      {'status': status, 'message': message, 'data': data};
}

typedef NotificationTList = List<NotificationListEntity>?;

class NotificationList extends NotificationListEntity {
  const NotificationList({
    super.id,
    super.dateAr,
    super.fkId,
    super.fromEmpName,
    super.fromUser,
    super.nCode,
    super.notifyIdFk,
    super.seen,
    super.seenDate,
    super.seenTime,
    super.testNum,
    super.timeAr,
    super.title,
    super.toUser,
  });

  factory NotificationList.fromJson(Map<String, dynamic> json) =>
      NotificationList(
        id: json['id'],
        dateAr: json['date_ar'],
        fkId: json['fk_id'],
        fromEmpName: json['from_emp_name'],
        fromUser: json['from_user'],
        nCode: json['n_code'],
        notifyIdFk: json['notify_id_fk'],
        seen: json['seen'],
        seenDate: json['seen_date'],
        seenTime: json['seen_time'],
        testNum: json['test_num'],
        timeAr: json['time_ar'],
        title: json['title'],
        toUser: json['to_user'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'date_ar': dateAr,
        'fk_id': fkId,
        'from_emp_name': fromEmpName,
        'from_user': fromUser,
        'n_code': nCode,
        'notify_id_fk': notifyIdFk,
        'seen': seen,
        'seen_date': seenDate,
        'seen_time': seenTime,
        'test_num': testNum,
        'time_ar': timeAr,
        'title': title,
        'to_user': toUser,
      };
}
