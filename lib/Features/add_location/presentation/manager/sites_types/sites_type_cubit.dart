// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

import 'package:elkhlod/Features/add_location/data/models/sites.dart';
import 'package:elkhlod/Features/add_location/domain/use_cases/locations_use_case.dart';

part 'sites_type_state.dart';

class SitesTypeCubit extends Cubit<SitesTypeState> {
  final LocationsUseCase locationUseCase;
  bool isLoading = false;

  SitesTypeCubit(this.locationUseCase) : super(SitesTypeInitial());

  Future<void> getSitesType() async {
    emit(const SitesTypeLoading());
    final result = await locationUseCase.callAllSites();

    emit(result.fold(SitesTypeFailed.new, SitesTypeSuccessful.new));
  }
}
