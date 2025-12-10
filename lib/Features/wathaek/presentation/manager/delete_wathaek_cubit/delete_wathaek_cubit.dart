// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../../domain/use_cases/type_mobadarat_use_case.dart';

part 'delete_wathaek_state.dart';

class DeleteWathaekCubit extends Cubit<DeleteWathaekState> {
  WathaekUseCase wathaekUseCase;

  DeleteWathaekCubit(this.wathaekUseCase) : super(DeleteWathaekInitial());
  Future<void> deleteWathaek(String wathaekId, String userId) async {
    emit(const DeleteWathaekLoading());
    final result = await wathaekUseCase.deleteWathaek(wathaekId, userId);

    emit(result.fold(DeleteWathaekFailed.new, DeleteWathaekSuccessful.new));
  }
}
