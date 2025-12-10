// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:elkhlod/Features/mobadarat/domain/use_cases/type_mobadarat_use_case.dart';

part 'delete_mobadarat_state.dart';

class DeleteMobadaratCubit extends Cubit<DeleteMobadaratState> {
  MobadaratUseCase mobadaratUseCase;

  DeleteMobadaratCubit(this.mobadaratUseCase) : super(DeleteMobadaratInitial());
  Future<void> deleteMobadarat(String mobadaratId, String userId) async {
    emit(const DeleteMobadaratLoading());
    final result = await mobadaratUseCase.deleteMobadarat(mobadaratId, userId);

    emit(result.fold(DeleteMobadaratFailed.new, DeleteMobadaratSuccessful.new));
  }
}
