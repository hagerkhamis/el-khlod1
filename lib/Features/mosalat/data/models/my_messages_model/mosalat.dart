import '../../../domain/entities/mosalat_entity.dart';

typedef AllMosalatList = List<MosalatEntity>?;

class Mosalat extends MosalatEntity {
  const Mosalat(
      {super.mosalaId,
      super.mosalaDateAr,
      super.empName,
      super.sendToHr,
      super.answerReasons,
      super.answerMobarer,
      super.answerOther,
      super.numMokalfat,
      super.haveEgraa,
      super.mosalaFile,
      super.mokalfatList});

  factory Mosalat.fromJson(Map<String, dynamic> json) => Mosalat(
        mosalaId: json["mosala_id"],
        mosalaDateAr: json["mosala_date_ar"],
        empName: json["emp_name"],
        sendToHr: json["send_to_hr"],
        answerReasons: json["answer_reasons"],
        answerMobarer: json["answer_mobarer"],
        answerOther: json["answer_other"],
        numMokalfat: json["num_mokalfat"],
        haveEgraa: json["have_egraa"],
        mosalaFile: json["mosala_file"],
        mokalfatList: List<MokalfatList>.from(
            json["mokalfat_list"].map((x) => MokalfatList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "mosala_id": mosalaId,
        "mosala_date_ar": mosalaDateAr,
        "emp_name": empName,
        "send_to_hr": sendToHr,
        "answer_reasons": answerReasons,
        "answer_mobarer": answerMobarer,
        "answer_other": answerOther,
        "num_mokalfat": numMokalfat,
        "have_egraa": haveEgraa,
        "mosala_file": mosalaFile,
        "mokalfat_list": mokalfatList,
      };
}

class MokalfatList extends MokalfatListEntity {
  const MokalfatList({
    super.id,
    super.mosalaIdFk,
    super.mokalfaId,
    super.mokalfaName,
  });

  factory MokalfatList.fromJson(Map<String, dynamic> json) => MokalfatList(
        id: json["id"],
        mosalaIdFk: json["mosala_id_fk"],
        mokalfaId: json["mokalfa_id"],
        mokalfaName: json["mokalfa_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mosala_id_fk": mosalaIdFk,
        "mokalfa_id": mokalfaId,
        "mokalfa_name": mokalfaName,
      };
}
