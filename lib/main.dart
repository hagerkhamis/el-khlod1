import 'package:face_camera/face_camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:elkhlod/Features/new_bsama_add_Fingerprint/domain/entities/new_finger_print_entity.dart';
import 'package:elkhlod/core/utils/simple_bloc_observer.dart';

import 'Features/auth/login/domain/entities/employee_entity.dart';
import 'Features/table/domain/entities/table_entity.dart';
import 'app.dart';
import 'core/utils/constants.dart';
import 'core/utils/functions/setup_service_locator.dart' as di;
import 'dart:io' show Platform;

void main() async {
// inside main
  WidgetsFlutterBinding.ensureInitialized();
  await FaceCamera.initialize();

  await Hive.initFlutter();
  await di.init();
  Hive.registerAdapter(EmployeeEntityAdapter());
  Hive.registerAdapter(TableEntityAdapter());
  Hive.registerAdapter(NewFingerPrintEntityAdapter());

  await Hive.openBox<EmployeeEntity>(kEmployeeDataBox);
  await Hive.openBox<NewFingerPrintEntity>(kNewFingerPrintDataBox);

  await Hive.openBox<TableEntity>(kTableDataBox);
  await Hive.openBox<int>(kLogoutOptionDataBox);

  if (Platform.isAndroid) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCNNWLgOC4ZkirURyZ1Xx9sv48AqMYXBV4",
            authDomain: "Al_Kholoud HR-e9d35.firebaseapp.com",
            projectId: "Al_Kholoud HR-e9d35",
            storageBucket: "Al_Kholoud HR-e9d35.firebasestorage.app",
            messagingSenderId: "542773224115",
            appId: "1:542773224115:android:bc9bcfa52b1793d8d7c6c6",
            measurementId: "G-QGDQY95QPX"));
  } else if (Platform.isIOS) {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyCNNWLgOC4ZkirURyZ1Xx9sv48AqMYXBV4",
              authDomain: "Al_Kholoud HR-e9d35.firebaseapp.com",
              projectId: "Al_Kholoud HR-e9d35",
              storageBucket: "Al_Kholoud HR-e9d35.firebasestorage.app",
              messagingSenderId: "542773224115",
              appId: "1:542773224115:ios:bc9bcfa52b1793d8d7c6c6",
              measurementId: "G-QGDQY95QPX"));
    }
  }

  await FirebaseMessaging.instance.setAutoInitEnabled(true);

  Bloc.observer = SimpleBlocObserver();

  runApp(const FingerPrint());
}
