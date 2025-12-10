// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:elkhlod/Features/vacation/data/models/vacation.dart';
import 'package:elkhlod/Features/vacation/domain/use_cases/vacation_use_case.dart';

part 'all_vacation_state.dart';

class AllVacationCubit extends Cubit<AllVacationState> {
  VacationUseCase vacationUseCase;
  AllVacationCubit(this.vacationUseCase) : super(MyMessagesInitial());

  Future<void> getAllMessages(String userId, String status) async {
    emit(const FetchLoading());
    final result = await vacationUseCase.allVacation(userId, status);

    emit(result.fold(FetchFailed.new, FetchSuccessful.new));
  }
}
