// ignore: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../../domain/use_cases/type_mobadarat_use_case.dart';

part 'add_wathaek_state.dart';

class AddWathaekCubit extends Cubit<AddWathaekState> {
  WathaekUseCase wathaekUseCase;

  AddWathaekCubit(this.wathaekUseCase) : super(AddWathaekInitial());
  Future<void> addWathaek(
      String empId, String typeId, String reason, dynamic listFiles) async {
    emit(const AddWathaekLoading());
    final result =
        await wathaekUseCase.addWathaek(empId, typeId, reason, listFiles);

    emit(
      result.fold(
        AddWathaekFailed.new,
        AddWathaekSuccessful.new,
      ),
    );
  }
}
