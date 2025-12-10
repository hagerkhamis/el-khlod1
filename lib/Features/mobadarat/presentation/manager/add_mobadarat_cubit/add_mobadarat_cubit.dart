// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:elkhlod/Features/mobadarat/domain/use_cases/type_mobadarat_use_case.dart';

part 'add_mobadarat_state.dart';

class AddMobadaratCubit extends Cubit<AddMobadaratState> {
  MobadaratUseCase mobadaratUseCase;

  AddMobadaratCubit(this.mobadaratUseCase) : super(AddMobadaratInitial());
  Future<void> addMobadarat(String empId, String typeId, String reason) async {
    emit(const AddMobadaratLoading());
    final result = await mobadaratUseCase.addMobadarat(empId, typeId, reason);

    emit(
      result.fold(
        AddMobadaratFailed.new,
        AddMobadaratSuccessful.new,
      ),
    );
  }
}
