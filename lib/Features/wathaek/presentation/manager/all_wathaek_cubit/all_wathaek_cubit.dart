// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

import '../../../data/models/all_wathaek_model.dart';
import '../../../domain/use_cases/type_mobadarat_use_case.dart';

part 'all_wathaek_state.dart';

class AllWathaekCubit extends Cubit<AllWathaekState> {
  WathaekUseCase wathaekUseCase;
  AllWathaekCubit(this.wathaekUseCase) : super(WathaekInitial());

  Future<void> getAllWathaek(String userId, String status) async {
    emit(const FetchWathaekLoading());
    final result = await wathaekUseCase.fetchAllWathaek(userId, status);

    emit(result.fold(FetchWathaekFailed.new, FetchWathaekSuccessful.new));
  }
}
