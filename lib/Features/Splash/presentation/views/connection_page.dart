import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/Splash/presentation/manger/add_alert_cubit/add_alert_cubit.dart';
import 'package:elkhlod/Features/Splash/presentation/manger/alert_cubit/alert_cubit.dart';
import 'package:elkhlod/Features/Splash/presentation/manger/show_alert_cubit/show_alert_cubit.dart';
import 'package:elkhlod/Features/Splash/presentation/views/widgets/agreement_page.dart';
import 'package:elkhlod/Features/auth/login/presentation/views/login_view.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/functions/setup_service_locator.dart';
import '../../../../core/widgets/error_text.dart';
import '../../../auth/login/domain/entities/employee_entity.dart';
import '../../../auth/login/presentation/manger/login_cubit.dart';
import '../../../bottom_nav/presentation/views/bottom_nav.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _connectionStatus = 'ConnectivityResult.wifi';
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  // bool _agree = false;
  var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);

  @override
  void initState() {
    super.initState();
    _checkAlert();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _checkAlert() {
    if (box.get(kEmployeeDataBox) != null) {
      BlocProvider.of<ShowAlertCubit>(context)
          .showAlert(box.get(kEmployeeDataBox)!.employeeId!);
    }
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    List<ConnectivityResult> results = [ConnectivityResult.none];
    try {
      results = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(results);
  }

  @override
  Widget build(BuildContext context) {
    bool status = _connectionStatus == (ConnectivityResult.mobile).toString() ||
        _connectionStatus == (ConnectivityResult.wifi).toString();

    return status
        ? box.get(kEmployeeDataBox) == null
            ? MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => getIt<LoginCubit>(),
                  ),
                ],
                child: const LoginView(),
              )
            : Scaffold(
                body: BlocBuilder<ShowAlertCubit, ShowAlertState>(
                  builder: (context, state) {
                    if (state is ShowAlertSuccessful) {
                      if (state.data.showScreen == "yes") {
                        return MultiBlocProvider(
                          providers: [
                            BlocProvider(
                              create: (context) => getIt<AddAlertCubit>(),
                            ),
                            BlocProvider(
                              create: (context) => getIt<AlertCubit>()
                                ..getAlert(
                                    box.get(kEmployeeDataBox)!.employeeId!),
                            ),
                          ],
                          child: const AgreementPage(),
                        );
                      } else {
                        return const BottomNav(
                          senderId: 0,
                        );
                      }
                    } else if (state is ShowAlertFailed) {
                      return const Center(child: Text(" Check Internet !!"));
                    } else if (state is ShowAlertLoading) {
                      return const Scaffold(
                          body: Center(child: CircularProgressIndicator()));
                    }
                    return const SizedBox();
                  },
                ),
              )
        : Center(
            child: ErrorText(
              width: MediaQuery.of(context).size.width,
              text: 'No internet connection !',
              isNetwork: true,
              image: "assets/images/network_error.png",
            ),
          );
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> results) async {
    ConnectivityResult result = results.isNotEmpty ? results.first : ConnectivityResult.none;
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
      case ConnectivityResult.none:
        setState(() => _connectionStatus = result.toString());
        break;
      default:
        setState(() => _connectionStatus = 'Failed to get connectivity.');
        break;
    }
  }
}
