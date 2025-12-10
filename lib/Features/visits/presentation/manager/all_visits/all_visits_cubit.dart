// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:elkhlod/Features/visits/data/models/all_visits_model.dart';
import 'package:elkhlod/Features/visits/domain/use_cases/type_visits_use_case.dart';

part 'all_visits_state.dart';

class AllVisitsCubit extends Cubit<AllVisitsState> {
  VisitsUseCase mobadaratUseCase;
  AllVisitsCubit(this.mobadaratUseCase) : super(AllVisitsInitialState());

  Future<void> fetchAllVisits(String userId, String status) async {
    emit(const FetchVisitsLoading());
    final result = await mobadaratUseCase.fetchAllVisits(userId, status);

    emit(result.fold(AllVisitsFetchFailure.new, AllVisitsFetchSuccess.new));
  }
}
