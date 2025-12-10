// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

import '../../../domain/use_cases/locations_use_case.dart';

part 'delete_locations_state.dart';

class DeleteLocationsCubit extends Cubit<DeleteLocationsState> {
  LocationsUseCase ta3memUseCase;
  DeleteLocationsCubit(this.ta3memUseCase) : super(DeleteLocationsInitial());

  Future<void> getAllLocations(String id) async {
    emit(const DeleteFetchLoading());
    final result = await ta3memUseCase.callDeleteLocations(id);

    emit(result.fold(DeleteFetchFailed.new, DeleteFetchSuccessful.new));
  }
}
