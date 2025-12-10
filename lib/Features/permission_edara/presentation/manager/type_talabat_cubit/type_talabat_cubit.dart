// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:elkhlod/Features/permission_edara/data/models/type_talab_model.dart';

import '../../../domain/use_cases/type_ezen_use_case.dart';

part 'type_ezen_state.dart';

class TypeTalabatCubit extends Cubit<TypeTalabatState> {
  TalabatUseCase talabatUseCase;
  TypeTalabatCubit(this.talabatUseCase) : super(MyMessagesInitial());

  Future<void> getTypesEzen() async {
    emit(const FetchLoading());
    final result = await talabatUseCase.fetchTypesTalabat();

    emit(result.fold(FetchFailed.new, FetchSuccessful.new));
  }
}
