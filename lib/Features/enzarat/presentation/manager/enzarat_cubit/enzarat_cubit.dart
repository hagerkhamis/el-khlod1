// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

import '../../../data/models/enzarat_model/enzarat.dart';
import '../../../domain/use_cases/enzarat_use_case.dart';

part 'enzarat_state.dart';

class EnzaratCubit extends Cubit<EnzaratState> {
  EnzaratUseCase enzaratUseCase;
  EnzaratCubit(this.enzaratUseCase) : super(Ta3memInitial());

  Future<void> getAllEnzarat(String userId, String seen) async {
    emit(const FetchLoading());
    final result = await enzaratUseCase.callAllEnzarat(userId, seen);

    emit(result.fold(FetchFailed.new, FetchSuccessful.new));
  }
}
