// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:elkhlod/Features/vacation/data/models/types.dart';

import '../../../domain/use_cases/vacation_use_case.dart';

part 'type_vacation_state.dart';

class TypeVacationCubit extends Cubit<VacationState> {
  VacationUseCase myMessagesUseCase;
  TypeVacationCubit(this.myMessagesUseCase) : super(MyMessagesInitial());

  Future<void> getTypesVacation() async {
    emit(const FetchLoading());
    final result = await myMessagesUseCase.callTypeVacation();

    emit(result.fold(FetchFailed.new, FetchSuccessful.new));
  }
}
