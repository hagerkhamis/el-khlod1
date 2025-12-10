// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:elkhlod/Features/ezen/domain/use_cases/ezen_use_case.dart';

part 'delete_ezen_state.dart';

class DeleteEzenCubit extends Cubit<DeleteEzenState> {
  EzenUseCase ezenUseCase;

  DeleteEzenCubit(this.ezenUseCase) : super(DeleteEzenInitial());
  Future<void> deleteEzen(String ezenId, String userId) async {
    emit(const DeleteLoading());
    final result = await ezenUseCase.deleteEzen(ezenId, userId);

    emit(result.fold(DeleteFailed.new, DeleteSuccessful.new));
  }
}
