import 'package:equatable/equatable.dart';

class NtaqEntity extends Equatable {
  final String? title;
  final int? point;
  final String? netaqType;
  final String? netaqColor;
  final String? netaqMsg;
  final String? netaqImg;
  final int? netaqStars;
  final String? netaqColor1;
  final String? netaqColor2;
  final String? netaqColor3;
  final String? fontColor;

  const NtaqEntity(
      {this.title,
      this.point,
      this.netaqType,
      this.netaqColor,
      this.netaqMsg,
      this.netaqImg,
      this.netaqStars,
      this.netaqColor1,
      this.netaqColor2,
      this.netaqColor3,
      this.fontColor});
  @override
  List<Object?> get props => [
        title,
        point,
        netaqType,
        netaqColor,
        netaqMsg,
        netaqImg,
        netaqStars,
        netaqColor1,
        netaqColor2,
        netaqColor3,
        fontColor
      ];
}
