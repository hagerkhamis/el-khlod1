// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:elkhlod/Features/ezen/domain/use_cases/ezen_use_case.dart';

part 'delete_vacation_state.dart';

class DeleteVacationCubit extends Cubit<DeleteVacationState> {
  EzenUseCase deleteEzenUseCase;

  DeleteVacationCubit(this.deleteEzenUseCase) : super(DeleteMessageInitial());
  Future<void> deleteVacation(String ezenId, String userId) async {
    emit(const DeleteLoading());
    final result = await deleteEzenUseCase.deleteEzen(ezenId, userId);

    emit(result.fold(DeleteFailed.new, DeleteSuccessful.new));
  }
}
