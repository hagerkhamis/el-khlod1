// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:elkhlod/Features/Splash/domain/entities/alert_entity.dart';
import 'package:elkhlod/Features/Splash/domain/use_case/alert_use_case.dart';

part 'alert_state.dart';

class AlertCubit extends Cubit<AlertState> {
  AlertUseCase alertUseCase;

  AlertCubit(this.alertUseCase) : super(AlertInitial());
  Future<void> getAlert(String empId) async {
    emit(const AlertLoading());
    final result = await alertUseCase.getALert(empId);

    emit(
      result.fold(
        AlertFailed.new,
        AlertSuccessful.new,
      ),
    );
  }
}
