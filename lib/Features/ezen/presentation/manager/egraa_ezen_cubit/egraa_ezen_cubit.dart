// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:elkhlod/Features/ezen/domain/use_cases/ezen_use_case.dart';

part 'egraa_ezen_state.dart';

class EgraaEzenCubit extends Cubit<EgraaEzenState> {
  EzenUseCase ezenUseCase;

  EgraaEzenCubit(this.ezenUseCase) : super(EgraaInitial());
  Future<void> egraaEzen(
      String empId, String eznId, String action, String reason) async {
    emit(const EgraaLoading());
    final result = await ezenUseCase.egraaEzen(empId, eznId, action, reason);

    emit(
      result.fold(
        EgraaFailed.new,
        EgraaSuccessful.new,
      ),
    );
  }
}
