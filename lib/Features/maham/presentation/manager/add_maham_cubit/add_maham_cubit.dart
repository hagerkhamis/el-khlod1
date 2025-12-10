// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:elkhlod/Features/maham/domain/use_cases/type_maham_use_case.dart';

part 'add_maham_state.dart';

class AddMahamCubit extends Cubit<AddMahamState> {
  MahamUseCase mahamUseCase;

  AddMahamCubit(this.mahamUseCase) : super(AddMahamInitial());
  Future<void> addMaham(
      String empId, String typeId, String reason, String status) async {
    emit(const AddMahamLoading());
    final result = await mahamUseCase.addMaham(empId, typeId, reason, status);

    emit(
      result.fold(
        AddMahamFailed.new,
        AddMahamSuccessful.new,
      ),
    );
  }
}
