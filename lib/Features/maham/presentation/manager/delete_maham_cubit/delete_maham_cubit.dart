// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../../domain/use_cases/type_maham_use_case.dart';


part 'delete_maham_state.dart';

class DeleteMahamCubit extends Cubit<DeleteMahamState> {
  MahamUseCase mahamUseCase;

  DeleteMahamCubit(this.mahamUseCase) : super(DeleteMahamInitial());
  Future<void> deleteMaham(String mahamId, String userId) async {
    emit(const DeleteMobadaratLoading());
    final result = await mahamUseCase.deleteMaham(mahamId, userId);

    emit(result.fold(DeleteMahamFailed.new, DeleteMahamSuccessful.new));
  }
}
