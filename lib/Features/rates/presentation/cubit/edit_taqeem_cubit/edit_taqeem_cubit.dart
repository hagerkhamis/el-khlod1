// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:elkhlod/Features/rates/data/models/submitAnswer.dart';
import 'package:elkhlod/Features/rates/domain/usecases/rate_use_case.dart';

part 'edit_taqeem_state.dart';

class EditTaqeemCubit extends Cubit<EditTaqeemState> {
  RateUseCase rateUseCase;

  EditTaqeemCubit(this.rateUseCase) : super(EditeInitial());

  Future<void> editTaqeem(String tqeemId, String month, String year,
      List<SubmitAnswer> submitAnswerList) async {
    emit(const EditTaqeemLoading());
    final result =
        await rateUseCase.editTaqeem(tqeemId, month, year, submitAnswerList);

    emit(
      result.fold(
        EditTaqeemFailed.new,
        EditTaqeemSuccessful.new,
      ),
    );
  }
}
