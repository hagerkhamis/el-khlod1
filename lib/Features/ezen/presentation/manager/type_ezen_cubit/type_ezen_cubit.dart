// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:elkhlod/Features/ezen/data/models/types.dart';

import '../../../domain/use_cases/ezen_use_case.dart';

part 'type_ezen_state.dart';

class TypeEzenCubit extends Cubit<EzenState> {
  EzenUseCase ezenUseCase;
  TypeEzenCubit(this.ezenUseCase) : super(TypesEzenInitial());

  Future<void> getTypesEzen() async {
    emit(const FetchTypesEzenLoading());
    final result = await ezenUseCase.callTypeEzen();

    emit(result.fold(FetchTypesEzenFailed.new, FetchTypesEzenSuccessful.new));
  }
}
