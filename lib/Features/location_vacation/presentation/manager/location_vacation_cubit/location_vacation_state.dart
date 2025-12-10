abstract class LocationVacationState {}

class LocationVacationInitial extends LocationVacationState {}

class LocationVacationLoading extends LocationVacationState {}

class LocationVacationSuccess extends LocationVacationState {
  final String message;
  LocationVacationSuccess(this.message);
}

class LocationVacationError extends LocationVacationState {
  final String message;
  LocationVacationError(this.message);
}

class LocationVacationTypesLoaded extends LocationVacationState {
  final List<Map<String, dynamic>> types;
  LocationVacationTypesLoaded(this.types);
}
