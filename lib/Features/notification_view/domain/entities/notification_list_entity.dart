import 'package:equatable/equatable.dart';

class NotificationListEntity extends Equatable {
final  String? id;
final String? fromUser;
final String? toUser;
final String? dateAr;
final String? timeAr;
final String? seen;
final String? seenDate;
final String? seenTime;
final String? fkId;
final String? notifyIdFk;
final String? nCode;
final String? testNum;
final String? title;
final String? fromEmpName;

  const NotificationListEntity(
      {this.id,
      this.fromUser,
      this.toUser,
      this.dateAr,
      this.timeAr,
      this.seen,
      this.seenDate,
      this.seenTime,
      this.fkId,
      this.notifyIdFk,
      this.nCode,
      this.testNum,
      this.title,
      this.fromEmpName});
  @override
  List<Object?> get props => [
        id,
        fromUser,
        toUser,
        dateAr,
        timeAr,
        seen,
        seenDate,
        seenTime,
        fkId,
        notifyIdFk,
        nCode,
        testNum,
        title,
        fromEmpName
      ];
}
