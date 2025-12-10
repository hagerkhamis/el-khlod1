// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:elkhlod/Features/ezen/data/models/ezen.dart';
import 'package:elkhlod/Features/ezen/domain/use_cases/ezen_use_case.dart';

part 'all_ezen_state.dart';

class AllEzenCubit extends Cubit<AllEzenState> {
  EzenUseCase ezenUseCase;
  AllEzenCubit(this.ezenUseCase) : super(EzenInitial());

  Future<void> getAllEzen(String userId, String status) async {
    emit(const FetchEzenLoading());
    final result = await ezenUseCase.allEzen(userId, status);

    emit(result.fold(FetchEzenFailed.new, FetchEzenSuccessful.new));
  }

  Future<void> getWaredEzen(String userId) async {
    emit(const FetchEzenLoading());
    final result = await ezenUseCase.waredEzen(userId);

    emit(result.fold(FetchEzenFailed.new, FetchEzenSuccessful.new));
  }
}
