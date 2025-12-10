// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:elkhlod/Features/mosalat/domain/use_cases/mosalat_use_case.dart';

import '../../../data/models/my_messages_model/mosalat.dart';

part 'mosalat_state.dart';

class MosalatCubit extends Cubit<MosalatState> {
  MosalatUseCase mosalatUseCase;
  MosalatCubit(this.mosalatUseCase) : super(MosalatInitial());

  Future<void> getAllMosalat(String userId, String seen) async {
    emit(const FetchLoading());
    final result = await mosalatUseCase.callAllMosalat(userId, seen);

    emit(result.fold(FetchFailed.new, FetchSuccessful.new));
  }
}
