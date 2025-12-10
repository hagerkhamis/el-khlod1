// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:elkhlod/Features/visits/domain/use_cases/type_visits_use_case.dart';

part 'delete_visits_state.dart';

class DeleteVisitsCubit extends Cubit<DeleteVisitsState> {
  VisitsUseCase visitsUseCase;

  DeleteVisitsCubit(this.visitsUseCase) : super(DeleteVisitsInitial());
  Future<void> deleteVisits(String mobadaratId, String userId) async {
    emit(const DeleteVisitsLoading());
    final result = await visitsUseCase.deleteVisits(mobadaratId, userId);

    emit(result.fold(DeleteVisitsFailed.new, DeleteVisitsSuccessful.new));
  }
}
