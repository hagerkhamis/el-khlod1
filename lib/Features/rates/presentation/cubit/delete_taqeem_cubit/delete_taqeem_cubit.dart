// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:elkhlod/Features/rates/domain/usecases/rate_use_case.dart';

part 'delete_taqeem_state.dart';

class DeleteTaqeemCubit extends Cubit<DeleteTaqeemState> {
  RateUseCase rateUseCase;

  DeleteTaqeemCubit(this.rateUseCase) : super(DeleteMessageInitial());
  Future<void> deleteTaqeem(String empId) async {
    emit(const DeleteTaqeemLoading());
    final result = await rateUseCase.deleteTaqeem(empId);

    emit(
      result.fold(
        DeleteTaqeemFailed.new,
        DeleteTaqeemSuccessful.new,
      ),
    );
  }
}
