// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:elkhlod/Features/permission_edara/data/models/all_talabat_model.dart';
import 'package:elkhlod/Features/permission_edara/domain/use_cases/type_ezen_use_case.dart';

part 'all_talabat_state.dart';

class AllTalabatCubit extends Cubit<AllTalabatState> {
  TalabatUseCase talabtUseCase;
  AllTalabatCubit(this.talabtUseCase) : super(MyMessagesInitial());

  Future<void> getAllTalabat(String userId, String status) async {
    emit(const FetchLoading());
    final result = await talabtUseCase.fetchAllTalabat(userId, status);

    emit(result.fold(FetchFailed.new, FetchSuccessful.new));
  }
}
