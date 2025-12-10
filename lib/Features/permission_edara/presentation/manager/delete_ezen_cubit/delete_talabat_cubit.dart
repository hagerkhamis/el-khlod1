// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:elkhlod/Features/permission_edara/domain/use_cases/type_ezen_use_case.dart';

part 'delete_talabat_state.dart';

class DeleteTalabatCubit extends Cubit<DeleteTalabatState> {
  TalabatUseCase talabtUseCase;

  DeleteTalabatCubit(this.talabtUseCase) : super(DeleteMessageInitial());
  Future<void> deleteTalab(String talabtId, String userId) async {
    emit(const DeleteLoading());
    final result = await talabtUseCase.deleteTalab(talabtId, userId);

    emit(result.fold(DeleteFailed.new, DeleteSuccessful.new));
  }
}
