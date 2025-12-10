// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

import '../../../data/models/my_messages_model/lwae7.dart';
import '../../../domain/use_cases/lwae7_use_case.dart';

part 'lwae7_state.dart';

class Lwae7Cubit extends Cubit<Lwae7State> {
  Lwae7UseCase lwae7UseCase;
  Lwae7Cubit(this.lwae7UseCase) : super(Ta3memInitial());

  Future<void> getAllLwae7List(String userId, String seen) async {
    emit(const FetchLoading());
    final result = await lwae7UseCase.callAllLwae7(userId, seen);

    emit(result.fold(FetchFailed.new, FetchSuccessful.new));
  }
}
