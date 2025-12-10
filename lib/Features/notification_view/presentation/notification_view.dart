import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'views/widgets/notification_view_body.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FadeInUp(child: const NotificationViewBody()),
    );
  }
}
