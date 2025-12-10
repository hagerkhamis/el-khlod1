import 'package:elkhlod/Features/Splash/domain/entities/show_alert_entity.dart';

class ShowAlert extends ShowAlertEntity {
  const ShowAlert({super.showScreen});

  factory ShowAlert.fromJson(Map<String, dynamic> json) => ShowAlert(
        showScreen: json['show_screen'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['show_screen'] = showScreen;
    return data;
  }
}
