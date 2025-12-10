import 'dart:io';

import 'package:face_camera/face_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/add_location/presentation/manager/add_location/add_location_cubit.dart';
import 'package:elkhlod/Features/auth/login/domain/entities/employee_entity.dart';
import 'package:elkhlod/Features/bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import 'package:elkhlod/core/utils/constants.dart';
import 'package:elkhlod/core/utils/functions/registration_alert.dart';

import '../../../../../core/utils/commons.dart';

class AddLocation extends StatefulWidget {
  const AddLocation({super.key});

  @override
  State<AddLocation> createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  File? _capturedImage;
  late FaceCameraController controller;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    List<String> ides;

    ides = BlocProvider.of<BottomNavCubit>(context).details!;
    controller = FaceCameraController(
      autoCapture: false,
      defaultCameraLens: CameraLens.front,
      onCapture: (File? image) {
        var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);

        setState(() => _capturedImage = image);
        // Commons.showToast(context, message: " بنجdjhsjhdjsاح");

        if (box.get(kEmployeeDataBox) != null && ides.isNotEmpty) {
          BlocProvider.of<AddLocationCubit>(context).getUserData(
              box.get(kEmployeeDataBox)!.employeeId!,
              image,
              context,
              ides[0],
              ides[1]);
        } else {
          Commons.showToast(context, message: "يرجى اختيار الموقع");
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
          title: const Text('اضافه موقع جديد'),
        ),
        body: BlocListener<AddLocationCubit, AddLocationState>(
          listener: (context, state) {
            if (state is AddLocationSuccessful) {
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
            } else if (state is AddLocationFailed) {
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
                    BlocBuilder<AddLocationCubit, AddLocationState>(
                      builder: (context, state) {
                        return state is AddLocationLoading
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
