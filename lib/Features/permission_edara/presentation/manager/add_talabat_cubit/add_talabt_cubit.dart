// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:elkhlod/Features/permission_edara/domain/use_cases/type_ezen_use_case.dart';

part 'add_talabat_state.dart';

class AddTalabtCubit extends Cubit<AddTalabatState> {
  TalabatUseCase myTalabatUseCase;

  AddTalabtCubit(this.myTalabatUseCase) : super(AddTalabatInitial());
  Future<void> addTalabat(String empId, String typeId, String reason) async {
    emit(const AddTalabatLoading());
    final result = await myTalabatUseCase.addTalab(empId, typeId, reason);

    emit(
      result.fold(
        AddTalabatFailed.new,
        AddTalabatSuccessful.new,
      ),
    );
  }
}
