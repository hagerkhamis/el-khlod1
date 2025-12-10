import 'package:elkhlod/Features/Splash/domain/entities/alert_entity.dart';


class Alert extends AlertEntity {
  const Alert({
    super.id,
    super.title,
    super.details,
  });

  factory Alert.fromJson(Map<String, dynamic> json) => Alert(
        id: json['id'],
        title: json['title'],
        details: json['details'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['details'] = details;
    return data;
  }
}
