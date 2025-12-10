// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:elkhlod/Features/new_bsama_add_Fingerprint/data/models/finger_print_model/new_finger_print_model.dart';

import '../../domain/use_cases/new_finger_print_use_case.dart';

part 'new_finger_print_state.dart';

class NewFingerPrintCubit extends Cubit<NewFingerPrintState> {
  final NewFingerPrintUseCase fingerPrint;
  bool isLoading = false;
  Position? _currentPosition;

  NewFingerPrintCubit(this.fingerPrint) : super(FingerPrintInitial());

  Future<void> getUserData(
      String empId, dynamic image, BuildContext context) async {
    await _getCurrentPosition(context);

    if (_currentPosition != null) {
      String lat = _currentPosition!.latitude.toString();
      String long = _currentPosition!.longitude.toString();

      emit(const FingerPrintLoading());
      final result = await fingerPrint.call(empId, image, lat, long);

      emit(result.fold(FingerPrintFailed.new, FingerPrintSuccessful.new));
    } else {
      debugPrint('Unable to get current position.');
    }
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      // setState(() {
      //   _currentAddress =
      //       '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      // });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getCurrentPosition(context) async {
    final hasPermission = await _handleLocationPermission(context);
    if (!hasPermission) return;

    try {
      _currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      await _getAddressFromLatLng(_currentPosition!);
    } catch (e) {
      debugPrint('Error getting location: $e');
    }
  }

  Future<bool> _handleLocationPermission(context) async {
    // التحقق من تفعيل خدمات الموقع أولاً
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('خدمات الموقع معطلة. يرجى تفعيلها من الإعدادات.'),
      ));
      await Geolocator.openLocationSettings();
      return false;
    }

    var status = await Permission.location.status;
    if (status.isDenied) {
      // طلب الإذن
      status = await Permission.location.request();
      if (status.isPermanentlyDenied) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied. Please enable them in settings.'),
        ));
        openAppSettings(); // فتح الإعدادات مباشرة
        return false;
      }
    }

    if (status.isGranted) {
      // الإذن تم منحه
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Location permissions are denied.'),
      ));
      return false;
    }
  }
}
