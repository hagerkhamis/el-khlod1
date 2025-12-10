import 'dart:io';

import 'package:face_camera/face_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/auth/login/domain/entities/employee_entity.dart';
import 'package:elkhlod/Features/bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import 'package:elkhlod/core/utils/constants.dart';
import 'package:elkhlod/core/utils/functions/registration_alert.dart';

import '../../../../../core/utils/commons.dart';
import '../../manager/add_location/add_mohema_cubit.dart';

class AddMohema extends StatefulWidget {
  const AddMohema({super.key});

  @override
  State<AddMohema> createState() => _AddMohemaState();
}

class _AddMohemaState extends State<AddMohema> {
  File? _capturedImage;
  late FaceCameraController controller;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    List<String> ides = BlocProvider.of<BottomNavCubit>(context).details ?? {};
    controller = FaceCameraController(
      autoCapture: false,
      defaultCameraLens: CameraLens.front,
      onCapture: (File? image) {
        var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);

        setState(() => _capturedImage = image);
        // Commons.showToast(context, message: " بنجdjhsjhdjsاح");

        if (box.get(kEmployeeDataBox) != null && ides.isNotEmpty) {
          BlocProvider.of<AddMohemaCubit>(context).getUserData(
            context,
            box.get(kEmployeeDataBox)!.employeeId!,
            image,
            ides[0], // بدل ides[0]
            ides[1], // بدل ides[1]
            ides[2], // بدل ides[2]
          );
        } else {
          Commons.showToast(context, message: "يرجى اختيار المامورية");
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
          title: const Text('اضافه مامورية عمل '),
        ),
        body: BlocListener<AddMohemaCubit, AddMohemaState>(
          listener: (context, state) {
            if (state is AddMohemaSuccessful) {
              AlertDialog alert = alertRegistration(context, state.message, () {
                // var box =
                //     Hive.box<NewFingerPrintEntity>(kNewFingerPrintDataBox);
                // box.put(kNewFingerPrintDataBox, state.data);
                Navigator.pop(context);
                BlocProvider.of<BottomNavCubit>(context)
                    .navigationQueue
                    .removeLast();

                BlocProvider.of<BottomNavCubit>(context).updateBottomNavIndex(
                    BlocProvider.of<BottomNavCubit>(context)
                        .navigationQueue
                        .last);
              });

              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                },
              );

              // Navigator.pushReplacementNamed(context, kNewHomeScreen);
            } else if (state is AddMohemaFailed) {
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
              Navigator.pop(context);

              BlocProvider.of<BottomNavCubit>(context)
                  .navigationQueue
                  .removeLast();

              BlocProvider.of<BottomNavCubit>(context).updateBottomNavIndex(
                  BlocProvider.of<BottomNavCubit>(context)
                      .navigationQueue
                      .last);
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
                    BlocBuilder<AddMohemaCubit, AddMohemaState>(
                      builder: (context, state) {
                        return state is AddMohemaLoading
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
