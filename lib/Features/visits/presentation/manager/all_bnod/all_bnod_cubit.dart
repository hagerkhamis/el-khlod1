// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:elkhlod/Features/visits/data/models/bnod_model.dart';
import 'package:elkhlod/Features/visits/domain/use_cases/type_visits_use_case.dart';

part 'all_bnod_state.dart';

class AllBnodCubit extends Cubit<AllBnodState> {
  VisitsUseCase visitUseCase;
  AllBnodCubit(this.visitUseCase) : super(AllBnodInitialState());

  Future<void> fetchAllBnod(String techerId) async {
    emit(const FetchBnodLoading());
    final result = await visitUseCase.fetchAllBnod(techerId);

    emit(result.fold(AllBnodFetchFailure.new, AllBnodFetchSuccess.new));
  }
}
