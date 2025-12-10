import 'dart:io';

import 'package:face_camera/face_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/auth/login/domain/entities/employee_entity.dart';
import 'package:elkhlod/Features/new_bsama_add_Fingerprint/domain/entities/new_finger_print_entity.dart';
import 'package:elkhlod/Features/new_bsama_add_Fingerprint/presentation/manger/new_finger_print_cubit.dart';
import 'package:elkhlod/core/utils/constants.dart';
import 'package:elkhlod/core/utils/functions/registration_alert.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? _capturedImage;
  late FaceCameraController controller;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    controller = FaceCameraController(
      autoCapture: false,
      defaultCameraLens: CameraLens.front,
      onCapture: (File? image) {
        var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);

        setState(() => _capturedImage = image);
        // Commons.showToast(context, message: " بنجdjhsjhdjsاح");

        if (box.get(kEmployeeDataBox) != null) {
          BlocProvider.of<NewFingerPrintCubit>(context).getUserData(
              box.get(kEmployeeDataBox)!.employeeCode!, image, context);
        }
      },
      onFaceDetected: (Face? face) {
        //Do something

        // toast
        //  Commons.showToast(context, message: " بنجاح");
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('FaceCamera example app'),
        ),
        body: BlocListener<NewFingerPrintCubit, NewFingerPrintState>(
          listener: (context, state) {
            if (state is FingerPrintSuccessful) {
              AlertDialog alert =
                  alertRegistration(context, state.data.message, () {
                var box =
                    Hive.box<NewFingerPrintEntity>(kNewFingerPrintDataBox);
                box.put(kNewFingerPrintDataBox, state.data.data);
                Navigator.pushReplacementNamed(context, kBottomNavRoute,
                    arguments: 0);
              });

              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                },
              );

              // Navigator.pushReplacementNamed(context, kNewHomeScreen);
            } else if (state is FingerPrintFailed) {
              AlertDialog alert = alertRegistration(context, state.message, () {
                Navigator.pushReplacementNamed(context, kBottomNavRoute,
                    arguments: 0);
              });

              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                },
              );

              // Navigator.pushReplacementNamed(context, kNewHomeScreen);
            }
          },
          child: Builder(builder: (context) {
            if (_capturedImage != null) {
              return Center(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.file(
                      _capturedImage!,
                      width: double.maxFinite,
                      fit: BoxFit.fitWidth,
                    ),
                    BlocBuilder<NewFingerPrintCubit, NewFingerPrintState>(
                      builder: (context, state) {
                        return state is FingerPrintLoading
                            ? const CircularProgressIndicator()
                            : ElevatedButton(
                                onPressed: () =>
                                    setState(() => _capturedImage = null),
                                child: const Text(
                                  'Capture Again',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ));
                      },
                    )
                  ],
                ),
              );
            }
            return SmartFaceCamera(
                controller: controller,
                message: 'Center your face in the square',
                messageBuilder: (context, face) {
                  if (face == null) {
                    return _message('Place your face in the camera');
                  }
                  if (!face.wellPositioned) {
                    return _message('Center your face in the square');
                  }
                  return const SizedBox.shrink();
                });
          }),
        ));
  }

  Widget _message(String msg) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 15),
        child: Text(msg,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 14, height: 1.5, fontWeight: FontWeight.w400)),
      );
}
