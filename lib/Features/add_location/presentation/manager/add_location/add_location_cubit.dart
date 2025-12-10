// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:elkhlod/Features/add_location/domain/use_cases/locations_use_case.dart';

part 'add_location_state.dart';

class AddLocationCubit extends Cubit<AddLocationState> {
  final LocationsUseCase locationUseCase;
  bool isLoading = false;
  Position? _currentPosition;

  AddLocationCubit(this.locationUseCase) : super(AddLocationInitial());

  Future<void> getUserData(String empId, dynamic image, BuildContext context,
      String siteId, String hodorId) async {
    await _getCurrentPosition(context);

    if (_currentPosition != null) {
      String lat = _currentPosition!.latitude.toString();
      String long = _currentPosition!.longitude.toString();

      emit(const AddLocationLoading());
      final result = await locationUseCase.callAddLocations(
          empId, image, lat, long, siteId, hodorId);

      emit(result.fold(AddLocationFailed.new, AddLocationSuccessful.new));
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
