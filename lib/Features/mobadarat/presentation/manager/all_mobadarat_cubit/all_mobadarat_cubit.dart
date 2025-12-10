// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:elkhlod/Features/mobadarat/data/models/all_mobadarat_model.dart';
import 'package:elkhlod/Features/mobadarat/domain/use_cases/type_mobadarat_use_case.dart';

part 'all_mobadarat_state.dart';

class AllMobadaratCubit extends Cubit<AllMobadaratState> {
  MobadaratUseCase mobadaratUseCase;
  AllMobadaratCubit(this.mobadaratUseCase) : super(MobadaratInitial());

  Future<void> getAllMobadarat(String userId, String status) async {
    emit(const FetchMobadaratLoading());
    final result = await mobadaratUseCase.fetchAllMobadarat(userId, status);

    emit(result.fold(FetchMobadaratFailed.new, FetchMobadaratSuccessful.new));
  }
}
