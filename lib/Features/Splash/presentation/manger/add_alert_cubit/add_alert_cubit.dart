// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:elkhlod/Features/Splash/domain/use_case/alert_use_case.dart';

part 'add_alert_state.dart';

class AddAlertCubit extends Cubit<AddAlertState> {
  AlertUseCase alertUseCase;

  AddAlertCubit(this.alertUseCase) : super(AddAlertInitial());
  Future<void> addAlert(String empId, String eqrarId) async {
    emit(const AddAlertLoading());
    final result = await alertUseCase.addAlert(empId, eqrarId);

    emit(
      result.fold(
        AddAlertFailed.new,
        AddAlertSuccessful.new,
      ),
    );
  }
}
