// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:elkhlod/Features/vacation/domain/use_cases/vacation_use_case.dart';

part 'add_vacation_state.dart';

class AddVacationCubit extends Cubit<AddVacationState> {
  VacationUseCase vacationUseCase;

  AddVacationCubit(this.vacationUseCase) : super(DeleteMessageInitial());
  Future<void> addVacation(String empId, String typeId, String fromTime,
      String toTime, String reason, dynamic attachment) async {
    emit(const DeleteLoading());
    final result =
        await vacationUseCase.addEzen(empId, typeId, fromTime, toTime, reason, attachment);

    emit(
      result.fold(
        DeleteFailed.new,
        DeleteSuccessful.new,
      ),
    );
  }

  Future<void> editVacation(String ezenId, String empId, String typeId,
      String fromTime, String toTime, String reason) async {
    emit(const DeleteLoading());
    final result = await vacationUseCase.editEzen(
        ezenId, empId, typeId, fromTime, toTime, reason);

    emit(
      result.fold(
        DeleteFailed.new,
        DeleteSuccessful.new,
      ),
    );
  }
}
