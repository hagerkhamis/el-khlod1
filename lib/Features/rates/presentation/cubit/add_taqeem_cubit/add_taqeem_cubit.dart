// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:elkhlod/Features/rates/data/models/submitAnswer.dart';
import 'package:elkhlod/Features/rates/domain/usecases/rate_use_case.dart';

part 'add_taqeem_state.dart';

class AddTaqeemCubit extends Cubit<AddTaqeemState> {
  RateUseCase rateUseCase;

  AddTaqeemCubit(this.rateUseCase) : super(DeleteMessageInitial());
  Future<void> addTaqeem(String empId, String month, String year,
      List<SubmitAnswer> submitAnswerList) async {
    emit(const AddTaqeemLoading());
    final result =
        await rateUseCase.addTaqeem(empId, month, year, submitAnswerList);

    emit(
      result.fold(
        AddTaqeemFailed.new,
        AddTaqeemSuccessful.new,
      ),
    );
  }
}
