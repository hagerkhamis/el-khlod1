// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:elkhlod/Features/visits/data/models/teachers_model.dart';
import 'package:elkhlod/Features/visits/domain/use_cases/type_visits_use_case.dart';

part 'all_teacher_state.dart';

class AllTeacherCubit extends Cubit<AllTeacherState> {
  VisitsUseCase teacherUseCase;
  AllTeacherCubit(this.teacherUseCase) : super(AllTeacherInitialState());

  Future<void> fetchAllTeacher(String userId) async {
    emit(const FetchTeacherLoading());
    final result = await teacherUseCase.fetchAllTeacher(userId);

    emit(result.fold(AllTeacherFetchFailure.new, AllTeacherFetchSuccess.new));
  }
}
