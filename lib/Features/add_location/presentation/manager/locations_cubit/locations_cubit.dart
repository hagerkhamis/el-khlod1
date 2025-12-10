// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

import '../../../data/models/locations.dart';
import '../../../domain/use_cases/locations_use_case.dart';

part 'locations_state.dart';

class LocationsCubit extends Cubit<LocationsState> {
  LocationsUseCase ta3memUseCase;
  LocationsCubit(this.ta3memUseCase) : super(LocationsInitial());

  Future<void> getAllLocations() async {
    emit(const FetchLoading());
    final result = await ta3memUseCase.callAllLocations();

    emit(result.fold(FetchFailed.new, FetchSuccessful.new));
  }
}
