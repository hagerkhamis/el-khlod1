// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:elkhlod/Features/visits/domain/use_cases/type_visits_use_case.dart';

part 'add_visits_state.dart';

class AddVisitsCubit extends Cubit<AddVisitsState> {
  VisitsUseCase visitsUseCase;

  AddVisitsCubit(this.visitsUseCase) : super(AddVisitsInitial());
  Future<void> addVisits(
    String empId,
    String techerId,
    String title,
    String reason,
    String hesa,
    String numStudent,
    String fasl,
    var listBnod,
  ) async {
    emit(const AddVisitsLoading());
    final result = await visitsUseCase.addVisits(empId, techerId,title, reason, hesa,
        numStudent, fasl, listBnod);

    emit(
      result.fold(
        AddVisitsFailed.new,
        AddVisitsSuccessful.new,
      ),
    );
  }
}
