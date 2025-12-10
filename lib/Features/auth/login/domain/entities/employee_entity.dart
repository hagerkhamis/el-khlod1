import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'employee_entity.g.dart';

typedef EmployeesList = List<EmployeeEntity>;

@HiveType(typeId: 1)
class EmployeeEntity extends Equatable {
  @HiveField(0)
  final String? employeeId;
  @HiveField(1)
  final String? employeeName;
  @HiveField(2)
  final String? employeeCode;
  @HiveField(3)
  final String? cardNum;
  @HiveField(4)
  final String? image;
  @HiveField(5)
  final String? userId;
  @HiveField(6)
  final dynamic departmentName;
  @HiveField(7)
  final String? jobTitle;
  @HiveField(8)
  final dynamic managementName;
  @HiveField(9)
  final String? phoneNumber;

  @HiveField(10)
  final String? percent;

  @HiveField(11)
  final String? empSignature;

  @HiveField(12)
  final String? barcodePath;

  @HiveField(13)
  final String? qrcodePath;

  final String? sendMsg;
  final String? addAgaza;
  final String? addEzn;

  final String? addMobadra;
  final String? addEdary;
  final String? addNashat;

  final String? showNetaq;
  final String? showMainEhsay;
  final String? showAlertScreen;
  final String? addZeyara;
  final String? withAds;
  final String? showZeyara;

  const EmployeeEntity(
      {this.employeeId,
      this.employeeName,
      this.employeeCode,
      this.cardNum,
      this.image,
      this.departmentName,
      this.jobTitle,
      this.managementName,
      this.phoneNumber,
      this.userId,
      this.percent,
      this.empSignature,
      this.barcodePath,
      this.qrcodePath,
      this.sendMsg,
      this.addAgaza,
      this.addEzn,
      this.addMobadra,
      this.addEdary,
      this.addNashat,
      this.showNetaq,
      this.showMainEhsay,
      this.addZeyara,
      this.showAlertScreen,
      this.withAds,
      this.showZeyara});

  @override
  List<Object?> get props => [
        employeeId,
        employeeName,
        employeeCode,
        cardNum,
        image,
        departmentName,
        jobTitle,
        managementName,
        phoneNumber,
        userId,
        percent,
        empSignature,
        barcodePath,
        qrcodePath,
        sendMsg,
        addAgaza,
        addEzn,
        addMobadra,
        addEdary,
        addNashat,
        showNetaq,
        showMainEhsay,
        addZeyara,
        showAlertScreen,
        withAds,
        showZeyara
      ];
}
